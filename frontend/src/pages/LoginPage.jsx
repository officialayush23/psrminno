import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { login, getMe } from "../api/authApi";
import client from "../api/client";

export default function LoginPage() {
  const navigate = useNavigate();
  const [email, setEmail]       = useState("");
  const [password, setPassword] = useState("");
  const [error, setError]       = useState("");
  const [loading, setLoading]   = useState(false);

  const handleSubmit = async (event) => {
    event.preventDefault();
    setError("");
    setLoading(true);

    try {
      const data = await login(email, password);
      localStorage.setItem("auth_user", JSON.stringify(data));
      navigate("/submit");
    } catch (err) {
      // Firebase-specific error codes
      if (
        err.code === "auth/invalid-credential" ||
        err.code === "auth/user-not-found"    ||
        err.code === "auth/wrong-password"
      ) {
        setError("Invalid email or password.");
      } else if (err.code === "auth/too-many-requests") {
        setError("Too many failed attempts. Try again later.");
      } else if (err.response?.status === 403) {
        setError("Your account has been deactivated.");
      } else {
        setError(err.response?.data?.detail || err.message || "Login failed.");
      }
    } finally {
      setLoading(false);
    }
  };

  return (
    <PageShell title="PSRM Sign In">
      <form onSubmit={handleSubmit} className="wireframe-form">
        <label>
          Email
          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
        </label>

        <label>
          Password
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
        </label>

        {error && <p className="error-text">{error}</p>}

        <button className="submit-btn-large" type="submit" disabled={loading}>
          {loading ? "Signing in..." : "Sign In"}
        </button>

        <p className="auth-helper">
          New user? <Link to="/signup">Create account</Link>
        </p>
      </form>
    </PageShell>
  );
}