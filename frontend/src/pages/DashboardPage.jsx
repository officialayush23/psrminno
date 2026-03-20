import { useEffect, useState, useRef } from "react";
import { Link, useNavigate } from "react-router-dom";
import { MapContainer, TileLayer, Marker, Popup, ZoomControl } from "react-leaflet";
import L from "leaflet";
import AppLayout from "../components/AppLayout";
import { fetchMyComplaints, fetchMapPins, fetchMyStats } from "../api/complaintsApi";

// Fix leaflet default icon
delete L.Icon.Default.prototype._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png",
  iconUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png",
  shadowUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png",
});

const STATUS_COLOR = {
  received: "#6750A4",
  clustered: "#6750A4",
  mapped: "#6750A4",
  workflow_started: "#2196F3",
  in_progress: "#FF9800",
  midway_survey_sent: "#FF9800",
  resolved: "#4CAF50",
  closed: "#4CAF50",
  rejected: "#F44336",
  escalated: "#F44336",
  emergency: "#B00020",
  constraint_blocked: "#795548",
};

const STATUS_LABEL = {
  received: "Received",
  clustered: "Clustered",
  mapped: "Mapped",
  workflow_started: "Workflow Started",
  in_progress: "In Progress",
  midway_survey_sent: "Survey Sent",
  resolved: "Resolved",
  closed: "Closed",
  rejected: "Rejected",
  escalated: "Escalated",
  emergency: "Emergency",
  constraint_blocked: "Blocked",
};

function makeIcon(color) {
  return L.divIcon({
    className: "",
    html: `<div style="width:14px;height:14px;border-radius:50%;background:${color};border:2px solid white;box-shadow:0 1px 4px rgba(0,0,0,.4)"></div>`,
    iconSize: [14, 14],
    iconAnchor: [7, 7],
  });
}

function getStepIndex(status) {
  const ORDER = ["received","clustered","mapped","workflow_started","in_progress","resolved","closed"];
  const idx = ORDER.indexOf(status);
  return idx === -1 ? 0 : idx;
}

function timeAgo(isoString) {
  if (!isoString) return "";
  const diff = Date.now() - new Date(isoString).getTime();
  const mins = Math.floor(diff / 60000);
  if (mins < 1) return "just now";
  if (mins < 60) return `${mins}m ago`;
  const hrs = Math.floor(mins / 60);
  if (hrs < 24) return `${hrs}h ago`;
  return `${Math.floor(hrs / 24)}d ago`;
}

