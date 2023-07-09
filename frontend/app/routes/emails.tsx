import { Outlet } from "@remix-run/react";
import { authenticator } from "~/models/auth.server";
import { LoaderArgs, ActionArgs, redirect } from "@remix-run/node";
import { jaseciCall } from "~/models/http.server";

export const loader = async ({request}: LoaderArgs) => {
  const user = await authenticator.isAuthenticated(request, {
      failureRedirect: "/login",
  });

  return user;
}

export const action = async ({ request }: ActionArgs) => {
  const formData = await request.formData();

  const form_email = formData.get("email");

    await jaseciCall(
      "block_email",
      { form_email: form_email }
    );

  return redirect("/emails/blocklist");
};

export default function emailsRoute(){
  return (
    <>
      <h1 className="mb-4">Emails</h1>
      <Outlet />
    </>
      );
}
