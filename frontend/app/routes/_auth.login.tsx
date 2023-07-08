import { Form, Button } from "react-bootstrap";
import { LoaderArgs, ActionFunction } from "@remix-run/node";
import {authenticator} from "~/models/auth.server"

export const loader = async ({request}: LoaderArgs) => {
    const user = await authenticator.isAuthenticated(request, {
        successRedirect: "/",
    })

    return user;
}

export const action: ActionFunction = async ({request}) => {
    return authenticator.authenticate("form", request, {
        successRedirect: "/",
        failureRedirect: "/login",
    })
}

export default function loginRoute(){
  return (
    <>
      <div className="row justify-content-md-center">
        <Form className="col-md-4 d-grid gap-2" method="post">
          <h2 className="mb-3">Login</h2>
          <Form.Group controlId="email">
            <Form.Label>Email</Form.Label>
            <Form.Control type="email" name="email" />
          </Form.Group>
          <Form.Group controlId="password">
            <Form.Label>Password</Form.Label>
            <Form.Control type="text" name="password" />
          </Form.Group>
          <Button className="mt-4" variant="primary" type="submit">
            Login
          </Button>
        </Form>
      </div>
    </>
      );
}
