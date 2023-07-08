import { createCookieSessionStorage } from "@remix-run/node";

if(!process.env.SESSION_SECRET){
  throw new Error('SESSION_SECRET required.');
}

export const session_storage = createCookieSessionStorage({
  cookie: {
    name: "__session",
    httpOnly: true,
    path: "/",
    sameSite: "lax",
    secrets: [process.env.SESSION_SECRET],
    secure: process.env.NODE_ENV === "production",
  },
});
