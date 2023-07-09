walker init  {
    // can langchain.extract_entities;

    // text = "i want a meeting with john@gail.com,sarahJodna@gmail.com,booby@gmail.com within the next 42 hours for about 1 hour";

    // entities = langchain.extract_entities(text);

    // std.out(entities);

    // can utils.closest_match;

    // email = "john@gmail.com";
    // emails = ["jon@gmail.com" ,"joh@gmail.com","sarah@gmail.com"];

    // std.log(utils.closest_match(email,emails));
    can utils.reduced_timestamp;

    x = utils.reduced_timestamp(1);

    std.out(x);
}