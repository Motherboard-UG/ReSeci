import {
  Link,
  Links,
  Scripts,
  Meta,
  LiveReload,
  Outlet,
} from "@remix-run/react"
import { Navbar, Nav, NavDropdown, Container, Form, Button } from "react-bootstrap";
import bootstrapCSS from "bootstrap/dist/css/bootstrap.min.css";
import globalStylesUrl from '~/styles/global.css';

export const links = () => [
  { rel: 'stylesheet', href: bootstrapCSS },
  { rel: 'stylesheet', href: globalStylesUrl }
]

export default function App() {
  return (
    <Document>
      <Layout>
        <Outlet />
      </Layout>
    </Document>
  )
}

function Document({children,title}) {
  return (
    <html lang='en'>
      <head>
        <meta charSet='utf-8' />
        <meta name='viewport' content='width=device-width,initial-scale=1' />
        <Meta />
        <Links />
        <title>{title ? title : "ReSeci"}</title>
      </head>
      <body>
        {children}
        <Scripts />
        <LiveReload />
      </body>
    </html>
  );
}

function Layout({ children }) {
  return (
    <>
      <Navbar collapseOnSelect expand="md" bg="dark" data-bs-theme="dark">
        <Container>
          <Link to='/' className="navbar-brand custom">
            ReSeci
          </Link>
          <Navbar.Toggle aria-controls="responsive-navbar-nav" />
          <Navbar.Collapse id="responsive-navbar-nav">
            <Nav className="me-auto">
              <Link to='/reports' className="nav-link">Reports</Link>
              <NavDropdown title="Staff" id="basic-nav-dropdown">
                <NavDropdown.Item href="/users">Accessible</NavDropdown.Item>
                <NavDropdown.Item href="/users/excluded">Excluded</NavDropdown.Item>
              </NavDropdown>
              <NavDropdown title="Emails" id="basic-nav-dropdown">
                <NavDropdown.Item href="/emails">Approved</NavDropdown.Item>
                <NavDropdown.Item href="/emails/blocklist">Blocklist</NavDropdown.Item>
              </NavDropdown>
              <Link to='/settings' className="nav-link">Settings</Link>
              <Link to='/logs' className="nav-link">Logs</Link>
              <Form action="/logout" method="post">
                <Button type="submit" variant="outline-light" className="mt-1 ms-3" size="sm">
                  Logout
                </Button>
              </Form>
            </Nav>
          </Navbar.Collapse>
        </Container>
      </Navbar>

      <Container className="mt-4 mb-4">{children}</Container>
    </>
  )
}
