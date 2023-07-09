import { useLoaderData, Link } from "@remix-run/react";
import { json } from "@remix-run/node";
import { Row, Col, Button, ListGroup } from "react-bootstrap";
import { jaseciCall } from "~/models/http.server";

export const loader = async () => {
  return json({
      emails: await jaseciCall("list_email",{"status":true}),
  });
}

export default function emailsBlocklist(){
  const {emails} = useLoaderData();

  return (
    <>
      <ListGroup>
        {emails.report?.map((email) => (
          <ListGroup.Item>
          <Row>
              <Col className="col-md-10 pt-1">
                {email.email}
              </Col>
              <Col>
                <Button name="btn_action" variant="outline-success" className="col" type="submit">Unblock</Button>
              </Col>
         </Row>
          </ListGroup.Item>
        ))}
      </ListGroup>
    </>
      );
}
