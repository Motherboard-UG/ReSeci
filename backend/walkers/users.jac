

##### CRUD WALKERS FOR USERS ########


walker add_user {
    has email;
    has name;
    has calendar_link = null;
    has password;
    has permission = true;


    root {
        if(!email or !name or !password) {
            report {"success": false , "message":"Missing required parameters"};
            disengage;
        } 
        else: take -->node::app;
    } 
    app: take -->node::users;

    users {
        spawn here ++>node::user(name = name , email = email, calendar_link = calendar_link, password = password,permission = permission);
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
            "calendar" : here.calendar_link,
            "permission" : here.permission
        };
    }
}

walker update_user { 
    has name;
    has email;
    has calendar_link;
    has password;
    has permission;


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
        if(calendar_link): here.calendar_link = calendar_link;
        if(password): here.password = password;
        if(permission):here.permission = permission;

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


walker get_user {
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
        report {
            "user_id" : here.info['jid'], 
            "name" : here.name,
            "email" : here.email,
            "calendar" : here.calendar_link,
            "permission" : here.permission
        };
    }
}


walker list_excluded_users {
    root: take -->node::app;

    app: take -->node::users;

    users: take -->node::user(permission == false);

    user {
        report {
            "user_id" : here.info['jid'],
            "name" : here.name,
            "email" : here.email,
            "calendar" : here.calendar_link,
            "permission" : here.permission
        };
    }

}


walker list_included_users {
    root: take -->node::app;

    app: take -->node::users;

    users: take -->node::user(permission == true);

    user {
        report {
            "user_id" : here.info['jid'],
            "name" : here.name,
            "email" : here.email,
            "calendar" : here.calendar_link,
            "permission" : here.permission
        };
    }

}