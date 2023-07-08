import { useLoaderData, Link } from "@remix-run/react";
import { json } from "@remix-run/node";
import { Table, Button, Form } from "react-bootstrap";
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
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Token</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
        {users?.map((user) => (
          <tr key={user.user_id}>
            <td>{user.name}</td>
            <td>{user.email}</td>
            <td>{user.access_token}</td>
            <td>
            <Form method="post">
              <Form.Control name="user_id" type="hidden" value={user.user_id} />
              <Button variant="outline-danger" type="submit">x</Button>
            </Form>
            </td>
          </tr>
              ))}
        </tbody>
      </Table>
    </>
      );
}
