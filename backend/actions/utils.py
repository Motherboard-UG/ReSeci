from jaseci.jsorc.live_actions import jaseci_action
import uuid
from difflib import get_close_matches
from datetime import datetime, timedelta

@jaseci_action(act_group=["utils"], allow_remote=True)
def reduced_timestamp(secs:int):
    reduced_time = datetime.now() - timedelta(seconds = secs)
    return reduced_time.timestamp()

@jaseci_action(act_group=["utils"], allow_remote=True)
def generate_uuid():
    random_uuid =  uuid.uuid1()
    return str(random_uuid)


@jaseci_action(act_group=["utils"], allow_remote=True)
def closest_match(word,patterns):
    match = get_close_matches(word, patterns,1,0.9)
    if(match):
        return match[0]
    else:
        return False


