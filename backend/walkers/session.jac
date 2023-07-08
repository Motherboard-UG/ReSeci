

##### WALKERS FOR SESSIONS #######

walker create_session {
    has anchor id;
    can rand.integer ;
    can rand.word;
    has email;
    can utils.generate_uuid;

    root: take -->node::app;

    app: take -->node::sessions;

    sessions {
        existing_session = -->node::session(email == email);
        if(existing_session){
            take existing_session[0];
        }
        else {
       
        id  = utils.generate_uuid();
        std.log(id);
        spawn here ++>node::session(session_id = id);
        }
       
    }

    session {
        id = here.session_id;
    }
}


walker login {
    has email;
    has password;
    has anchor session_id;

    root: take -->node::app;

    app: take -->node::users;

    users {
        user = -->node::user(email == email, password == password);

        if(user.length == 0) {
            report:status = 400;
            report "Wrong user Credientals";
            disengage;
        } 
        else {
            std.log("usersss");
            session_id = spawn net.root() walker::create_session;
            report:custom = {
                "success" : true,
                "session_id" : session_id,
                "user_id" : user[0].info['jid']
            };

        }
    }


}



walker logout{
    has session_id;

    root: take -->node::app;

    app: take -->node::sessions;

    sessions {
        if(!session_id){
            report:status = 400;
            report "No session ID";
            disengage;

        }else {
            take -->node::sesssion(session_id == session_id);
        }

    }

    session {
        report "Successfully deleted session token";
        destroy here;
    }

}



walker delete_sessions {

    root: take -->node::app;

    app: take -->node::sessions;

    sessions: take -->node::session;

    session : destroy here;
}