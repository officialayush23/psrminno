import { useEffect, useState } from "react";
import AppLayout from "../components/AppLayout";
import { getMe, updateMe } from "../api/authApi";
import { fetchMyStats } from "../api/complaintsApi";

const LANGUAGE_OPTIONS = [
  { code: "en", label: "English" },
  { code: "hi", label: "Hindi (हिन्दी)" },
  { code: "pa", label: "Punjabi (ਪੰਜਾਬੀ)" },
  { code: "ur", label: "Urdu (اردو)" },
  { code: "ta", label: "Tamil (தமிழ்)" },
  { code: "te", label: "Telugu (తెలుగు)" },
  { code: "mr", label: "Marathi (मराठी)" },
  { code: "bn", label: "Bengali (বাংলা)" },
];

export default function ProfilePage() {
  const [form, setForm] = useState({
    full_name: "",
    email: "",
    phone: "",
    role: "citizen",
    preferred_language: "hi",
    email_opt_in: true,
    twilio_opt_in: true,
  });
  const [stats, setStats] = useState(null);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [saveStatus, setSaveStatus] = useState(null); // "success" | "error" | null
  const [saveError, setSaveError] = useState("");

  useEffect(() => {
    async function load() {
      setLoading(true);
      try {
        const [user, statsRes] = await Promise.all([getMe(), fetchMyStats()]);
        setForm({
          full_name: user.full_name || "",
          email: user.email || "",
          phone: user.phone || "",
          role: user.role || "citizen",
          preferred_language: user.preferred_language || "hi",
          email_opt_in: user.email_opt_in ?? true,
          twilio_opt_in: user.twilio_opt_in ?? true,
        });
        setStats(statsRes);
        // Update localStorage with fresh data
        const stored = JSON.parse(localStorage.getItem("auth_user") || "{}");
        localStorage.setItem("auth_user", JSON.stringify({ ...stored, ...user }));
      } catch (e) {
        // Fallback to localStorage if API fails
        const stored = JSON.parse(localStorage.getItem("auth_user") || "{}");
        setForm((f) => ({
          ...f,
          full_name: stored.full_name || "",
          email: stored.email || "",
          phone: stored.phone || "",
          role: stored.role || "citizen",
          preferred_language: stored.preferred_language || "hi",
          email_opt_in: stored.email_opt_in ?? true,
          twilio_opt_in: stored.twilio_opt_in ?? true,
        }));
      } finally {
        setLoading(false);
      }
    }
    load();
  }, []);

  async function handleSave(e) {
    e.preventDefault();
    setSaving(true);
    setSaveStatus(null);
    setSaveError("");
    try {
      const updated = await updateMe({
        full_name: form.full_name,
        phone: form.phone || null,
        preferred_language: form.preferred_language,
        email_opt_in: form.email_opt_in,
        twilio_opt_in: form.twilio_opt_in,
      });
      // Update localStorage
      const stored = JSON.parse(localStorage.getItem("auth_user") || "{}");
      localStorage.setItem("auth_user", JSON.stringify({ ...stored, ...updated }));
      setSaveStatus("success");
      setTimeout(() => setSaveStatus(null), 3000);
    } catch (e) {
      setSaveStatus("error");
      setSaveError(e.response?.data?.detail || "Failed to save changes");
    } finally {
      setSaving(false);
    }
  }

  const initials = form.full_name
    ? form.full_name.split(" ").map((w) => w[0]).slice(0, 2).join("").toUpperCase()
    : "?";

  const ROLE_LABEL = {
    citizen: "Citizen",
    admin: "Admin",
    super_admin: "Super Admin",
    official: "Official",
    worker: "Worker",
    contractor: "Contractor",
  };

  return (
    <AppLayout>
      <div className="p-6 max-w-3xl mx-auto flex flex-col gap-6">
        {/* Avatar Card */}
        <div className="bg-gradient-to-br from-primary/20 via-surface-container to-surface-container-high border border-outline-variant rounded-2xl p-6 flex items-center gap-5">
          <div className="w-20 h-20 rounded-full bg-primary text-on-primary flex items-center justify-center text-2xl font-bold flex-shrink-0">
            {loading ? "…" : initials}
          </div>
          <div>
            <h1 className="text-xl font-headline font-bold text-on-surface">
              {loading ? "Loading…" : form.full_name || "—"}
            </h1>
            <p className="text-sm text-on-surface-variant">{form.email}</p>
            <span className="mt-1 inline-block text-xs font-semibold px-2.5 py-0.5 rounded-full bg-primary/10 text-primary capitalize">
              {ROLE_LABEL[form.role] || form.role}
            </span>
          </div>
        </div>

        {/* Stats */}
        <div className="grid grid-cols-2 sm:grid-cols-3 gap-3">
          {[
            { label: "Total Complaints", value: stats?.total_count, icon: "receipt_long" },
            { label: "Active", value: stats?.active_count, icon: "pending" },
            { label: "Resolved", value: stats?.resolved_count, icon: "check_circle" },
          ].map((s) => (
            <div
              key={s.label}
              className="bg-surface-container-low border border-outline-variant rounded-2xl p-4 flex items-center gap-3"
            >
              <span className="material-symbols-outlined text-primary text-[22px]">{s.icon}</span>
              <div>
                <p className="text-xl font-headline font-bold text-on-surface">
                  {loading ? "…" : (s.value ?? "—")}
                </p>
                <p className="text-xs text-on-surface-variant">{s.label}</p>
              </div>
            </div>
          ))}
        </div>

        {/* Edit Form */}
        <form onSubmit={handleSave} className="bg-surface-container-low border border-outline-variant rounded-2xl p-6 flex flex-col gap-5">
          <h2 className="font-headline font-semibold text-on-surface flex items-center gap-2">
            <span className="material-symbols-outlined text-[20px] text-primary">edit</span>
            Personal Information
          </h2>

          <div className="grid sm:grid-cols-2 gap-4">
            <div className="flex flex-col gap-1.5">
              <label className="text-xs font-semibold text-on-surface-variant uppercase tracking-wide">
                Full Name
              </label>
              <input
                value={form.full_name}
                onChange={(e) => setForm((f) => ({ ...f, full_name: e.target.value }))}
                className="border border-outline-variant bg-surface-container rounded-xl px-3 py-2.5 text-sm text-on-surface outline-none focus:border-primary transition"
                placeholder="Your full name"
              />
            </div>
            <div className="flex flex-col gap-1.5">
              <label className="text-xs font-semibold text-on-surface-variant uppercase tracking-wide">
                Email
              </label>
              <input
                value={form.email}
                disabled
                className="border border-outline-variant bg-surface-container/50 rounded-xl px-3 py-2.5 text-sm text-on-surface-variant outline-none cursor-not-allowed"
              />
            </div>
            <div className="flex flex-col gap-1.5">
              <label className="text-xs font-semibold text-on-surface-variant uppercase tracking-wide">
                Phone
              </label>
              <input
                value={form.phone}
                onChange={(e) => setForm((f) => ({ ...f, phone: e.target.value }))}
                placeholder="+91 xxxxxxxxxx"
                className="border border-outline-variant bg-surface-container rounded-xl px-3 py-2.5 text-sm text-on-surface outline-none focus:border-primary transition"
              />
            </div>
            <div className="flex flex-col gap-1.5">
              <label className="text-xs font-semibold text-on-surface-variant uppercase tracking-wide">
                Preferred Language
              </label>
              <select
                value={form.preferred_language}
                onChange={(e) => setForm((f) => ({ ...f, preferred_language: e.target.value }))}
                className="border border-outline-variant bg-surface-container rounded-xl px-3 py-2.5 text-sm text-on-surface outline-none focus:border-primary transition"
              >
                {LANGUAGE_OPTIONS.map((l) => (
                  <option key={l.code} value={l.code}>{l.label}</option>
                ))}
              </select>
            </div>
          </div>

          {/* Notification prefs */}
          <div className="border-t border-outline-variant pt-5">
            <h3 className="font-semibold text-sm text-on-surface mb-3">Notification Preferences</h3>
            <div className="flex flex-col gap-3">
              {[
                { key: "email_opt_in", label: "Email Notifications", icon: "email" },
                { key: "twilio_opt_in", label: "WhatsApp / SMS Notifications", icon: "whatsapp" },
              ].map((pref) => (
                <div key={pref.key} className="flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    <span className="material-symbols-outlined text-[18px] text-on-surface-variant">
                      {pref.icon === "whatsapp" ? "chat" : pref.icon}
                    </span>
                    <span className="text-sm text-on-surface">{pref.label}</span>
                  </div>
                  <button
                    type="button"
                    onClick={() => setForm((f) => ({ ...f, [pref.key]: !f[pref.key] }))}
                    className={`w-11 h-6 rounded-full transition-colors relative ${
                      form[pref.key] ? "bg-primary" : "bg-outline-variant"
                    }`}
                  >
                    <span
                      className={`block w-4 h-4 rounded-full bg-white absolute top-1 transition-all ${
                        form[pref.key] ? "left-6" : "left-1"
                      }`}
                    />
                  </button>
                </div>
              ))}
            </div>
          </div>

          {/* Save feedback */}
          {saveStatus === "success" && (
            <div className="bg-green-50 border border-green-200 rounded-xl p-3 text-green-700 text-sm flex items-center gap-2">
              <span className="material-symbols-outlined text-[18px]">check_circle</span>
              Profile saved successfully!
            </div>
          )}
          {saveStatus === "error" && (
            <div className="bg-error/10 border border-error/30 rounded-xl p-3 text-error text-sm flex items-center gap-2">
              <span className="material-symbols-outlined text-[18px]">error</span>
              {saveError}
            </div>
          )}

          <button
            type="submit"
            disabled={saving || loading}
            className="self-start bg-primary text-on-primary px-6 py-2.5 rounded-full text-sm font-semibold hover:bg-primary/90 transition disabled:opacity-50 flex items-center gap-2"
          >
            {saving ? (
              <>
                <span className="material-symbols-outlined animate-spin text-[16px]">progress_activity</span>
                Saving…
              </>
            ) : (
              "Save Changes"
            )}
          </button>
        </form>
      </div>
    </AppLayout>
  );
}
