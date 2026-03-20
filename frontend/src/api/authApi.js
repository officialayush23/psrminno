// authApi.js
import {
  createUserWithEmailAndPassword,
  signInWithEmailAndPassword,
  signOut,
} from "firebase/auth";
import { auth } from "../firebase";
import client from "./client";

export async function signup({ full_name, email, password, city_code, preferred_language }) {
  // Step 1: Firebase creates the user (handles password hashing, storage, etc.)
  const credential = await createUserWithEmailAndPassword(auth, email, password);

  // Step 2: get the signed Firebase ID token
  const idToken = await credential.user.getIdToken();

  // Step 3: your backend verifies the token and INSERT INTO users (Cloud SQL)
  const { data } = await client.post("/auth/signup", {
    id_token:            idToken,
    full_name:           full_name,
    city_code:           city_code || "DEL",
    preferred_language:  preferred_language || "hi",
  });

  // Step 4: persist user info for the session
  localStorage.setItem("auth_user", JSON.stringify(data));
  return data; // { user_id, role, email, full_name, city_id, is_new_user }
}

export async function login(email, password) {
  // Step 1: Firebase verifies credentials
  const credential = await signInWithEmailAndPassword(auth, email, password);

  // Step 2: get the signed Firebase ID token
  const idToken = await credential.user.getIdToken();

  // Step 3: your backend verifies and returns the Cloud SQL user row
  const { data } = await client.post("/auth/login", { id_token: idToken });

  localStorage.setItem("auth_user", JSON.stringify(data));
  return data;
}

export async function logout() {
  await signOut(auth);
  localStorage.removeItem("auth_user");
}

export async function getMe() {
  const { data } = await client.get("/auth/me");
  return data;
}
