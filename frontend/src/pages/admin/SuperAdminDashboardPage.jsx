// src/pages/admin/SuperAdminDashboardPage.jsx
// Super Admin — City-wide Command Center with full staff profiles + infra node detail
import { useEffect, useState, useMemo, useCallback } from "react";
import AppLayout from "../../components/AppLayout";
import CRMAgentChat from "../../components/CRMAgentChat";
import MapboxInfraLayer from "../../components/MapboxInfraLayer";
import {
  fetchAdminKPI, fetchStaffUsers, fetchDepartments, fetchJurisdictions,
  fetchInfraNodes, fetchInfraNodeSummary, fetchInfraNodeAiSummary,
  fetchCriticalAlerts, fetchTenders, approveTender, rejectTender,
  fetchInfraNodeMap, fetchInfraNodeWorkflowSuggestions,
  updateStaffUser, deactivateStaffUser,
  fetchAdminTaskList, fetchAvailableWorkers,
  createStaffUser,
} from "../../api/adminApi";
import { toast } from "sonner";

// ── Shadcn-style design tokens ────────────────────────────────────
const S = {
  card:     "rounded-2xl border border-white/10 bg-white/5 backdrop-blur-sm",
  cardSolid:"rounded-2xl border border-slate-800 bg-slate-900",
  badge:    (color) => `inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs font-semibold`,
  btn:      "inline-flex items-center gap-2 px-4 py-2 rounded-xl text-sm font-semibold transition-all active:scale-95",
  btnPrimary:"bg-indigo-500 hover:bg-indigo-400 text-white",
  btnGhost: "bg-white/5 hover:bg-white/10 text-slate-300 border border-white/10",
  btnDanger:"bg-red-500/20 hover:bg-red-500/30 text-red-400 border border-red-500/20",
  input:    "w-full px-3 py-2.5 rounded-xl text-sm bg-white/5 border border-white/10 text-slate-200 placeholder:text-slate-500 focus:outline-none focus:border-indigo-500/50 transition-colors",
  label:    "block text-xs font-semibold uppercase tracking-wider text-slate-400 mb-1.5",
  th:       "px-4 py-3 text-left text-[11px] font-bold uppercase tracking-wider text-slate-500",
};

const ROLE_META = {
  official:    { color:"#818cf8", bg:"rgba(129,140,248,0.15)", icon:"badge" },
  admin:       { color:"#38bdf8", bg:"rgba(56,189,248,0.15)",  icon:"manage_accounts" },
  super_admin: { color:"#fb923c", bg:"rgba(251,146,60,0.15)",  icon:"shield_person" },
  worker:      { color:"#34d399", bg:"rgba(52,211,153,0.15)",  icon:"engineering" },
  contractor:  { color:"#fbbf24", bg:"rgba(251,191,36,0.15)",  icon:"handshake" },
};

function RoleBadge({ role }) {
  const m = ROLE_META[role] || { color:"#64748b", bg:"rgba(0,0,0,0.1)", icon:"person" };
  return (
    <span className="inline-flex items-center gap-1 px-2.5 py-1 rounded-full text-xs font-semibold"
      style={{ background: m.bg, color: m.color }}>
      <span className="material-symbols-outlined text-[11px]">{m.icon}</span>
      {role?.replace("_"," ")}
    </span>
  );
}

function Avatar({ name, color, size = 10 }) {
  const initials = name ? name.split(" ").map(n=>n[0]).join("").toUpperCase().slice(0,2) : "?";
  return (
    <div className={`w-${size} h-${size} rounded-full flex items-center justify-center text-white font-black flex-shrink-0`}
      style={{ background: color || "#6366f1", fontSize: size > 10 ? "1rem" : "0.7rem" }}>
      {initials}
    </div>
  );
}

function KpiCard({ label, value, sub, color, icon }) {
  return (
    <div className="rounded-2xl p-5 relative overflow-hidden"
      style={{ background: "rgba(255,255,255,0.03)", border: "1px solid rgba(255,255,255,0.07)" }}>
      <div className="absolute top-4 right-4 opacity-10">
        <span className="material-symbols-outlined text-5xl" style={{ color }}>{icon}</span>
      </div>
      <p className="text-xs text-slate-500 font-medium uppercase tracking-wider">{label}</p>
      <p className="text-3xl font-black mt-1" style={{ color }}>{value ?? "—"}</p>
      {sub && <p className="text-xs text-slate-500 mt-1">{sub}</p>}
    </div>
  );
}

