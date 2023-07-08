node requests;


node _request {
    has email;
    has message_id;
    has meeting_duration;
    has meeting_period;
    has body;
}


##### CRUD WALKERS FOR REQUEST ##########


walker add_request {
    has email;
    has message_id;
    has meeting_duration;
    has meeting_period;
    has body;


    root: take -->node::app;

    app: take -->node::requests;

    requests {
        if(!email || !message_id  || !meeting_duration || !meeting_period || !body) {
            report:status = 400 ;
            report "Missing required argument";
            disengage;
        }

        spawn here ++> node::_request(
            email = email,
            message_id = message_id,
            meeting_duration = meeting_duration,
            meeting_period = meeting_period,
            body = body
        );

        report {"success": true , "message":"Successfully added user settings"};

    }

}


walker list_request {

    root: take -->node::app;
    app: take -->node::requests;

    requests: take -->node::request;

    request {
        report {
            "email" : here.email,
            "message_id" : here.message_id,
            "meeting_duration" : here.meeting_duration,
            "meeting_period" : here.meeting_period,
            "body" : here.body
        };
    }

}