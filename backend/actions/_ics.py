from jaseci.jsorc.live_actions import jaseci_action
import requests
from ics import Calendar

# make get request for ics file;
def get_ics_file(url: str):
    r = requests.get(url, allow_redirects=True)
    file_contents = r.text
    return file_contents

def calendar_object(calendar:str):
    return Calendar(calendar)


# retrieve all meetings
def retrieve_all_meetings(events:set):
    event_details = []
    for event in events:
        event_details.append(
            {
                "name" : event.name,
                "begin" : event.begin,
                "end" : event.end,
                "duration" : event.duration
            }
        )
    return event_details

        
    
def get_all_free_sloths(meeting_duration:int,meeting_period:int,events:list):
    utc = arrow.utcnow()




# query all meetings based on 


x = get_ics_file("https://outlook.live.com/owa/calendar/5dd44912-d8a8-44d1-927a-15bedeae9eae/ebad0b0e-7dd1-448c-a01e-f56c7671a1d8/cid-8177ED928A8238C2/calendar.ics")
c = calendar_object(x)
z = retrieve_all_meetings(c.events)
print(z[0])