export default function DashboardPage() {
  const navigate = useNavigate();
  const user = JSON.parse(localStorage.getItem("auth_user") || "{}");
  const mapRef = useRef(null);

  const [complaints, setComplaints] = useState([]);
  const [pins, setPins] = useState([]);
  const [stats, setStats] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [lastUpdated, setLastUpdated] = useState(null);

  useEffect(() => {
    async function load() {
      setLoading(true);
      try {
        const [complaintsRes, pinsRes, statsRes] = await Promise.all([
          fetchMyComplaints({ limit: 5 }),
          fetchMapPins(),
          fetchMyStats(),
        ]);
        setComplaints(complaintsRes.items || []);
        setPins(pinsRes || []);
        setStats(statsRes);
        setLastUpdated(new Date().toISOString());
      } catch (e) {
        setError("Failed to load dashboard data. Please try again.");
      } finally {
        setLoading(false);
      }
    }
    load();
  }, []);

  const activeComplaints = complaints.filter(
    (c) => !["resolved", "closed", "rejected"].includes(c.status)
  );
  const resolvedComplaints = complaints.filter((c) =>
    ["resolved", "closed"].includes(c.status)
  );

  // Map center: average of pins, or Delhi default
  const mapCenter =
    pins.length > 0
      ? [
          pins.reduce((s, p) => s + p.lat, 0) / pins.length,
          pins.reduce((s, p) => s + p.lng, 0) / pins.length,
        ]
      : [28.6139, 77.209];

  // SLA ring — based on real stats
  const totalActive = stats?.active_count ?? 0;
  const totalResolved = stats?.resolved_count ?? 0;
  const totalAll = stats?.total_count ?? 1;
  const slaPercent = totalAll > 0 ? Math.round((totalResolved / totalAll) * 100) : 0;
  const circumference = 2 * Math.PI * 24;
  const slaOffset = circumference * (1 - slaPercent / 100);

  return (
    <AppLayout>
      <div className="flex flex-col gap-6 p-6 lg:flex-row min-h-0">
        {/* ── LEFT COLUMN ── */}
        <div className="flex flex-col gap-5 lg:w-[58%]">
          {/* Header */}
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-2xl font-headline font-bold text-on-surface">
                Namaskar, {user.full_name?.split(" ")[0] || "Citizen"} 🙏
              </h1>
              <p className="text-sm text-on-surface-variant mt-0.5">
                {loading
                  ? "Loading your grievances…"
                  : `${stats?.total_count ?? 0} total · ${stats?.active_count ?? 0} active · ${stats?.resolved_count ?? 0} resolved`}
              </p>
            </div>
            <Link
              to="/submit"
              className="bg-primary text-on-primary px-5 py-2.5 rounded-full text-sm font-semibold hover:bg-primary/90 transition flex items-center gap-2"
            >
              <span className="material-symbols-outlined text-[18px]">add</span>
              New Report
            </Link>
          </div>

          {error && (
            <div className="bg-error/10 border border-error/30 rounded-xl p-4 text-error text-sm">
              {error}
            </div>
          )}

          {/* Map */}
          <div className="relative rounded-2xl overflow-hidden border border-outline-variant">
            <div className="absolute top-3 left-3 z-[500] bg-surface/90 backdrop-blur-sm px-3 py-1.5 rounded-full flex items-center gap-2 text-xs font-medium shadow-sm">
              <span className="w-2 h-2 rounded-full bg-green-500 animate-pulse" />
              {pins.length > 0 ? `${pins.length} complaints mapped` : "No locations yet"}
              {lastUpdated && (
                <span className="text-on-surface-variant ml-1">· {timeAgo(lastUpdated)}</span>
              )}
            </div>

            <MapContainer
              center={mapCenter}
              zoom={11}
              scrollWheelZoom={false}
              style={{ height: "300px", width: "100%" }}
              zoomControl={false}
              ref={mapRef}
            >
              <TileLayer
                attribution='&copy; <a href="https://osm.org/copyright">OSM</a>'
                url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
              />
              <ZoomControl position="bottomright" />
              {pins.map((pin) => (
                <Marker
                  key={pin.id}
                  position={[pin.lat, pin.lng]}
                  icon={makeIcon(STATUS_COLOR[pin.status] || "#6750A4")}
                >
                  <Popup>
                    <div className="text-sm">
                      <p className="font-bold">{pin.title}</p>
                      <p className="text-xs capitalize">{STATUS_LABEL[pin.status] || pin.status}</p>
                      <Link
                        to={`/complaints/${pin.id}`}
                        className="text-primary underline text-xs"
                      >
                        View details →
                      </Link>
                    </div>
                  </Popup>
                </Marker>
              ))}
            </MapContainer>

            {/* Map legend */}
            <div className="absolute bottom-3 left-3 z-[500] bg-surface/90 backdrop-blur-sm px-3 py-1.5 rounded-xl text-xs shadow-sm flex gap-3">
              {["in_progress", "resolved", "rejected"].map((s) => (
                <span key={s} className="flex items-center gap-1.5">
                  <span
                    className="w-2 h-2 rounded-full"
                    style={{ background: STATUS_COLOR[s] }}
                  />
                  {STATUS_LABEL[s]} ({pins.filter((p) => p.status === s).length})
                </span>
              ))}
            </div>
          </div>

          {/* Recent Complaints */}
          <div className="bg-surface-container-low rounded-2xl p-5 border border-outline-variant">
            <div className="flex items-center justify-between mb-4">
              <h2 className="font-headline font-semibold text-on-surface flex items-center gap-2">
                <span className="material-symbols-outlined text-[20px] text-primary">
                  receipt_long
                </span>
                Recent Complaints
              </h2>
              <Link to="/my-complaints" className="text-primary text-sm hover:underline">
                View all →
              </Link>
            </div>

            {loading ? (
              <div className="flex flex-col gap-3">
                {[1, 2, 3].map((n) => (
                  <div key={n} className="h-16 rounded-xl bg-outline-variant/30 animate-pulse" />
                ))}
              </div>
            ) : complaints.length === 0 ? (
              <div className="text-center py-8 text-on-surface-variant">
                <span className="material-symbols-outlined text-5xl mb-2">inbox</span>
                <p className="text-sm">No complaints filed yet.</p>
                <Link to="/submit" className="text-primary text-sm mt-1 inline-block hover:underline">
                  File your first one →
                </Link>
              </div>
            ) : (
              <div className="flex flex-col gap-3">
                {complaints.map((c) => (
                  <div
                    key={c.id}
                    className="flex items-start gap-3 p-3 rounded-xl bg-surface-container hover:bg-surface-container-high transition cursor-pointer"
                    onClick={() => navigate(`/complaints/${c.id}`)}
                  >
                    <div className="flex flex-col gap-1 flex-1 min-w-0">
                      <div className="flex items-center gap-2">
                        <span className="text-xs text-on-surface-variant font-mono">
                          #{c.complaint_number}
                        </span>
                        <span
                          className="text-xs font-semibold px-2 py-0.5 rounded-full capitalize"
                          style={{
                            background: STATUS_COLOR[c.status] + "22",
                            color: STATUS_COLOR[c.status],
                          }}
                        >
                          {STATUS_LABEL[c.status] || c.status}
                        </span>
                        {c.is_repeat_complaint && (
                          <span className="text-xs text-error font-semibold">Repeat</span>
                        )}
                      </div>
                      <p className="text-sm font-medium text-on-surface truncate">{c.title}</p>
                      {c.address_text && (
                        <p className="text-xs text-on-surface-variant truncate">{c.address_text}</p>
                      )}
                    </div>
                    <div className="text-right text-xs text-on-surface-variant whitespace-nowrap">
                      {timeAgo(c.created_at)}
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </div>

        {/* ── RIGHT COLUMN ── */}
        <div className="flex flex-col gap-5 lg:w-[42%]">
          {/* Stats Row */}
          <div className="grid grid-cols-3 gap-3">
            {[
              { label: "Total", value: stats?.total_count ?? "—", icon: "receipt_long" },
              { label: "Active", value: stats?.active_count ?? "—", icon: "pending" },
              { label: "Resolved", value: stats?.resolved_count ?? "—", icon: "check_circle" },
            ].map((s) => (
              <div
                key={s.label}
                className="bg-surface-container-low rounded-2xl p-4 border border-outline-variant flex flex-col items-center gap-1"
              >
                <span className="material-symbols-outlined text-primary text-[24px]">
                  {s.icon}
                </span>
                <span className="text-2xl font-headline font-bold text-on-surface">
                  {loading ? "…" : s.value}
                </span>
                <span className="text-xs text-on-surface-variant">{s.label}</span>
              </div>
            ))}
          </div>

          {/* SLA Tracker */}
          <div className="bg-surface-container-low rounded-2xl p-5 border border-outline-variant">
            <h2 className="font-headline font-semibold text-on-surface mb-4 flex items-center gap-2">
              <span className="material-symbols-outlined text-[20px] text-primary">timer</span>
              Resolution Rate
            </h2>
            <div className="flex items-center gap-6">
              <div className="relative w-16 h-16">
                <svg className="rotate-[-90deg]" width="64" height="64" viewBox="0 0 64 64">
                  <circle cx="32" cy="32" r="24" fill="none" stroke="#e8def8" strokeWidth="6" />
                  <circle
                    cx="32"
                    cy="32"
                    r="24"
                    fill="none"
                    stroke="#6750A4"
                    strokeWidth="6"
                    strokeLinecap="round"
                    strokeDasharray={circumference}
                    strokeDashoffset={slaOffset}
                  />
                </svg>
                <span className="absolute inset-0 flex items-center justify-center text-sm font-bold text-on-surface">
                  {loading ? "…" : `${slaPercent}%`}
                </span>
              </div>
              <div>
                <p className="text-sm font-medium text-on-surface">
                  {loading ? "Loading…" : `${totalResolved} of ${totalAll} resolved`}
                </p>
                {stats?.avg_resolution_days != null && (
                  <p className="text-xs text-on-surface-variant mt-1">
                    Avg. {stats.avg_resolution_days} days to resolve
                  </p>
                )}
                <span
                  className={`text-xs font-semibold mt-1 inline-block px-2 py-0.5 rounded-full ${
                    slaPercent >= 70
                      ? "bg-green-100 text-green-700"
                      : slaPercent >= 40
                      ? "bg-yellow-100 text-yellow-700"
                      : "bg-red-100 text-red-700"
                  }`}
                >
                  {slaPercent >= 70 ? "On Track" : slaPercent >= 40 ? "In Progress" : "Low"}
                </span>
              </div>
            </div>
          </div>

          {/* Quick Actions */}
          <div className="bg-surface-container-low rounded-2xl p-5 border border-outline-variant">
            <h2 className="font-headline font-semibold text-on-surface mb-4 flex items-center gap-2">
              <span className="material-symbols-outlined text-[20px] text-primary">bolt</span>
              Quick Actions
            </h2>
            <div className="grid grid-cols-2 gap-3">
              {[
                { label: "Report Issue", icon: "add_circle", to: "/submit", primary: true },
                { label: "My Complaints", icon: "list_alt", to: "/my-complaints" },
                {
                  label: "Call 1031",
                  icon: "phone",
                  onClick: () => window.open("tel:1031"),
                },
                {
                  label: "Notifications",
                  icon: "notifications",
                  to: "/notifications",
                },
              ].map((action) => {
                const cls = `flex flex-col items-center gap-1.5 p-3 rounded-xl border transition text-sm font-medium ${
                  action.primary
                    ? "bg-primary text-on-primary border-primary hover:bg-primary/90"
                    : "bg-surface-container border-outline-variant text-on-surface hover:bg-surface-container-high"
                }`;
                if (action.to) {
                  return (
                    <Link key={action.label} to={action.to} className={cls}>
                      <span className="material-symbols-outlined text-[22px]">{action.icon}</span>
                      {action.label}
                    </Link>
                  );
                }
                return (
                  <button key={action.label} className={cls} onClick={action.onClick}>
                    <span className="material-symbols-outlined text-[22px]">{action.icon}</span>
                    {action.label}
                  </button>
                );
              })}
            </div>
          </div>

          {/* Active complaints list summary */}
          {!loading && activeComplaints.length > 0 && (
            <div className="bg-surface-container-low rounded-2xl p-5 border border-outline-variant">
              <h2 className="font-headline font-semibold text-on-surface mb-3 flex items-center gap-2">
                <span className="material-symbols-outlined text-[20px] text-orange-500">
                  pending
                </span>
                Active ({activeComplaints.length})
              </h2>
              {activeComplaints.map((c) => (
                <Link
                  key={c.id}
                  to={`/complaints/${c.id}`}
                  className="flex items-center gap-3 py-2 border-b border-outline-variant last:border-0 hover:text-primary transition"
                >
                  <span className="text-xs font-mono text-on-surface-variant">
                    #{c.complaint_number}
                  </span>
                  <span className="text-sm text-on-surface truncate flex-1">{c.title}</span>
                </Link>
              ))}
            </div>
          )}
        </div>
      </div>
    </AppLayout>
  );
}
