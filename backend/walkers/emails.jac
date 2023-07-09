
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
    has blocked;
    has _status = false;

    root: take -->node::app;

    app: take -->node::emails;

    emails {
        if(_status) {
            take -->node::email(blocked == blocked);
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

    emails: take -->node::email(email == email);

    email {
        here.blocked = !here.blocked;
     }


}


walker list_email_alone {
    has anchor _emails = [];
     root: take -->node::app;

    app: take -->node::emails;

    emails {
       take -->node::email;
    }

    email: {

        _emails.list::append(here.email);

    }

}