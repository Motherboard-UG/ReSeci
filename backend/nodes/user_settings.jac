

node user_setting {
    has user_id;
    has future_period = {"value": null , "description" : "Period of time you access the user calendar"};
}



######CRUD WALKERS FOR USER SEETINGS ######

walker add_settings {
    has user_id;
    has future_period;

    root {
        if(user_id):take *(user_id);
        else {
            report:status = 400;
            report "No user ID present";
            disengage;
        }
    }

    user {
        user_settings = -->node::user_settings;
        if(user_settings.length > 0) {

            report:status = 400;
            report "User setting record already created";
            disengage;

        }

        if(!future_period){
            report:status = 400;
            report "No user ID present";
            disengage;
        }
        else {
            settings = spawn here ++> node::user_setting(user_id = user_id);
            take settings;
        }
    }

    user_setting {
        here.future_period['value'] = future_period;

        report {"success": true , "message":"Successfully added user settings"};

    }

}




walker update_settings {
    has user_id;
    has future_period;
}