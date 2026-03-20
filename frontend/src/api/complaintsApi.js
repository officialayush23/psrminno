import client from "./client";

export async function submitComplaint({ text, lat, lng, image, language = "en" }) {
  const formData = new FormData();
  formData.append("description", text);
  formData.append("original_language", language);
  formData.append("lat", String(lat));
  formData.append("lng", String(lng));
  if (image) {
    formData.append("image", image);
  }
  const response = await client.post("/complaints/ingest", formData, {
    headers: { "Content-Type": "multipart/form-data" },
  });
  return response.data;
}

export async function fetchComplaintById(complaintId) {
  const response = await client.get(`/complaints/${complaintId}`);
  return response.data;
}

export async function fetchMyComplaints({ limit = 20, offset = 0, status } = {}) {
  const params = { limit, offset };
  if (status) params.status = status;
  const response = await client.get("/complaints", { params });
  return response.data; // { total, limit, offset, items: [...] }
}

export async function fetchComplaintHistory(complaintId) {
  const response = await client.get(`/complaints/${complaintId}/history`);
  return response.data; // [{old_status, new_status, reason, created_at}]
}

export async function fetchMapPins() {
  const response = await client.get("/complaints/map-pins");
  return response.data; // [{id, complaint_number, title, status, lat, lng}]
}

export async function fetchMyStats() {
  const response = await client.get("/stats/me");
  return response.data; // {total_count, active_count, resolved_count, avg_resolution_days}
}
