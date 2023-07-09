walker email_trigger {
   has emails = [];
   has meeting_hours;
   has meeting_duration;
   has payload = {
    "message": {
        "subject": "Meet for lunch?",
        "body": {
            "contentType": "Text",
            "content": "i want a meeting with shiw@gail.com,hackathon_three@gmail.com,booby@gmail.com within the next 10 hours for about 1 hour"
        },
        "toRecipients": [
            {
                "emailAddress": {
                    "address": "dominic.braam@gmail.com"
                }
            }
        ]
    },
    "sender" : "shiw@gmail.com"
    };
   has excluded = [];
   has included = [];
   has closest_match = [];
   has same_time_slots;
   can utils.closest_match;

   root: take -->node::app;

   app: take -->node::agent;

   agent {
      
      # detect spam 
      is_spam =  spawn net.root() walker::detect_spam_email(send_email = payload['sender']);
      if(is_spam) {
         spawn here walker::add_request(to_email = "Spam",from_email =payload['sender'] ,meeting_duration = 0, meeting_period = 0,body = payload['message']['body']['content'],status = false);
         disengage;
      }
      report "Is not spam";
      # check if user is approved
      is_approved = spawn net.root() walker::approved_sender(sender_email = payload['sender'], blocked = false);
      report "The sender is approved";

      if(!is_approved) {
               spawn net.root() walker::send_email_plain_text(
               messsage="You are not authorzed to request meetings with persons in this organisation",
               email = payload['sender'],
               subject = "Unauthorize Access"
               );
               disengage;
            spawn here walker::add_request(to_email = "Spam",from_email =payload['sender'] ,meeting_duration = 0, meeting_period = 0,body = payload['message']['body']['content'],status = false);

      }
      else {
         # using an LLM extract entities;
         here::extract_data;
         _emails = spawn net.root() walker::get_users_email;
         for i = 0 to i < emails.length by i+=1{
           mail =  utils.closest_match(emails[i],_emails);
           if(mail):
                closest_match.list::append(mail);
         }

         report "Meeting duration " + meeting_duration.str ;
         report "Meeting Period: " + meeting_hours.str + "hours" ;
         report emails;
         report closest_match;

         spawn here walker::add_request(to_email = closest_match,from_email =payload['sender'] ,meeting_duration = meeting_duration, meeting_period = meeting_hours,body = payload['message']['body']['content'],status = true);

      }
         # find matches for emails sent in and query match if spelt wrong
         for i = 0 to i < closest_match.length by i +=1 {
            permission = spawn net.root() walker::on_exclusion_list(email = closest_match[i]);
            std.log(permission,"=========",closest_match[i]);

            if(permission): included.list::append(closest_match[i]);
            else: excluded.list::append(closest_match[i]);
         }

         if(included){
            //get meeting time;
            std.log("out");
            if(excluded){
               #get free meeting slots
                here::get_meetings;

                report ["Time slots" ,visitor.same_time_slots];
               // modify resposne to include the not included
               //  headingone = "<h3>The emails from who we queried</h3>";

               // for x in included {
               //    headingone = headingone + "<p>" + x + "</p>";

               // }

               // meetings = visitor.same_time_slots;
               // ol = "<h3>These are the times avaliable</h3><ol>";

               // for meeting in meetings {
               //    ol = ol + "<li>" + meeting['start_time'] + " to " + meeting['end_time'] + '</li>';

               //  }

               // ol = ol + "</ol>";
               // headingtwo = "<h3>These emails are not accessible at the moment</h3>";

               // for x in included {
               //    headingtwo = headingtwo + "<p>" + x + "</p>";

               // }

               //  spawn net.root() walker::send_email_html(
               //    messsage= headingone + ol + headingtwo,
               //    email = payload['sender'],
               //    subject = "Time slots avaliable"
               //    );
                  disengage;

            }
            else {
               // get meeting times
                  here::get_meetings;
                  report ["Time slots" ,visitor.same_time_slots];

                

               // headingone = "<h3>The emails from who we queried</h3>";

               // for x in included {
               //    headingone = headingone + "<p>" + x + "</p>";

               // }

               // meetings = visitor.same_time_slots;
               // ol = "<h3>These are the times avaliable</h3><ol>";
               // for meeting in meetings {
               //    ol = ol + "<li>" + meeting['start_time'] + " to " + meeting['end_time'] + '</li>';

               //  }

               // ol = ol + "</ol>";

               // spawn net.root() walker::send_email_html(
               //    messsage= headingone + ol,
               //    email = payload['sender'],
               //    subject = "Time slots avaliable"
               //    );
                  disengage;

            }

         }
         else {
            if(excluded){
               report ["you cannot access these emails" , excluded];
               // message = "<h3>You cannot request meeings from the following</h3><ol>";
               // for i = 0 to i < included.length by i+=1 {
               //    message = message + "<li>" + excluded[i] + "</li>";

               // }
               // message = message + "</ol>";
               // spawn net.root() walker::send_email_html(
               //    messsage= message,
               //    email = payload['sender'],
               //    subject = "Unauthorize Access"
               //    );
                  disengage;
            }
             

         }

      }


   }   

   