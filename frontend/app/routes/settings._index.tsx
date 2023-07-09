import { useLoaderData } from "@remix-run/react";
import { ListGroup, Form, Row, Col, Button } from "react-bootstrap";
import { json } from "@remix-run/node";
import { jaseciCall } from "~/models/http.server";

export const loader = async () => {
  return json({
      settings: await jaseciCall("get_global_settings",{}),
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
                  <div className="pb-0">
                    {setting.name}
                    <br/>
                  </div>
                  <sub className="pt-0">
                    {setting.description}
                  </sub>
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
        <Button className="mt-4" variant="primary" type="submit">
          Update
        </Button>
      </>
      );
}
