node users;

node user {
    has email;
    has name;
    has access_token;
    has password;
}



##### CRUD WALKERS FOR USERS ########


walker add_user {
    has name;
    has email;
    has access_token;
    has password;


    root {
        if(!email or !name or !access_token or !password) {
            report {"success": false , "message":"Missing required parameters"};
            disengage;
        } 

        else: take -->node::app;


    } 

    app: take -->node::users;

    users {

        spawn here ++>node::user(name = name , email = email, access_token = access_token, password = password);
        report {"success": true , "message":"Successfully created user"};


    }

}


walker list_users {

    root: take -->node::app;

    app : take -->node::users;

    users: take -->node::user;

    user: {
        report {
            "user_id" : here.info['jid'],
            "name" : here.name,
            "email" : here.email,
            "access_token" : here.access_token

        };
    }

}

walker update_user { 
    has user_id;
    has name;
    has email;
    has access_token;
    has password;


    root {
        if(user_id): take *(user_id);
        else {
            report:status = 400;
            report "No user ID present";
            disengage;
        }
    }

    user {
        if(name) : here.name = name;
        if(email): here.email = email;
        if(access_token) : here.access_token = access_token;
        if(password): here.password = password;

        report {"success": true , "message":"Successfully updated user"};
    }
}


walker delete_user {
    has user_id;

      root {
        if(user_id): take *(user_id);
        else {
            report:status = 400;
            report "No user ID present";
            disengage;
        }
    }

    user {
        report {"success": true , "message":"Successfully deleted user"} ;

        destroy here;
    }


}