
###### CRUD WALKERS  FOR EMAILS ####


walker add_email {
    has email;

    root: take -->node::app;

    app: take -->node::emails;

    emails {

        if(!email) {
            report:status = 400 ;
            report "Missing email ";
            disengage;
        }
        else {
            spawn here ++>node::email(email = email);
            report {"success": true , "message":"Successfully added email"};


        }

    }
}


walker list_email {
    has status;

    root: take -->node::app;

    app: take -->node::emails;

    emails {
        if(status) {
            take -->node::email(status == status);
        }
        else {
            take -->node::email;

        }
    }

    email {
        report {
            "email" : here.email,
            "blocked" : here.blocked
        };
    }

}


walker update_email {
    has email;

    root: take -->node::app;

    app: take -->node::emails;

    emails: take -->node::email(email = email);

    email {
        here.blocked = !here.blocked;
     }


}