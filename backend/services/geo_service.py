# backend/services/geo_service.py
from sqlalchemy import text

def find_nearest_asset(db, lat, lng):

    query = text("""
        SELECT id
        FROM assets
        ORDER BY location <-> ST_SetSRID(ST_MakePoint(:lng,:lat),4326)
        LIMIT 1
    """)

    result = db.execute(query,{
        "lat":lat,
        "lng":lng
    }).fetchone()

    if result:
        return result[0]

    return None