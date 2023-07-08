function getEnvVars(){
  return {
      JASECI_URL: process.env.JASECI_URL as string,
      JASECI_API_TOKEN: process.env.JASECI_API_TOKEN as string,
    }
}

export async function jaseciCall(endpoint:string,payload:object) {
  const env_vars = getEnvVars();
  const body_object = {name: endpoint, ctx: payload};

  const res = await fetch(
    env_vars.JASECI_URL,
    {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token ' + env_vars.JASECI_API_TOKEN,
        'Connection': "keep-alive"
        },
      body: JSON.stringify(body_object)
    }
  ).then((res) => res.json());

  return res;
}
