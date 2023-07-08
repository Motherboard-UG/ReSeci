walker email_trigger {
   has emails = [];
   has meeting_hours;
   has meeting_duration;
   has payload = {
      "sender" : "shiw@gmail.com"
   };
   has excluded = [];
   has included = [];

   root: take -->node::app;

   app: take -->node::agent;

   agent {

      is_approved = spawn net.root() walker::approved_sender(sender_email = payload['sender']);

      if(!is_approved) {
               spawn net.root() walker::send_email_plain_text(
               messsage="You are not authorzed to request meetings with persons in this organisation",
               email = payload['sender'],
               subject = "Unauthorize Access"
               );
               disengage;
      }
      else {

         here::extract_entities;

         for i = 0 to i < emails.length by i +=1 {
            permission = spawn net.root() walker::on_exclusion_list(emails[i]);

            if(permission): included.list::append(emails[i]);
            else: excluded.list::append(emails[i]);
         }

         if(included){
            //get meeting time;
            std.log("out");
            if(excluded){
               // modify resposne to include the not included


            }
            else {
               // get meeting times
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


}