walker detect_spam_email {
    has send_email;
    has request_details;
    has spam_volume;
    has spam_period;
    has timestamp;
    has detected_request = [];
    has anchor isSpam = false;
    can utils.reduced_timestamp;


  root {

    requests  = spawn here walker::list_request; 
    spam_volume = spawn here walker::get_spam_volume;
    spam_time = spawn here walker::get_spam_time;
    timestamp  = utils.reduced_timestamp(spam_time);


    for i = 0 to i< requests.length by i+=1 {

        if(requests[i]['email'] == send_email){
            if(requests[i]['timestamp'] > timestamp){
                detected_request.list::append(requests[i]);
            }
        }
    }

    if(detected_request.length >= spam_volume){
        spawn here walker::update_email(email = send_email);
        isSpam = true;
    }




  }




}


