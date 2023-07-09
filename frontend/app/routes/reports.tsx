import { Outlet, Link } from "@remix-run/react";
import { authenticator } from "~/models/auth.server";
import { LoaderArgs } from "@remix-run/node";
import { Nav } from "react-bootstrap";

export const loader = async ({request}: LoaderArgs) => {
  const user = await authenticator.isAuthenticated(request, {
      failureRedirect: "/login",
  });

  return user;
}

export default function reportsRoute(){
  return (
    <>
      <h1>Reports</h1>
      <Nav variant="tabs" defaultActiveKey="/reports/requests">
        <Nav.Item>
          <Link to="/reports/requests" className="nav-link">Requests</Link>
        </Nav.Item>
        <Nav.Item>
          <Link to="/reports/req_freq" className="nav-link">Requests Frequency</Link>
        </Nav.Item>
      </Nav>
      <Outlet />
    </>
      )
}
