import { Authenticator, AuthorizationError } from "remix-auth";
import { session_storage } from "~/models/session.server";
import { FormStrategy } from "remix-auth-form";
import { jaseciCall } from "~/models/http.server";

type User = {
  email: string;
  password: string;
};

const authenticator = new Authenticator<User>(session_storage);

const formStrategy = new FormStrategy(async ({form}) => {
    const form_email = form.get("email") as string;
    const form_password = form.get("password") as string;

    const result = await jaseciCall(
      "login",
      {
        email: form_email,
        password: form_password
        }
    );

    if(result.yielded === false){
      throw new AuthorizationError;
    } else {
      return result.user_id;
    }
});

authenticator.use(formStrategy, "form");

export { authenticator };

export async function logout(request:Request){
  return await authenticator.logout(
    request,
    {
      redirectTo: "/login"
    }
  );
}
