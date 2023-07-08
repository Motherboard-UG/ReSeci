import { Outlet } from "@remix-run/react";

export default function settingsRoute(){
  return (
    <>
      <h1 className="mb-4">Settings</h1>
      <Outlet />
    </>
      );
}
