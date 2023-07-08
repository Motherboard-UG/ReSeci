node sessions;

node session {
    has session_id;
    has session_data = {};
}




##### WALKERS FOR SESSIONS #######

walker create_session {
    has anchor id;

    root: take -->node::app;

    app: take -->node::sessions;

    sessions {
        interger = rand.interger(0 ,99999);
        id  = rand.word() + interger.str ;
        spawn here ++>node::session(session_id = id);
    }
}


walker login {
    has email;
    has password;
    has anchor session_id;

    root: take -->node::app;

    app: take -->node::users;

    users {
        user = -->node::user(email = email , password = password);

        if(user.length == 0) {
            report:status = 400;
            report "Wrong user Credientals";
            disengage;
        }

        else {
            session_id = spawn net.root() walker::create_session;

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