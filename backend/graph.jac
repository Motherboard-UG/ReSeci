node app;

graph app_graph {
    has anchor app;

    spawn {
        app = spawn node::app;
        agent = spawn node::agent;
        users = spawn node::users;

        //connect nodes to app

        app ++> users;
    }
}