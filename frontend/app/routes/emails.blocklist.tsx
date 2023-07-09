import { useLoaderData } from "@remix-run/react";
import { json, redirect, ActionArgs } from "@remix-run/node";
import { Row, Col, Button, ListGroup, Form } from "react-bootstrap";
import { jaseciCall } from "~/models/http.server";

export const loader = async () => {
  return json({
      emails: await jaseciCall("list_email",{"blocked":true, "_status":true}),
  });
}

export const action = async ({ request }: ActionArgs) => {
  const formData = await request.formData();

  const form_email = formData.get("email");

  await jaseciCall(
    "update_email",
    { email: form_email }
  );

  return redirect("/emails");
};


export default function emailsBlocklist(){
  const {emails} = useLoaderData();

  return (
    <>
    <h3 className="mb-4">Blocked List</h3>
      <ListGroup>
        {emails.report?.map((email) => (
          <ListGroup.Item>
          <Row>
              <Col className="col-md-10 pt-1">
                {email.email}
              </Col>
              <Col>
              <Form method="post">
                <Form.Control name="email" type="hidden" value={email.email} />
                <Button name="btn_action" variant="outline-success" className="col" type="submit">Unblock</Button>
              </Form>
              </Col>
         </Row>
          </ListGroup.Item>
        ))}
      </ListGroup>
    </>
      );
}
