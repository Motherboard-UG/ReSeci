import { useLoaderData, Link } from "@remix-run/react";
import { json } from "@remix-run/node";
import { Table, Button, Form, Row } from "react-bootstrap";
import { jaseciCall } from "~/models/http.server";

export const loader = async () => {
  return json({
      users: await jaseciCall("list_users",{}),
  });
}

export default function usersIndex(){
  const {users} = useLoaderData()

  return (
    <>
      <div className="float-end">
        <Link to="/users/new" className="btn btn-primary" role="button">Add New</Link>
      </div>

      <Table>
        <thead>
          <tr>
            <th scope="col" className="col-md-2">Name</th>
            <th scope="col" className="col-md-4">Email</th>
            <th scope="col" className="col-md-4">Token</th>
            <th scope="col" className="col-md-2">Action</th>
          </tr>
        </thead>
        <tbody>
        {users.report?.map((user) => (
          <tr key={user.user_id}>
            <td>{user.name}</td>
            <td>{user.email}</td>
            <td>{user.access_token}</td>
            <td>
            <Row>
              <Form method="post">
                <Form.Control name="user_id" type="hidden" value={user.user_id} />
                <Form.Control name="name" type="hidden" value={user.name} />
                <Form.Control name="email" type="hidden" value={user.email} />
                <Form.Control name="access_token" type="hidden" value={user.access_token} />
                <Link to={`/users/edit/${user.user_id}/${user.name}/${user.email}/${user.access_token}`} className="btn btn-primary col me-2" role="button">Edit</Link>
                <Button variant="outline-danger" className="col" type="submit">x</Button>
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
