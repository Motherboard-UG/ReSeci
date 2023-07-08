import { Nav } from "react-bootstrap";
import { Outlet } from "@remix-run/react";

export default function reportsIndex(){
  return (
    <>
      <p>Reports will go here</p>

      <Nav variant="tabs" defaultActiveKey="/reports/requests">
        <Nav.Item>
          <Nav.Link href="/reports/requests">Requests</Nav.Link>
        </Nav.Item>
        <Nav.Item>
          <Nav.Link eventKey="link-1">Option 2</Nav.Link>
        </Nav.Item>
      </Nav>
      <Outlet />
    </>
      )
}
