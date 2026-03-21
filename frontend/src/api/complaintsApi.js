// src/api/complaintsApi.js

import client from "./client";

// ── Infra Types ───────────────────────────────────────────────────

export async function fetchInfraTypes() {
  const { data } = await client.get("/complaints/infra-types");
  return data; // [{ id, name, code, metadata }]
}

// ── Google Geocoding (client-side) ────────────────────────────────
// Used for UI preview only — the backend also reverse-geocodes at
// ingest time using the server-side GOOGLE_GEOCODING_API_KEY.
// Use the same API key, but restrict the browser key to
// "Maps JavaScript API + Geocoding API" in the GCP console.

const GEO_KEY = import.meta.env.VITE_GOOGLE_GEOCODING_API_KEY;
const GEO_URL = "https://maps.googleapis.com/maps/api/geocode/json";

/**
 * Reverse geocode lat/lng → formatted address string.
 * Returns null if API key not set or request fails.
 */
export async function reverseGeocode(lat, lng) {
  if (!GEO_KEY) return null;
  try {
    const resp = await fetch(
      `${GEO_URL}?latlng=${lat},${lng}&key=${GEO_KEY}&language=en` +
      `&result_type=street_address|route|sublocality|locality`
    );
    const data = await resp.json();
    if (data.status === "OK" && data.results?.length > 0) {
      return data.results[0].formatted_address;
    }
  } catch {
    // silent — address is always optional
  }
  return null;
}

/**
 * Forward geocode address string → { lat, lng, formatted }.
 * Biased to Delhi NCR. Returns null on failure.
 */
export async function forwardGeocode(address) {
  if (!GEO_KEY || !address?.trim()) return null;
  try {
    const resp = await fetch(
      `${GEO_URL}?address=${encodeURIComponent(address + ", Delhi")}` +
      `&key=${GEO_KEY}&language=en&region=in` +
      `&bounds=28.4041,76.8378|28.8833,77.3472`
    );
    const data = await resp.json();
    if (data.status === "OK" && data.results?.length > 0) {
      const r   = data.results[0];
      const loc = r.geometry.location;
      return { lat: loc.lat, lng: loc.lng, formatted: r.formatted_address };
    }
  } catch {
    // silent
  }
  return null;
}

// ── Complaint Submission ──────────────────────────────────────────

/**
 * Submit a civic complaint.
 *
 * address_text is the single human-readable location field.
 * Pass whatever the user sees in the address box — either what they
 * typed OR the string returned by reverseGeocode(). The backend will
 * also independently reverse-geocode if address_text is empty.
 *
 * Infra type resolution order (backend):
 *   1. infraTypeId provided  → used directly
 *   2. customInfraTypeName   → new infra_type row created
 *   3. neither               → Groq AI infers from description
 */
export async function submitComplaint({
  text,
  lat,
  lng,
  image,
  language           = "en",
  infraTypeId,           // UUID string — user selected a known type
  customInfraTypeName,   // string — user chose "Something Else"
  title,
  addressText,           // single address field — typed or reverse-geocoded
  priority           = "normal",
  voiceTranscript,
}) {
  const formData = new FormData();

  formData.append("description",       text);
  formData.append("original_language", language);
  formData.append("lat",               String(lat));
  formData.append("lng",               String(lng));
  formData.append("priority",          priority);

  if (title)           formData.append("title",            title);
  if (addressText?.trim())
                       formData.append("address_text",     addressText.trim());
  if (voiceTranscript) formData.append("voice_transcript", voiceTranscript);
  if (image)           formData.append("image",            image);

  // Infra type — send at most one of these
  if (infraTypeId)
    formData.append("infra_type_id",         infraTypeId);
  else if (customInfraTypeName?.trim())
    formData.append("custom_infra_type_name", customInfraTypeName.trim());
  // else: nothing → backend AI infers

  const { data } = await client.post("/complaints/ingest", formData, {
    headers: { "Content-Type": "multipart/form-data" },
  });
  return data;
}

// ── Single complaint ──────────────────────────────────────────────

export async function fetchComplaintById(complaintId) {
  const { data } = await client.get(`/complaints/${complaintId}`);
  return data;
}

export async function fetchComplaintHistory(complaintId) {
  const { data } = await client.get(`/complaints/${complaintId}/history`);
  return data;
}

// ── My complaints ─────────────────────────────────────────────────

export async function fetchMyComplaints({ limit = 20, offset = 0, status } = {}) {
  const params = { limit, offset };
  if (status) params.status = status;
  const { data } = await client.get("/complaints", { params });
  return data; // { total, limit, offset, items }
}

export async function fetchMyStats() {
  const { data } = await client.get("/stats/me");
  return data;
}

// ── Map data ──────────────────────────────────────────────────────

export async function fetchMapPins() {
  const { data } = await client.get("/complaints/map-pins");
  return data;
}

export async function fetchNearbyComplaints(lat, lng, radiusMeters = 4000) {
  const { data } = await client.get("/complaints/nearby", {
    params: { lat, lng, radius_meters: radiusMeters },
  });
  return data;
}

export async function fetchAllComplaints({ status, infraTypeCode } = {}) {
  const params = {};
  if (status)        params.status          = status;
  if (infraTypeCode) params.infra_type_code = infraTypeCode;
  const { data } = await client.get("/complaints/all", { params });
  return data;
}