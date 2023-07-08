from jaseci.jsorc.live_actions import jaseci_action
import uuid
from difflib import get_close_matches


@jaseci_action(act_group=["utils"], allow_remote=True)
def generate_uuid():
    random_uuid =  uuid.uuid4()
    return random_uuid


@jaseci_action(act_group=["utils"], allow_remote=True)
def closest_match(word,patterns):
   return get_close_matches(word, patterns,1,0.9)
