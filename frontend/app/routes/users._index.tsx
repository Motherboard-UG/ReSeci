import { useLoaderData, Link } from "@remix-run/react";
import { json } from "@remix-run/node";
import { Table, Button, Form, Row } from "react-bootstrap";
import { jaseciCall } from "~/models/http.server";

export const loader = async () => {
  return json({
      users: await jaseciCall("list_included_users",{}),
  });
}

export default function usersIndex(){
  const {users} = useLoaderData();

  return (
    <>
      <div className="float-end">
        <Link to="/users/new" className="btn btn-primary btn-add" role="button">Add New</Link>
      </div>

      <Table>
        <thead>
          <tr>
            <th scope="col" className="col-md-2">Name</th>
            <th scope="col" className="col-md-4">Email</th>
            <th scope="col" className="col-md-4">Calendar Link (ics)</th>
            <th scope="col" className="col-md-2">Action</th>
          </tr>
        </thead>
        <tbody>
        {users.report?.map((user) => (
          <tr key={user.user_id}>
            <td>{user.name}</td>
            <td>{user.email}</td>
            <td><a href={user.calendar}>{user.calendar ? "Download" : null}</a></td>
            <td>
              <Row>
                <Form method="post">
                  <Form.Control name="user_id" type="hidden" value={user.user_id} />
                  <Form.Control name="name" type="hidden" value={user.name} />
                  <Form.Control name="email" type="hidden" value={user.email} />
                  <Form.Control name="calendar" type="hidden" value={user.calendar} />
                  <Form.Control name="permission" type="hidden" value={user.permission} />
                  <Link to={`/users/edit/${user.user_id}`} className="btn btn-primary col me-2" role="button">Edit</Link>
                  <Button name="btn_action" variant="warning" className="col me-2" type="submit" value="exclude_action">Exc</Button>
                  <Button name="btn_action" variant="outline-danger" className="col" type="submit" value="delete_action">Del</Button>
                </Form>
              </Row>
            </td>
          </tr>
              ))}
        </tbody>
      </Table>
    </>
      );
}
