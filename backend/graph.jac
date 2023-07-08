node app;

graph app_graph {
    has anchor app;

    spawn {
        app = spawn node::app;
        agent = spawn node::agent;
        users = spawn node::users;
        emails = spawn node::emails;
        global_settings = spawn node::global_settings;
        logs = spawn node::logs;
        requests = spawn node::requests;

        
        app ++> users;
        app ++>  emails;
        app ++> global_settings;
        app ++>logs;
        app ++>requests;
    }
}