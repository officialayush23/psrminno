import client from "./client";

export async function login(email, password) {
  const response = await client.post("/auth/login", { email, password });
  return response.data;
}

export async function signup(payload) {
  const response = await client.post("/auth/signup", payload);
  return response.data;
}

export async function getMe() {
  const response = await client.get("/auth/me");
  return response.data;
}

export async function updateMe(payload) {
  const response = await client.patch("/auth/me", payload);
  return response.data;
}
