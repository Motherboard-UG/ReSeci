walker email_trigger:anyone {
    has email = {
        "name" : "John Smith",
        "email" : "Shiw@gmail.com",
        "content" : "I need a meeting with john@74.com, mary@75.com and adam@75.com within the next 48 hours"
    }


    root: take -->node::agent;

    agent {
        ::extract_data;
        is_approved = spawn here walker::approved_user(email["email"]);
    }
}