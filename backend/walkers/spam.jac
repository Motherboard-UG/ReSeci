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

    requests  = spawn here walker::list_request(isReporting = false); 
    spam_volume = spawn here walker::get_spam_volume;
    std.log(spam_volume);
    spam_time = spawn here walker::get_spam_time;
    std.log(spam_time);
    timestamp  = utils.reduced_timestamp(spam_time);
    std.log(timestamp);


    for i = 0 to i < requests.length by i+=1 {

        if(requests[i]['email'] == send_email){
            std.log();
            if( requests[i]['timestamp'] > timestamp){
                std.log("this is highhhh");
                detected_request.list::append(requests[i]);
            }
        }
    }
    std.log(detected_request);
    if(detected_request.length >= spam_volume){
        spawn here walker::update_email(email = send_email);
        isSpam = true;
    }




  }




}


