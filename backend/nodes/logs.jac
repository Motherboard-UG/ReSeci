node logs;


node log {
    has user_id;
    has action;
    has timestamp;

}


walker add_log {
    has user_id = 0;
    has action;
    can date.timestamp_now;


    root:take -->node::app;

    app:take -->node::logs;

    logs {

        if(!action) {
            report:status = 400;
            report  "Missing action argument";
            disengage;
        }else {
            spawn here ++>node::log(
                user_id = user_id,
                action = action,
                timestamp = date.timestamp_now()
            );
        }

        report {"success": true , "message":"Successfully added user settings"};

    }
}



walker list_logs {

    root: take -->node::app;

    app: take -->node::logs;

    logs:take -->node::log;

    log {
        report {
            "user_id" : here.user_id,
            "action" : here.action,
            "timestamp" : here.timestamp
        };
    }
}