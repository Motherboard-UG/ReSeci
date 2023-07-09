import { useLoaderData, Link } from "@remix-run/react";
import { json } from "@remix-run/node";
import { Row, Col, Button, ListGroup, Form } from "react-bootstrap";
import { jaseciCall } from "~/models/http.server";

export const loader = async () => {
  return json({
      emails: await jaseciCall("list_email",{"blocked":false}),
  });
}

export default function emailsIndex(){
  const {emails} = useLoaderData();

  return (
  <>
    <Row>
      <div className="float-end mb-4">
        <Link to="/emails/new" className="btn btn-primary btn-add" role="button">Add Email</Link>
      </div>
    </Row>

      <ListGroup>
        {emails.report?.map((email) => (
          <ListGroup.Item>
          <Row>
              <Col className="col-md-10 pt-1">
                {email.email}
              </Col>
              <Col>
              <Form>
                <Button name="block_action" variant="outline-danger" className="col" type="submit" value={email.email}>Block</Button>
              </Form>
              </Col>
         </Row>
          </ListGroup.Item>
        ))}
      </ListGroup>
      </>
      );
}
