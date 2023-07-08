node agent  {
    can langchain.extract_entities;
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
        text = visitor.email["content"];
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

}