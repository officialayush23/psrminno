import axios from "axios";
import { auth } from "../firebase";

// const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || "http://localhost:8000";
const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || "https://pscrm-backend-533570030345.asia-south1.run.app";
const client = axios.create({
  baseURL: API_BASE_URL,
});

client.interceptors.request.use(async (config) => {
  const user = auth.currentUser;
  if (user) {
    // getIdToken() auto-refreshes if the 1-hour token is expired
    const token = await user.getIdToken();
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

export default client;