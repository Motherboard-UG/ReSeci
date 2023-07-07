from jaseci.jsorc.live_actions import jaseci_action
from dotenv import dotenv_values
from langchain.llms import OpenAI
from langchain import PromptTemplate
from langchain.chat_models import ChatOpenAI
from langchain.chains import create_extraction_chain

# Load environment variables from .env file
env_vars = dotenv_values()

@jaseci_action(act_group=["langchain"], allow_remote=True)
def llm_query(
        provider: str = "openai", 
        model_name: str = "text-davinci-003", 
        api_key: str = "",
        prompt: str = "",
        history: str = "",
        context_data: str = "",
        question: str = "" 
    ):

    template = """{prompt}
        HISTORY: {history}
        CONTEXT: {context}
        QUESTION: {question}
    """

    prompt_template = PromptTemplate(
        input_variables=["prompt","history","context","question"],
        template=template
    )
    
    if provider == "openai":
        llm = OpenAI(
            model_name=model_name,
            openai_api_key = api_key
        )

    if llm:
        message = llm(prompt_template.format(prompt=prompt, history=history, context=context_data, question=question))
        message = message.replace('\n', '')
        message = message.lstrip('\nAnswer: ')
        return message


@jaseci_action(act_group=["langchain"], allow_remote=True)
def extract_entities(text: str = None):
    
    provider = "openai" 
    model_name = "gpt-3.5-turbo-0613" 
    api_key = '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'
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
