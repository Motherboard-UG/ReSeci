import { Outlet } from "@remix-run/react";
import { authenticator } from "~/models/auth.server";
import { LoaderArgs } from "@remix-run/node";

export const loader = async ({request}: LoaderArgs) => {
  const user = await authenticator.isAuthenticated(request, {
      failureRedirect: "/login",
  });

  return user;
}

export default function logsRoute(){
  return (
    <>
      <h1 className="mb-4">Logs</h1>
      <Outlet />
    </>
      );
}
