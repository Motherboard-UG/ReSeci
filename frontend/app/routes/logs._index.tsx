import { useLoaderData } from "@remix-run/react";
import { json } from "@remix-run/node";
import { ListGroup } from "react-bootstrap";
import { jaseciCall } from "~/models/http.server";

export const loader = async () => {
  return json({
      emails: await jaseciCall("list_logs",{}),
  });
}

export default function logsIndex(){
  const {logs} = useLoaderData();

  return (
  <>
    <ListGroup>
      {logs.report?.map((log) => (
        <ListGroup.Item>
          {log.user_id} - {log.timestamp} - {log.action}
        </ListGroup.Item>
      ))}
    </ListGroup>
    </>
      );
}
