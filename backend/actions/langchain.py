from jaseci.jsorc.live_actions import jaseci_action
from dotenv import dotenv_values
from langchain.chat_models import ChatOpenAI
from langchain.chains import create_extraction_chain
import os


@jaseci_action(act_group=["langchain"], allow_remote=True)
def extract_entities(text):
    
    provider = "openai" 
    model_name = "gpt-3.5-turbo-0613" 
    api_key = os.environ("OPENAI_TOKEN")
    schema =  {
        "properties" : {
            "person_email" : {"type" : "string"},
            "meeting_hours" : {"type" : "integer"},
            "meeting_duration" : {"type": "integer"}
        },
        
        "required": ["person_email"]
    }

    if provider == "openai":
        llm = ChatOpenAI(
            temperature=0,
            model_name=model_name,
            openai_api_key = api_key
        )

        chain = create_extraction_chain(schema, llm)
        extracted_entities = chain.run(text)
        return extracted_entities
