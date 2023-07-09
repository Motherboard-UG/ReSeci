
##### CRUD WALKERS FOR REQUEST ##########


walker add_request {
    has to_email;
    has from_email;
    has meeting_duration = "None";
    has meeting_period = "None";
    has body;
    has status;
    can date.timestamp;


    root: take -->node::app;

    app: take -->node::requests;

    requests {
  
        spawn here ++> node::_request(
            to_email = to_email,
            from_email = from_email,
            meeting_duration = meeting_duration,
            meeting_period = meeting_period,
            body = body,
            status = status,
            timestamp = date.timestamp_now()
        );

        report {"success": true , "message":"Successfully added user settings"};

    }

}


walker list_request {
    has anchor request_details = [];
    has isReporting = true;


    root: take -->node::app;
    app: take -->node::requests;
    

    requests: take -->node::_request;

    _request {
        if(isReporting){
            report {
                "to_email" : here.to_email,
                "from_email" : here.from_email,
                "meeting_duration" : here.meeting_duration,
                "meeting_period" : here.meeting_period,
                "body" : here.body,
                "status" : here.status,
                "timestamp" : here.timestamp
            };


        }
     
        request_details.list::append({
            "to_email" : here.to_email,
            "from_email" : here.from_email,
            "meeting_duration" : here.meeting_duration,
            "meeting_period" : here.meeting_period,
            "body" : here.body,
            "status" : here.status,
            "timestamp" : here.timestamp
        }
        );
    }

}


walker get_request{
    has status;

    root: take -->node::app;
    app: take -->node::requests;

    requests: take -->node::_request(status = status);

    _request {
         report {
            "to_email" : here.to_email,
            "from_email" : here.from_email,
            "meeting_duration" : here.meeting_duration,
            "meeting_period" : here.meeting_period,
            "body" : here.body,
            "status" : here.status,
            "timestamp" : here.timestamp

        };

    }



}