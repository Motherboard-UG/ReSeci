node global_settings {
    has future_period = {"name" : "Future Period","value" : 24 , "description" : "This is the interval in which meetings will be searched"};
}



walker get_global_settings {

    root : take -->node::app;

    app: take -->node::global_settings;

    global_settings {
        report {
            "future_period" : here.future_period
        };
    }

}