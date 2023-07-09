node global_settings {
    has future_search = {"name" : "Future Search","value" : 24 , "description" : "Number of hours in future bot searches calendar."};

}



walker get_global_settings {

    root : take -->node::app;

    app: take -->node::global_settings;

    global_settings {
        report here.future_search;
    }

}