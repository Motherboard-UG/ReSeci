import { Form, Button } from "react-bootstrap";
import { ActionArgs, redirect } from "@remix-run/node";
import { jaseciCall } from "~/models/http.server";
import { useParams } from "@remix-run/react";

export const action = async ({ request }: ActionArgs) => {
  const formData = await request.formData();

  const form_user_id = formData.get("user_id");
  const form_name = formData.get("name");
  const form_email = formData.get("email");
  const form_access_token = formData.get("access_token");
  const form_password = formData.get("password");

  var user_fields = {};

  if (form_password == "") {
    user_fields = {
      user_id: form_user_id,
      name: form_name,
      email: form_email,
      access_token: form_access_token,
    }
  } else {
    user_fields = {
      user_id: form_user_id,
      name: form_name,
      email: form_email,
      access_token: form_access_token,
      password: form_password
    }
  }

  await jaseciCall("update_user",user_fields);

  return redirect("/users");
};

export default function usersEditRoute() {
  const { user_id, name, email, access_token } = useParams();

  return (
    <div className="row justify-content-md-center">
      <Form className="col-md-4" method="post">
      <h3 className="mb-4">Edit User</h3>
        <Form.Group className="mb-3" controlId="name">
          <Form.Label>Name</Form.Label>
          <Form.Control type="text" name="name" defaultValue={name} />
        </Form.Group>
        <Form.Group className="mb-3" controlId="email">
          <Form.Label>Email</Form.Label>
          <Form.Control type="email" name="email" defaultValue={email} />
        </Form.Group>
        <Form.Group className="mb-3" controlId="access_token">
          <Form.Label>Access Token</Form.Label>
          <Form.Control type="text" name="access_token" defaultValue={access_token} />
        </Form.Group>
        <Form.Group className="mb-3" controlId="password">
          <Form.Label>Password</Form.Label>
          <Form.Control type="password" name="password" />
        </Form.Group>
        <Form.Group className="mb-3" controlId="user_id">
          <Form.Control name="user_id" type="hidden" value={user_id} />
        </Form.Group>
        <Button variant="primary" type="submit">
          Submit
        </Button>
      </Form>
    </div>
      );
}