const TABS = [
  { key:"overview", label:"Overview",      icon:"dashboard" },
  { key:"staff",    label:"Staff",         icon:"group" },
  { key:"map",      label:"Map & Nodes",   icon:"map" },
  { key:"tenders",  label:"Tenders",       icon:"gavel" },
  { key:"alerts",   label:"Alerts",        icon:"notification_important" },
];

// ── Staff profile drawer ──────────────────────────────────────────
function StaffProfileDrawer({ user, departments, jurisdictions, onClose, onSave, onDeactivate }) {
  const [form, setForm] = useState({
    full_name: user.full_name || "",
    role: user.role || "official",
    department_id: user.department_id ? String(user.department_id) : "",
    jurisdiction_id: user.jurisdiction_id ? String(user.jurisdiction_id) : "",
    phone: user.phone || "",
    is_active: user.is_active !== false,
  });
  const [saving, setSaving] = useState(false);
  const m = ROLE_META[user.role] || ROLE_META.official;

  const save = async () => {
    setSaving(true);
    try {
      await updateStaffUser(user.id, form);
      toast.success("User updated");
      onSave();
      onClose();
    } catch { toast.error("Update failed"); }
    finally { setSaving(false); }
  };

  return (
    <div className="fixed inset-0 z-50 flex justify-end"
      style={{ background:"rgba(0,0,8,0.7)", backdropFilter:"blur(8px)" }}
      onClick={e => e.target === e.currentTarget && onClose()}>
      <aside className="w-full max-w-lg flex flex-col overflow-y-auto"
        style={{ background:"#0f172a", borderLeft:"1px solid rgba(255,255,255,0.07)" }}>

        {/* Profile header */}
        <div className="p-8 pb-6" style={{ background:"linear-gradient(135deg, rgba(99,102,241,0.15) 0%, rgba(0,0,0,0) 60%)" }}>
          <div className="flex items-start justify-between mb-6">
            <div className="flex items-center gap-4">
              <Avatar name={user.full_name} color={m.color} size={16} />
              <div>
                <h2 className="text-xl font-black text-white">{user.full_name}</h2>
                <p className="text-slate-400 text-sm">{user.email}</p>
                <div className="mt-2 flex items-center gap-2 flex-wrap">
                  <RoleBadge role={user.role} />
                  <span className={`text-xs px-2 py-0.5 rounded-full font-semibold ${user.is_active ? "text-emerald-400 bg-emerald-400/10" : "text-red-400 bg-red-400/10"}`}>
                    {user.is_active ? "Active" : "Inactive"}
                  </span>
                  {!user.has_firebase_auth && (
                    <span className="text-xs px-2 py-0.5 rounded-full font-semibold text-amber-400 bg-amber-400/10">No Firebase</span>
                  )}
                </div>
              </div>
            </div>
            <button onClick={onClose} className="p-2 rounded-xl hover:bg-white/5 text-slate-400">
              <span className="material-symbols-outlined text-[20px]">close</span>
            </button>
          </div>

          {/* Stats row */}
          <div className="grid grid-cols-3 gap-3">
            {[
              { label:"Department", value: user.dept_name || "—" },
              { label:"Jurisdiction", value: user.jurisdiction_name || "All" },
              { label:"Tasks", value: user.current_task_count ?? "—" },
            ].map(s => (
              <div key={s.label} className="rounded-xl p-3" style={{ background:"rgba(255,255,255,0.04)", border:"1px solid rgba(255,255,255,0.06)" }}>
                <p className="text-[10px] text-slate-500 uppercase tracking-wider">{s.label}</p>
                <p className="text-sm font-bold text-slate-200 mt-0.5 truncate">{s.value}</p>
              </div>
            ))}
          </div>
          {user.worker_score && (
            <div className="mt-3 rounded-xl p-3 flex items-center gap-2" style={{ background:"rgba(251,191,36,0.08)", border:"1px solid rgba(251,191,36,0.15)" }}>
              <span className="material-symbols-outlined text-amber-400 text-[18px]">star</span>
              <p className="text-sm text-amber-300 font-semibold">Performance: {Number(user.worker_score).toFixed(2)}</p>
            </div>
          )}
        </div>

        {/* Edit form */}
        <div className="flex-1 p-8 pt-4 flex flex-col gap-5">
          <h3 className="text-sm font-bold text-slate-300 flex items-center gap-2">
            <span className="material-symbols-outlined text-[16px]">edit</span>
            Edit Profile
          </h3>

          <div>
            <label className={S.label}>Full Name</label>
            <input value={form.full_name} onChange={e => setForm(f=>({...f,full_name:e.target.value}))} className={S.input} />
          </div>

          <div>
            <label className={S.label}>Role</label>
            <select value={form.role} onChange={e => setForm(f=>({...f,role:e.target.value}))} className={S.input}>
              {["official","admin","super_admin","worker","contractor"].map(r => (
                <option key={r} value={r}>{r.replace("_"," ")}</option>
              ))}
            </select>
          </div>

          <div>
            <label className={S.label}>Department</label>
            <select value={form.department_id} onChange={e => setForm(f=>({...f,department_id:e.target.value}))} className={S.input}>
              <option value="">— None —</option>
              {departments.map(d => <option key={d.id} value={d.id}>{d.name} ({d.code})</option>)}
            </select>
          </div>

          {jurisdictions.length > 0 && (
            <div>
              <label className={S.label}>Jurisdiction</label>
              <select value={form.jurisdiction_id} onChange={e => setForm(f=>({...f,jurisdiction_id:e.target.value}))} className={S.input}>
                <option value="">All jurisdictions</option>
                {jurisdictions.map(j => <option key={j.id} value={j.id}>{j.name}</option>)}
              </select>
            </div>
          )}

          <div>
            <label className={S.label}>Phone</label>
            <input value={form.phone} onChange={e => setForm(f=>({...f,phone:e.target.value}))} className={S.input} placeholder="+91 98765 43210" />
          </div>

          <label className="flex items-center gap-3 cursor-pointer">
            <div className={`w-10 h-5 rounded-full transition-colors relative ${form.is_active ? "bg-emerald-500" : "bg-slate-700"}`}
              onClick={() => setForm(f=>({...f,is_active:!f.is_active}))}>
              <div className={`absolute top-0.5 w-4 h-4 rounded-full bg-white transition-all ${form.is_active ? "left-5" : "left-0.5"}`} />
            </div>
            <span className="text-sm text-slate-300">Account Active</span>
          </label>
        </div>

        {/* Footer */}
        <div className="p-6 flex gap-3" style={{ borderTop:"1px solid rgba(255,255,255,0.06)" }}>
          <button onClick={save} disabled={saving}
            className={`flex-1 py-3 rounded-xl font-bold text-sm text-white transition-all disabled:opacity-40 ${S.btnPrimary}`}>
            {saving ? "Saving…" : "Save Changes"}
          </button>
          {user.is_active && (
            <button onClick={() => { onDeactivate(user); onClose(); }}
              className={`${S.btn} ${S.btnDanger}`}>
              <span className="material-symbols-outlined text-[16px]">person_off</span>
            </button>
          )}
        </div>
      </aside>
    </div>
  );
}

