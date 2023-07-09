import { Outlet } from "@remix-run/react";
import { ActionArgs, LoaderArgs, redirect } from "@remix-run/node";
import { jaseciCall } from "~/models/http.server";
import { authenticator } from "~/models/auth.server";

export const loader = async ({request}: LoaderArgs) => {
  const user = await authenticator.isAuthenticated(request, {
      failureRedirect: "/login",
  });

  return user;
}

export const action = async ({ request }: ActionArgs) => {
  const formData = await request.formData();

  const form_user_id = formData.get("user_id");
  const form_permission = formData.get("permission");
  const form_action = formData.get("btn_action");

  if (form_action == 'delete_action'){
    await jaseciCall(
      "delete_user",
      { user_id: form_user_id }
    );
  } else {
    await jaseciCall(
      "update_user",
      {
        user_id: form_user_id,
        permission: !form_permission
        }
    );
  }

  return redirect("/users");
};

export default function usersRoute(){
  return (
    <>
      <h1 className="col mb-4">Staff</h1>
      <Outlet />
    </>
      );
}
