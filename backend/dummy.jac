walker init  {
    // can langchain.extract_entities;

    // text = "i want a meeting with john@gail.com,sarahJodna@gmail.com,booby@gmail.com within the next 42 hours for about 1 hour";

    // entities = langchain.extract_entities(text);

    // std.out(entities);

    // can utils.closest_match;

    // email = "john@gmail.com";
    // emails = ["jon@gmail.com" ,"joh@gmail.com","sarah@gmail.com"];

    // std.log(utils.closest_match(email,emails));
//     can utils.reduced_timestamp;

//     x = utils.reduced_timestamp(1);

//     std.out(x);
// }

can ics.free_time_slots;
can ics.same_time_slots;
can ics.format_time_slots;

x = ics.free_time_slots(1,10,"https://outlook.live.com/owa/calendar/d679a9a5-fcc1-4d58-9092-b1b59ecaec8d/39b27dc5-24eb-4343-a746-33ae94b23e26/cid-D1CFFE605B17A0E0/calendar.ics");
z = ics.format_time_slots(x);
std.out(z);

}