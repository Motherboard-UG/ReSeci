import { Form, Button } from "react-bootstrap";
import { ActionArgs, redirect } from "@remix-run/node";
import { jaseciCall } from "~/models/http.server";

export const action = async ({ request }: ActionArgs) => {
  const formData = await request.formData();

  const form_email = formData.get("email");

  await jaseciCall(
    "add_email",
    {
      email: form_email
    }
  );

  return redirect("/emails");
};

export default function userNewRoute() {
  return (
    <div className="row justify-content-md-center">
      <Form className="col-md-4" method="post">
      <h3 className="mb-4">Add Email</h3>
        <Form.Group className="mb-3" controlId="email">
          <Form.Label>Email</Form.Label>
          <Form.Control type="email" name="email" />
        </Form.Group>
        <Button variant="primary" type="submit">
          Submit
        </Button>
      </Form>
    </div>
      );
}
