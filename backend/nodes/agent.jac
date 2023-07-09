node agent  {
    can langchain.extract_entities;
    can ics.free_time_slots;
    can ics.same_time_slots;
    // determine standarized format for requester 
    //handle improper request sent 

    // check if sender is on approved list
    //parse body of email in to list of email address
    // search company directory for employees

    // develope logic to find cloest match to user email.
    // pull empty sloths for person or person in emails

    // compose email and send   
    # extract the emails and hours if present 
    can extract_data {
        text = visitor.payload['message']['body']["content"];
        emails = [];
        meeting_hours = 48;
        meeting_duration = 1;
        entities = langchain.extract_entities(text);

        if(entities){
            for i = 0 to i < entities.length by i +=1 {
                if(entities[i]){
                    if(entities[i]["person_email"]): visitor.emails.list::append(entities[i]["person_email"]);
                    if(entities[i]["meeting_hours"]): visitor.meeting_hours = entities[i]["meeting_hours"];
                    if(entities[i]["meeting_duration"]): visitor.meeting_duration = entities[i]["meeting_duration"];
                }

            }
        }

    }

    can get_meetings {
       
        included = visitor.included;
        meeting_hours = visitor.meeting_hours;
        meeting_duration = visitor.meeting_duration;
        time_slots = [];

        if(included.length > 1){
            for emails in included {
                calendar_link = spawn net.root() walker::get_users_by_email(email = email);
                std.log("calendar lik",calendar_link);
                if(calendar_link){
                    meets = ics.free_time_slots(meeting_duration,meeting_period,calendar_link);
                    std.log("meets",meets);
                    time_slots.list::append(meets);
            }

        }

        if(time_slots):
            visitor.same_time_slots = ics.same_time_slots(time_slots);


        }
        else {
            calendar_link = spawn net.root() walker::get_users_by_email(email = included[0]);
            std.log("calendar lik",calendar_link);
            if(calendar_link){
                meets = ics.free_time_slots(meeting_duration,meeting_period,calendar_link);
                std.log("meets",meets);
                visitor.same_time_slots = meets;      
            }

    }

}
}