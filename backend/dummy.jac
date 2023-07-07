walker init  {
    can langchain.extract_entities;

    text = "i want a meeting with john@gail.com,sarahJodna@gmail.com,booby@gmail.com within the next 42 hours for about 1 hour";

    entities = langchain.extract_entities(text);

    std.out(entities);
}