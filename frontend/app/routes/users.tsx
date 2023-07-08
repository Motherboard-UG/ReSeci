import { Outlet } from "@remix-run/react";
import { ActionArgs, redirect } from "@remix-run/node";
import { jaseciCall } from "~/models/http.server";

export const action = async ({ request }: ActionArgs) => {
  const formData = await request.formData();

  const form_user_id = formData.get("user_id");

  console.log("id:" + form_user_id);

  await jaseciCall(
    "delete_user",
    { user_id: form_user_id }
  );

  return redirect("/users");
};

export default function usersRoute(){
  return (
    <>
      <h1 className="mb-4">Users</h1>
      <Outlet />
    </>
      );
}