// ── Main page ─────────────────────────────────────────────────────
export default function SuperAdminDashboardPage() {
  const [activeTab, setActiveTab] = useState("overview");
  const [kpi, setKpi] = useState(null);
  const [staff, setStaff] = useState([]);
  const [departments, setDepartments] = useState([]);
  const [jurisdictions, setJurisdictions] = useState([]);
  const [workers, setWorkers] = useState([]);
  const [mapNodes, setMapNodes] = useState({ type:"FeatureCollection", features:[] });
  const [tenders, setTenders] = useState([]);
  const [alerts, setAlerts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [staffFilter, setStaffFilter] = useState("");
  const [staffSearch, setStaffSearch] = useState("");
  const [editingUser, setEditingUser] = useState(null);
  const [deactivating, setDeactivating] = useState(null);
  const [selectedNode, setSelectedNode] = useState(null);
  const [nodeDetail, setNodeDetail] = useState(null);
  const [nodeLoading, setNodeLoading] = useState(false);

  const load = useCallback(async () => {
    setLoading(true);
    try {
      const [kpiRes, staffRes, deptRes, mapRes, tendersRes, alertsRes, workersRes] = await Promise.all([
        fetchAdminKPI(),
        fetchStaffUsers(),
        fetchDepartments(),
        fetchInfraNodeMap(),
        fetchTenders({ status:"submitted", limit:50 }),
        fetchCriticalAlerts({ limit:50 }),
        fetchAvailableWorkers(),
      ]);
      setKpi(kpiRes);
      setStaff(Array.isArray(staffRes) ? staffRes : staffRes?.items || []);
      setDepartments(Array.isArray(deptRes) ? deptRes : deptRes?.items || []);
      setMapNodes(mapRes || { type:"FeatureCollection", features:[] });
      setTenders(Array.isArray(tendersRes) ? tendersRes : tendersRes?.items || []);
      setAlerts(Array.isArray(alertsRes?.items) ? alertsRes.items : []);
      setWorkers(Array.isArray(workersRes) ? workersRes : []);

      // Jurisdictions separate to avoid crashing
      try {
        const j = await fetchJurisdictions();
        setJurisdictions(Array.isArray(j) ? j : []);
      } catch {}
    } catch { toast.error("Failed to load dashboard data"); }
    finally { setLoading(false); }
  }, []);

  useEffect(() => { load(); }, [load]);

  // Load infra node detail when selected
  useEffect(() => {
    if (!selectedNode) { setNodeDetail(null); return; }
    setNodeLoading(true);
    fetchInfraNodeSummary(selectedNode).then(d => { setNodeDetail(d); setNodeLoading(false); })
      .catch(() => setNodeLoading(false));
  }, [selectedNode]);

  const filteredStaff = useMemo(() => {
    let s = staff;
    if (staffFilter) s = s.filter(u => u.role === staffFilter);
    if (staffSearch) {
      const q = staffSearch.toLowerCase();
      s = s.filter(u =>
        u.full_name?.toLowerCase().includes(q) ||
        u.email?.toLowerCase().includes(q) ||
        u.dept_name?.toLowerCase().includes(q)
      );
    }
    return s;
  }, [staff, staffFilter, staffSearch]);

  const summary = kpi?.summary || {};
  const tasks = kpi?.tasks || {};
  const deptBreakdown = kpi?.dept_breakdown || [];
  const leaderboard = useMemo(() => [...workers].sort((a,b)=>(b.performance_score||0)-(a.performance_score||0)).slice(0,5), [workers]);

  const handleDeactivate = async (user) => {
    try {
      await deactivateStaffUser(user.id);
      toast.success(`${user.full_name} deactivated`);
      load();
    } catch { toast.error("Deactivation failed"); }
  };

  const handleTenderApprove = async (t) => {
    try { await approveTender(t.id, {}); setTenders(prev => prev.filter(x=>x.id!==t.id)); toast.success("Tender approved"); }
    catch { toast.error("Failed"); }
  };

  const handleTenderReject = async (t, reason) => {
    if (!reason) { toast.error("Reason required"); return; }
    try { await rejectTender(t.id, { reason }); setTenders(prev => prev.filter(x=>x.id!==t.id)); toast.success("Tender rejected"); }
    catch { toast.error("Failed"); }
  };

  return (
    <AppLayout>
      <div className="min-h-screen p-4 md:p-6 flex flex-col gap-5"
        style={{ background:"#020817", color:"#e2e8f0" }}>

        {/* Header */}
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-2xl font-black text-white">Command Center</h1>
            <p className="text-slate-400 text-sm">City-wide infrastructure oversight</p>
          </div>
          <div className="flex items-center gap-2">
            {alerts.length > 0 && (
              <span className="flex items-center gap-1.5 px-3 py-1.5 rounded-full text-xs font-bold text-red-400"
                style={{ background:"rgba(239,68,68,0.1)", border:"1px solid rgba(239,68,68,0.2)" }}>
                <span className="material-symbols-outlined text-[14px]">warning</span>
                {alerts.length} alerts
              </span>
            )}
          </div>
        </div>

        {/* Tabs */}
        <div className="flex flex-wrap gap-2">
          {TABS.map(tab => (
            <button key={tab.key} onClick={() => setActiveTab(tab.key)}
              className="flex items-center gap-1.5 px-4 py-2 rounded-xl text-xs font-bold transition-all"
              style={{
                background: activeTab===tab.key ? "rgba(99,102,241,0.2)" : "rgba(255,255,255,0.04)",
                color:      activeTab===tab.key ? "#818cf8" : "#64748b",
                border:     `1px solid ${activeTab===tab.key ? "rgba(99,102,241,0.3)" : "rgba(255,255,255,0.06)"}`,
              }}>
              <span className="material-symbols-outlined text-[14px]">{tab.icon}</span>
              {tab.label}
            </button>
          ))}
        </div>

        {/* ── OVERVIEW ── */}
        {activeTab === "overview" && (
          <div className="flex flex-col gap-5">
            {/* KPI grid */}
            <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
              <KpiCard label="Total Complaints" value={summary.total_complaints}  color="#818cf8" icon="report" />
              <KpiCard label="Open"             value={summary.open_complaints}   color="#fb923c" icon="pending" />
              <KpiCard label="Critical"         value={summary.critical_count}    color="#f87171" icon="warning" />
              <KpiCard label="Resolved"         value={summary.resolved_complaints} color="#34d399" icon="check_circle" />
            </div>
            <div className="grid grid-cols-2 md:grid-cols-4 gap-3">
              <KpiCard label="Tasks Pending"  value={tasks.pending}  color="#38bdf8" icon="assignment" />
              <KpiCard label="Tasks Active"   value={tasks.active}   color="#a78bfa" icon="play_circle" />
              <KpiCard label="Tasks Overdue"  value={tasks.overdue}  color="#f97316" icon="timer_off" />
              <KpiCard label="Needs Workflow" value={summary.needs_workflow} color="#facc15" icon="account_tree" />
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-2 gap-4">
              {/* Dept breakdown */}
              <div className="rounded-2xl p-5" style={{ background:"rgba(255,255,255,0.03)", border:"1px solid rgba(255,255,255,0.06)" }}>
                <h3 className="text-sm font-bold text-slate-300 mb-4">Department Performance</h3>
                <div className="flex flex-col gap-2">
                  {deptBreakdown.slice(0,8).map((d, i) => (
                    <div key={i} className="flex items-center justify-between py-2.5 px-3 rounded-xl"
                      style={{ background:"rgba(255,255,255,0.03)", border:"1px solid rgba(255,255,255,0.05)" }}>
                      <p className="text-sm text-slate-300 font-medium truncate max-w-[160px]">{d.dept_name || "—"}</p>
                      <div className="flex items-center gap-4 text-xs">
                        <span className="text-slate-400">{d.complaints ?? 0} complaints</span>
                        <span className="text-emerald-400">{d.tasks_done ?? 0} done</span>
                        {d.overdue > 0 && <span className="text-red-400">{d.overdue} overdue</span>}
                      </div>
                    </div>
                  ))}
                  {deptBreakdown.length === 0 && <p className="text-xs text-slate-500">No data</p>}
                </div>
              </div>

              {/* Worker leaderboard */}
              <div className="rounded-2xl p-5" style={{ background:"rgba(255,255,255,0.03)", border:"1px solid rgba(255,255,255,0.06)" }}>
                <h3 className="text-sm font-bold text-slate-300 mb-4">Top Workers</h3>
                <div className="flex flex-col gap-2">
                  {leaderboard.map((w, i) => (
                    <div key={w.id} className="flex items-center gap-3 py-2.5 px-3 rounded-xl"
                      style={{ background:"rgba(255,255,255,0.03)", border:"1px solid rgba(255,255,255,0.05)" }}>
                      <span className="text-xs font-black text-slate-500 w-4">#{i+1}</span>
                      <Avatar name={w.full_name} color={ROLE_META.worker.color} size={8} />
                      <div className="flex-1 min-w-0">
                        <p className="text-sm font-semibold text-slate-200 truncate">{w.full_name}</p>
                        <p className="text-xs text-slate-500">{w.department_name || "—"}</p>
                      </div>
                      <div className="flex items-center gap-1">
                        <span className="text-amber-400 text-xs">★</span>
                        <span className="text-xs font-bold text-slate-300">{Number(w.performance_score||0).toFixed(2)}</span>
                      </div>
                    </div>
                  ))}
                  {leaderboard.length === 0 && <p className="text-xs text-slate-500">No worker data</p>}
                </div>
              </div>
            </div>
          </div>
        )}

        {/* ── STAFF ── */}
        {activeTab === "staff" && (
          <div className="flex flex-col gap-4">
            {/* Filters */}
            <div className="flex flex-col sm:flex-row gap-3">
              <input value={staffSearch} onChange={e=>setStaffSearch(e.target.value)}
                placeholder="Search name, email, department…"
                className={`${S.input} flex-1`} />
              <div className="flex gap-2 flex-wrap">
                {["","official","admin","worker","contractor","super_admin"].map(r => (
                  <button key={r} onClick={() => setStaffFilter(r)}
                    className="px-3 py-2 rounded-xl text-xs font-bold transition-all"
                    style={{
                      background: staffFilter===r ? "rgba(99,102,241,0.2)" : "rgba(255,255,255,0.04)",
                      color:      staffFilter===r ? "#818cf8" : "#64748b",
                      border:     `1px solid ${staffFilter===r ? "rgba(99,102,241,0.3)" : "rgba(255,255,255,0.06)"}`,
                    }}>
                    {r || "All"}
                  </button>
                ))}
              </div>
            </div>

            {/* Staff grid */}
            <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-3">
              {loading ? (
                Array(6).fill(0).map((_,i) => (
                  <div key={i} className="rounded-2xl p-4 h-28 animate-pulse"
                    style={{ background:"rgba(255,255,255,0.03)", border:"1px solid rgba(255,255,255,0.06)" }} />
                ))
              ) : filteredStaff.map(u => {
                const m = ROLE_META[u.role] || ROLE_META.official;
                return (
                  <button key={u.id} onClick={() => setEditingUser(u)}
                    className="rounded-2xl p-4 text-left transition-all hover:scale-[1.01] active:scale-[0.99]"
                    style={{ background:"rgba(255,255,255,0.03)", border:`1px solid rgba(255,255,255,0.07)` }}
                    onMouseEnter={e => e.currentTarget.style.borderColor = m.color + "40"}
                    onMouseLeave={e => e.currentTarget.style.borderColor = "rgba(255,255,255,0.07)"}>
                    <div className="flex items-start gap-3">
                      <Avatar name={u.full_name} color={m.color} size={10} />
                      <div className="flex-1 min-w-0">
                        <div className="flex items-center gap-2 flex-wrap mb-1">
                          <p className="text-sm font-bold text-white truncate">{u.full_name}</p>
                          {!u.has_firebase_auth && (
                            <span className="text-[10px] px-1.5 py-0.5 rounded font-bold text-amber-400 bg-amber-400/10">No Auth</span>
                          )}
                        </div>
                        <p className="text-xs text-slate-500 truncate">{u.email}</p>
                        <div className="flex items-center gap-2 mt-2 flex-wrap">
                          <RoleBadge role={u.role} />
                          <span className={`text-[10px] px-2 py-0.5 rounded-full font-semibold ${u.is_active ? "text-emerald-400 bg-emerald-400/10" : "text-red-400 bg-red-400/10"}`}>
                            {u.is_active ? "Active" : "Inactive"}
                          </span>
                        </div>
                        <p className="text-[11px] text-slate-500 mt-1.5 truncate">{u.dept_name || "No department"}{u.jurisdiction_name ? ` · ${u.jurisdiction_name}` : ""}</p>
                      </div>
                    </div>
                    {u.worker_score && (
                      <div className="mt-3 flex items-center gap-1.5 text-xs text-amber-400">
                        <span className="material-symbols-outlined text-[14px]">star</span>
                        <span className="font-semibold">{Number(u.worker_score).toFixed(2)}</span>
                        {u.current_task_count > 0 && <span className="text-slate-500">· {u.current_task_count} tasks</span>}
                      </div>
                    )}
                  </button>
                );
              })}
            </div>
            {!loading && filteredStaff.length === 0 && (
              <div className="text-center py-16 text-slate-500">
                <span className="material-symbols-outlined text-5xl block mb-2">group_off</span>
                <p>No staff found</p>
              </div>
            )}
            <p className="text-xs text-slate-600 text-center">{filteredStaff.length} of {staff.length} staff</p>
          </div>
        )}

        {/* ── MAP & NODES ── */}
        {activeTab === "map" && (
          <div className="flex flex-col gap-4">
            <div className="rounded-2xl overflow-hidden" style={{ height: 500 }}>
              <MapboxInfraLayer
                nodes={mapNodes}
                onNodeClick={(id) => setSelectedNode(id === selectedNode ? null : id)}
              />
            </div>

            {/* Node detail panel */}
            {selectedNode && (
              <div className="rounded-2xl p-5" style={{ background:"rgba(99,102,241,0.05)", border:"1px solid rgba(99,102,241,0.2)" }}>
                {nodeLoading ? (
                  <div className="h-20 animate-pulse rounded-xl" style={{ background:"rgba(255,255,255,0.04)" }} />
                ) : nodeDetail ? (
                  <div>
                    <div className="flex items-start justify-between mb-4">
                      <div>
                        <h3 className="font-bold text-white">{nodeDetail.node?.infra_type_name}</h3>
                        <p className="text-sm text-slate-400">{nodeDetail.node?.jurisdiction_name}</p>
                      </div>
                      <button onClick={() => setSelectedNode(null)} className="text-slate-400 hover:text-white">
                        <span className="material-symbols-outlined">close</span>
                      </button>
                    </div>
                    <div className="grid grid-cols-3 gap-3 mb-4">
                      {[
                        { label:"Total Complaints", value: nodeDetail.node?.total_complaint_count, color:"#818cf8" },
                        { label:"Resolved", value: nodeDetail.node?.total_resolved_count, color:"#34d399" },
                        { label:"Severity", value: nodeDetail.node?.cluster_severity || "—", color:"#fb923c" },
                      ].map(s => (
                        <div key={s.label} className="rounded-xl p-3" style={{ background:"rgba(255,255,255,0.04)" }}>
                          <p className="text-[10px] text-slate-500 uppercase tracking-wider">{s.label}</p>
                          <p className="text-lg font-black mt-0.5" style={{ color:s.color }}>{s.value}</p>
                        </div>
                      ))}
                    </div>
                    {nodeDetail.complaints?.slice(0,5).map(c => (
                      <div key={c.id} className="flex items-center justify-between py-2 px-3 rounded-xl mb-1"
                        style={{ background:"rgba(255,255,255,0.03)" }}>
                        <div>
                          <p className="text-xs font-semibold text-slate-300">#{c.complaint_number}</p>
                          <p className="text-[11px] text-slate-500 truncate max-w-[200px]">{c.title}</p>
                        </div>
                        <span className={`text-[10px] px-2 py-0.5 rounded-full font-bold ${c.status==="resolved"?"text-emerald-400 bg-emerald-400/10":"text-amber-400 bg-amber-400/10"}`}>
                          {c.status}
                        </span>
                      </div>
                    ))}
                    <a href={`/admin/infra-nodes/${selectedNode}`}
                      className="mt-3 flex items-center gap-2 text-xs font-semibold text-indigo-400 hover:text-indigo-300">
                      <span className="material-symbols-outlined text-[14px]">open_in_new</span>
                      View full infra node detail
                    </a>
                  </div>
                ) : null}
              </div>
            )}
          </div>
        )}

        {/* ── TENDERS ── */}
        {activeTab === "tenders" && (
          <div className="flex flex-col gap-4">
            <h2 className="text-sm font-bold text-slate-300">Pending Tender Approvals ({tenders.length})</h2>
            {tenders.length === 0 ? (
              <div className="text-center py-12 text-slate-500">No tenders pending</div>
            ) : tenders.map(t => (
              <TenderCard key={t.id} tender={t} onApprove={() => handleTenderApprove(t)} onReject={(reason) => handleTenderReject(t, reason)} />
            ))}
          </div>
        )}

        {/* ── ALERTS ── */}
        {activeTab === "alerts" && (
          <div className="flex flex-col gap-3">
            <h2 className="text-sm font-bold text-slate-300">Critical Alerts — Repeat Issues ({alerts.length})</h2>
            {alerts.length === 0 ? (
              <div className="text-center py-12 text-slate-500">No critical alerts</div>
            ) : alerts.map((a, i) => (
              <div key={a.new_complaint_id || i} className="rounded-2xl p-4"
                style={{ background:"rgba(239,68,68,0.05)", border:"1px solid rgba(239,68,68,0.15)" }}>
                <div className="flex items-start justify-between">
                  <div>
                    <div className="flex items-center gap-2 mb-1">
                      <span className="material-symbols-outlined text-red-400 text-[18px]">warning</span>
                      <p className="font-bold text-slate-200 text-sm">{a.infra_type_name}</p>
                      <span className="text-xs text-slate-500">·</span>
                      <p className="text-xs text-slate-400">{a.jurisdiction_name}</p>
                    </div>
                    <p className="text-xs text-slate-500">#{a.complaint_number} · {a.days_since_resolution}d since last resolution</p>
                    {a.liable_contractor_flag && (
                      <p className="text-xs text-amber-400 mt-1">⚠ Liable contractor: {a.liable_contractor}</p>
                    )}
                  </div>
                  <span className="text-[10px] px-2 py-1 rounded-full font-bold text-red-400 bg-red-400/10">{a.priority}</span>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Staff profile drawer */}
      {editingUser && (
        <StaffProfileDrawer
          user={editingUser}
          departments={departments}
          jurisdictions={jurisdictions}
          onClose={() => setEditingUser(null)}
          onSave={load}
          onDeactivate={handleDeactivate}
        />
      )}

      <CRMAgentChat />
    </AppLayout>
  );
}

// ── Tender card ───────────────────────────────────────────────────
function TenderCard({ tender, onApprove, onReject }) {
  const [rejectReason, setRejectReason] = useState("");
  const [showReject, setShowReject] = useState(false);

  return (
    <div className="rounded-2xl p-5" style={{ background:"rgba(255,255,255,0.03)", border:"1px solid rgba(255,255,255,0.07)" }}>
      <div className="flex items-start justify-between mb-3">
        <div>
          <p className="font-bold text-slate-200">{tender.title}</p>
          <p className="text-xs text-slate-500 mt-0.5">#{tender.tender_number} · {tender.dept_name || "—"} · {tender.submitter_name || "—"}</p>
        </div>
        <span className="text-xs px-2.5 py-1 rounded-full font-semibold text-amber-400 bg-amber-400/10">{tender.status}</span>
      </div>
      {tender.estimated_cost && (
        <p className="text-sm text-slate-300 mb-3">Estimated: ₹{Number(tender.estimated_cost).toLocaleString("en-IN")}</p>
      )}
      {!showReject ? (
        <div className="flex gap-2">
          <button onClick={onApprove}
            className="flex-1 py-2 rounded-xl text-sm font-semibold text-emerald-400 transition-all"
            style={{ background:"rgba(52,211,153,0.1)", border:"1px solid rgba(52,211,153,0.2)" }}>
            Approve
          </button>
          <button onClick={() => setShowReject(true)}
            className="flex-1 py-2 rounded-xl text-sm font-semibold text-red-400 transition-all"
            style={{ background:"rgba(239,68,68,0.1)", border:"1px solid rgba(239,68,68,0.2)" }}>
            Reject
          </button>
        </div>
      ) : (
        <div className="flex flex-col gap-2">
          <input value={rejectReason} onChange={e => setRejectReason(e.target.value)}
            className={S.input} placeholder="Reason for rejection…" />
          <div className="flex gap-2">
            <button onClick={() => onReject(rejectReason)}
              className="flex-1 py-2 rounded-xl text-sm font-semibold text-red-400"
              style={{ background:"rgba(239,68,68,0.1)", border:"1px solid rgba(239,68,68,0.2)" }}>
              Confirm Reject
            </button>
            <button onClick={() => setShowReject(false)}
              className="flex-1 py-2 rounded-xl text-sm text-slate-400 hover:text-slate-300"
              style={{ background:"rgba(255,255,255,0.04)" }}>
              Cancel
            </button>
          </div>
        </div>
      )}
    </div>
  );
}