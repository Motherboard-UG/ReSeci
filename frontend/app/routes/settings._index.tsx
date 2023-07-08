import { ListGroup, Form, Row, Col } from "react-bootstrap";

export default function SettingsIndex(){
  return (
      <>
        <Form>
          <ListGroup>
            <ListGroup.Item>
              <Row>
                <Col className="m-auto">
                  Number of days ahead to look in calendar
                </Col>
                <Col xs={2}>
                  <Form.Group controlId="daysAhead">
                    <Form.Control type="number" placeholder="Default: 7" />
                  </Form.Group>
                </Col>
              </Row>
            </ListGroup.Item>
          </ListGroup>
          <ListGroup>
            <ListGroup.Item>
              <Row>
                <Col className="m-auto">
                  Number of days ahead to look in calendar
                </Col>
                <Col xs={2}>
                  <Form.Group controlId="daysAhead">
                    <Form.Control type="number" placeholder="Default: 7" />
                  </Form.Group>
                </Col>
              </Row>
            </ListGroup.Item>
          </ListGroup>
          <ListGroup>
            <ListGroup.Item>
              <Row>
                <Col className="m-auto">
                  Number of days ahead to look in calendar
                </Col>
                <Col xs={2}>
                  <Form.Group controlId="daysAhead">
                    <Form.Control type="number" placeholder="Default: 7" />
                  </Form.Group>
                </Col>
              </Row>
            </ListGroup.Item>
          </ListGroup>
        </Form>
      </>
      );
}
