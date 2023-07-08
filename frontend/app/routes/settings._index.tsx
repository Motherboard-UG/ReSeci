import { useLoaderData } from "@remix-run/react";
import { ListGroup, Form, Row, Col } from "react-bootstrap";
import { json } from "@remix-run/node";
import { jaseciCall } from "~/models/http.server";

export const loader = async () => {
  return json({
      users: await jaseciCall("get_global_settings",{}),
  });
}

export default function SettingsIndex(){
  const {settings} = useLoaderData()

  return (
      <>
        <Form>
        {settings.report?.map((setting) => (
          <ListGroup>
            <ListGroup.Item>
              <Row>
                <Col className="m-auto">
                  {setting.name}
                </Col>
                <Col xs={2}>
                  <Form.Group controlId="daysAhead">
                    <Form.Control type="number" placeholder="Default: 7" defaultValue={setting.value} />
                  </Form.Group>
                </Col>
              </Row>
            </ListGroup.Item>
          </ListGroup>
              ))}
        </Form>
      </>
      );
}
