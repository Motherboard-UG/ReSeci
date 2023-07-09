node global_settings {
    has future_search = {"name" : "Future Search","value" : 72 , "description" : "Number of hours in future bot searches calendar."};
    has spam_time = {"name" : "Spam Period","value" : 10 , "description" : "The period of minutes that will be checked for repeating email"};
    has spam_volume = {"name" : "Spam Volume","value" : 5 , "description" : "Number of emails from a single sender in a period of time to considerit as spam."};
}



walker get_global_settings {

    root : take -->node::app;

    app: take -->node::global_settings;

    global_settings {
        report here.future_search;
        report here.spam_time;
        report here.spam_volume;

    }

}


walker get_spam_time {
    has anchor reponse;
    
    root : take -->node::app;

    app: take -->node::global_settings;

    global_settings {

        reponse = here.spam_time['value'];

    }

}

walker get_spam_volume {
    has anchor reponse;
    
    root : take -->node::app;

    app: take -->node::global_settings;

    global_settings {

        reponse = here.spam_time['value'];

    }

}