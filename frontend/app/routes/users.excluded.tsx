import { useLoaderData, Link } from "@remix-run/react";
import { json } from "@remix-run/node";
import { Table, Button, Form, Row } from "react-bootstrap";
import { jaseciCall } from "~/models/http.server";

export const loader = async () => {
  return json({
      users: await jaseciCall("list_excluded_users",{}),
  });
}

export default function usersBlocked(){
  const {users} = useLoaderData();

  return (
    <>
      <Table>
        <thead>
          <tr>
            <th scope="col" className="col-md-4">Name</th>
            <th scope="col" className="col-md-6">Email</th>
            <th scope="col" className="col-md-2">Action</th>
          </tr>
        </thead>
        <tbody>
        {users.report?.map((user) => (
          <tr key={user.user_id}>
            <td>{user.name}</td>
            <td>{user.email}</td>
            <td>
              { (user.name == "admin") ? null :
                <Row>
                  <Form method="post">
                    <Form.Control name="user_id" type="hidden" value={user.user_id} />
                    <Link to={`/users/edit/${user.user_id}/${user.name}/${user.email}/${user.calendar}`} className="btn btn-primary col me-2" role="button">Edit</Link>
                    <Button name="btn_action" variant="warning" className="col me-2 btn-add" type="submit" value="exclude_action">Inc</Button>
                    <Button name="btn_action" variant="outline-danger" className="col" type="submit" value="delete_action">Del</Button>

                  </Form>
                </Row>
              }
            </td>
          </tr>
              ))}
        </tbody>
      </Table>
    </>
      );
}
