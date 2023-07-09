
##### CRUD WALKERS FOR REQUEST ##########


walker add_request {
    has email;
    has meeting_duration = "None";
    has meeting_period = "None";
    has body;
    has status;


    root: take -->node::app;

    app: take -->node::requests;

    requests {
  
        spawn here ++> node::_request(
            email = email,
            message_id = message_id,
            meeting_duration = meeting_duration,
            meeting_period = meeting_period,
            body = body,
            status = status
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
            "meeting_duration" : here.meeting_duration,
            "meeting_period" : here.meeting_period,
            "body" : here.body,
            "status" : here.status
        };
    }

}


walker get_request{
    has status;

    root: take -->node::app;
    app: take -->node::requests;

    requests: take -->node::request(status = status);

    request {
         report {
            "email" : here.email,
            "meeting_duration" : here.meeting_duration,
            "meeting_period" : here.meeting_period,
            "body" : here.body,
            "status" : here.status
        };

    }



}