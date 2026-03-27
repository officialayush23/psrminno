from pydantic_settings import BaseSettings, SettingsConfigDict
from typing import Optional


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file=".env", extra="ignore")

    DATABASE_URL:    str
    GEMINI_API_KEY:  str
    NOMIC_API_KEY:   str
    GROQ_API_KEY:    str

    # Firebase Auth is used — JWT secret kept optional for legacy compatibility
    AUTH_JWT_SECRET:                    str     = "unused-firebase-auth-only"
    AUTH_JWT_ALGORITHM:                 str     = "HS256"
    AUTH_ACCESS_TOKEN_EXPIRE_MINUTES:   int     = 60
    SUPABASE_JWT_SECRET:                Optional[str] = None

    # GCS / Storage
    GCS_ENABLED:                    bool          = False
    GCS_BUCKET_NAME:                Optional[str] = None
    GCS_PROJECT_ID:                 Optional[str] = None
    GCS_UPLOAD_PREFIX:              str           = "complaints"
    GCS_EMBEDDINGS_PREFIX:          str           = "embeddings"
    GCS_STRICT_MODE:                bool          = False
    GCS_SERVICE_ACCOUNT_KEY_PATH:   Optional[str] = None
    GOOGLE_APPLICATION_CREDENTIALS: Optional[str] = None

    # Firebase
    FIREBASE_SERVICE_ACCOUNT_PATH:  str           = "serviceAccountKey.json"
    FIREBASE_PROJECT_ID:            Optional[str] = None

    # Pub/Sub
    PUBSUB_ENABLED:     bool          = False
    PUBSUB_PUSH_SECRET: Optional[str] = None

    # Vertex AI
    VERTEX_AI_LOCATION: str = "asia-south1"

    # SMTP — accept either SMTP_USER or SMTP_USERNAME from environment
    SMTP_HOST:     Optional[str] = None
    SMTP_PORT:     int           = 587
    SMTP_USER:     Optional[str] = None      # preferred field name
    SMTP_USERNAME: Optional[str] = None      # alias
    SMTP_PASSWORD: Optional[str] = None

    # Misc
    GOOGLE_GEOCODING_API_KEY: Optional[str] = None

    def model_post_init(self, __context) -> None:
        # If SMTP_USER not set but SMTP_USERNAME is, copy it over
        if not self.SMTP_USER and self.SMTP_USERNAME:
            object.__setattr__(self, "SMTP_USER", self.SMTP_USERNAME)


settings = Settings()