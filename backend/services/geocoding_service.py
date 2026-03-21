# backend/services/geocoding_service.py
# backend/services/geocoding_service.py
"""
Google Geocoding API service.

reverse_geocode(lat, lng) → formatted address string or None
forward_geocode(address)  → {"lat", "lng", "formatted"} or None

Both cached in-process to avoid redundant API calls.
"""
import logging
from typing import Optional, Dict, Any

import httpx

from config import settings

logger    = logging.getLogger(__name__)
_cache: dict = {}

GEOCODE_BASE = "https://maps.googleapis.com/maps/api/geocode/json"


def reverse_geocode(lat: float, lng: float) -> Optional[str]:
    """
    Returns a formatted address string for the given coordinates.
    Result cached by (lat, lng) rounded to 5 decimal places.
    Returns None if API is not configured or call fails.
    """
    key = ("rev", round(lat, 5), round(lng, 5))
    if key in _cache:
        return _cache[key]

    if not settings.GOOGLE_GEOCODING_API_KEY:
        logger.debug("GOOGLE_GEOCODING_API_KEY not set — skipping reverse geocode")
        return None

    try:
        resp = httpx.get(
            GEOCODE_BASE,
            params={
                "latlng":      f"{lat},{lng}",
                "key":         settings.GOOGLE_GEOCODING_API_KEY,
                "language":    "en",
                "result_type": "street_address|route|sublocality|locality",
            },
            timeout=5.0,
        )
        resp.raise_for_status()
        data = resp.json()

        if data.get("status") != "OK" or not data.get("results"):
            logger.warning(
                "Reverse geocode no result for %.5f,%.5f: %s",
                lat, lng, data.get("status"),
            )
            return None

        address      = data["results"][0]["formatted_address"]
        _cache[key]  = address
        logger.info("Reverse geocoded (%.5f, %.5f) → %s", lat, lng, address)
        return address

    except Exception as exc:
        logger.error("Reverse geocode failed (%.5f, %.5f): %s", lat, lng, exc)
        return None


def forward_geocode(address: str) -> Optional[Dict[str, Any]]:
    """
    Returns {"lat", "lng", "formatted"} for the given address.
    Biased toward Delhi NCR bounding box.
    Returns None if no result or API not configured.
    """
    norm_key = ("fwd", address.strip().lower())
    if norm_key in _cache:
        return _cache[norm_key]

    if not settings.GOOGLE_GEOCODING_API_KEY or not address.strip():
        return None

    try:
        resp = httpx.get(
            GEOCODE_BASE,
            params={
                "address":  f"{address.strip()}, Delhi",
                "key":      settings.GOOGLE_GEOCODING_API_KEY,
                "language": "en",
                "bounds":   "28.4041,76.8378|28.8833,77.3472",
                "region":   "in",
            },
            timeout=5.0,
        )
        resp.raise_for_status()
        data = resp.json()

        if data.get("status") != "OK" or not data.get("results"):
            return None

        r      = data["results"][0]
        loc    = r["geometry"]["location"]
        result = {
            "lat":       float(loc["lat"]),
            "lng":       float(loc["lng"]),
            "formatted": r["formatted_address"],
        }
        _cache[norm_key] = result
        logger.info("Forward geocoded '%s' → %s", address, result)
        return result

    except Exception as exc:
        logger.error("Forward geocode failed '%s': %s", address, exc)
        return None