walker email_trigger {
   has emails = [];
   has meeting_hours;
   has meeting_duration;
   has payload = {
    "message": {
        "subject": "Meet for lunch?",
        "body": {
            "contentType": "Text",
            "content": "i want a meeting with shiw@gail.com,hackathon_three@gmail.com,booby@gmail.com within the next 42 hours for about 1 hour"
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

       is_spam =  spawn net.root() walker::detect_spam_email(send_email = payload['sender']);
      if(is_spam): disengage;


      is_approved = spawn net.root() walker::approved_sender(sender_email = payload['sender'], blocked = false);
  
      is_approved = true;
      if(!is_approved) {
               spawn net.root() walker::send_email_plain_text(
               messsage="You are not authorzed to request meetings with persons in this organisation",
               email = payload['sender'],
               subject = "Unauthorize Access"
               );
               disengage;
      }
      else {

         here::extract_data;
         _emails = spawn net.root() walker::get_users_email;
         for i = 0 to i < emails.length by i+=1{
           mail =  utils.closest_match(emails[i],_emails);
           if(mail):
                closest_match.list::append(mail);
         }

         std.log(closest_match);

      }
         for i = 0 to i < closest_match.length by i +=1 {
            permission = spawn net.root() walker::on_exclusion_list(email = closest_match[i]);
            std.log(permission,"=========",emails[i]);

            if(permission): included.list::append(closest_match[i]);
            else: excluded.list::append(closest_match[i]);
         }

         if(included){
            //get meeting time;
            std.log("out");
            if(excluded){
                here::get_meetings;
               // modify resposne to include the not included

            }
            else {
               // get meeting times
                here::get_meetings;
                std.log(same_time_slots);



            }

         }
         else {
            if(excluded){
               message = "<h3>You cannot send emails to the following</h3><ol>";
               for i = 0 to i < included.length by i+=1 {
                  message = message + "<li>" + excluded[i] + "</li>";

               }
               message = message + "</ol>";
               spawn net.root() walker::send_email_html(
                  messsage= message,
                  email = payload['sender'],
                  subject = "Unauthorize Access"
                  );
                  disengage;
            }
             

         }

      }


   }   

   