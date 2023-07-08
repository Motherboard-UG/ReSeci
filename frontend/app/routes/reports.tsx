import { Outlet } from "@remix-run/react";

export default function reportsRoute(){
  return (
    <>
      <h1>Reports</h1>
      <Outlet />
    </>
      )
}
