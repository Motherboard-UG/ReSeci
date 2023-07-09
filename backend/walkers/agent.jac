walker approved_sender {
    has sender_email;
    has anchor approved;

    root: take -->node::app;

    app: take -->node::emails;

    emails {
        emails = -->node::email(email == email,blocked  == false);
        if(emails): approved = true;
        else: approved = false;
    }

   
}


walker find_closest_match {
    has email;
    can utils.closest_match;

    root: take -->node::app;

    app: take -->node::users;

    users {

        all_emails = -->.node.emails;
        closest_match(email,all_emails);
           
    }
}


walker on_exclusion_list {
    has email;
    has anchor permission;

    root: take -->node::app;

    app: take -->node::users;

    users: take -->node::user(email == email);

    user: permission = here.permission;
}



