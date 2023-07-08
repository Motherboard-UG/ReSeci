from jaseci.jsorc.live_actions import jaseci_action
import uuid


@jaseci_action(act_group=["utils"], allow_remote=True)
def generate_uuid():
    random_uuid =  uuid.uuid4()
    return random_uuid
