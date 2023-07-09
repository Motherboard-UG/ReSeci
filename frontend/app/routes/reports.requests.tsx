import { Table } from "react-bootstrap";
import { useLoaderData } from "@remix-run/react";
import { json } from "@remix-run/node";
import { jaseciCall } from "~/models/http.server";

export const loader = async () => {
  return json({
      requests: await jaseciCall("list_request",{}),
  });
}

export default function reportsRequests(){
  const {requests} = useLoaderData();

  return (
    <div className="mt-3">
      <Table>
        <thead>
          <tr>
            <th scope="col" className="col-md-4">From Email</th>
            <th scope="col" className="col-md-4">To Email</th>
            <th scope="col" className="col-md-2">Duration</th>
            <th scope="col" className="col-md-2">Time Period</th>
          </tr>
        </thead>
        <tbody>
        {requests.report?.map((request) => (
          <tr key={request.jid}>
            <td>{request.email_from}</td>
            <td>{request.email_to}</td>
            <td>{request.meeting_duration}</td>
            <td>{request.meeting_period}</td>
          </tr>
              ))}
        </tbody>
      </Table>
    </div>
      );
}
