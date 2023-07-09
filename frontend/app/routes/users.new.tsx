import { Form, Button } from "react-bootstrap";
import { ActionArgs, redirect } from "@remix-run/node";
import { jaseciCall } from "~/models/http.server";

export const action = async ({ request }: ActionArgs) => {
  const formData = await request.formData();

  const form_name = formData.get("name");
  const form_email = formData.get("email");
  const form_calendar = formData.get("calendar");
  const form_password = formData.get("password");

  await jaseciCall(
    "add_user",
    {
      name: form_name,
      email: form_email,
      calendar_link: form_calendar,
      password: form_password }
  );

  return redirect("/users");
};

export default function userNewRoute() {
  return (
    <div className="row justify-content-md-center">
      <Form className="col-md-4" method="post">
      <h3 className="mb-4">Create User</h3>
        <Form.Group className="mb-3" controlId="name">
          <Form.Label>Name</Form.Label>
          <Form.Control type="text" name="name" />
        </Form.Group>
        <Form.Group className="mb-3" controlId="email">
          <Form.Label>Email</Form.Label>
          <Form.Control type="email" name="email" />
        </Form.Group>
        <Form.Group className="mb-3" controlId="calendar">
          <Form.Label>Calendar Link (ics)</Form.Label>
          <Form.Control type="text" name="calendar" />
        </Form.Group>
        <Form.Group className="mb-3" controlId="password">
          <Form.Label>Password</Form.Label>
          <Form.Control type="password" name="password" />
        </Form.Group>
        <Button variant="primary" type="submit">
          Submit
        </Button>
      </Form>
    </div>
      );
}
