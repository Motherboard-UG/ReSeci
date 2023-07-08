import {
  Link,
  Links,
  Scripts,
  Meta,
  LiveReload,
  Outlet,
} from "@remix-run/react"
import { Navbar, Nav, Container } from "react-bootstrap"
import bootstrapCSS from "bootstrap/dist/css/bootstrap.min.css"
import globalStylesUrl from '~/styles/global.css'

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
        <title>{title ? title : "Scheduler"}</title>
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
            Scheduler
          </Link>
          <Navbar.Toggle aria-controls="responsive-navbar-nav" />
          <Navbar.Collapse id="responsive-navbar-nav">
            <Nav className="me-auto">
              <Link to='/reports' className="nav-link">Reports</Link>
              <Link to='/users' className="nav-link">Users</Link>
              <Link to='/settings' className="nav-link">Settings</Link>
            </Nav>
          </Navbar.Collapse>
        </Container>
      </Navbar>

      <Container className="mt-4 mb-4">{children}</Container>
    </>
  )
}
