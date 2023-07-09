from jaseci.jsorc.live_actions import jaseci_action
import requests
from ics import Calendar
import arrow



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

        
    
def get_all_sloths(meeting_duration:int,meeting_period:int):
    time_period = []
    utc = arrow.utcnow()
    #utc  = utc.replace(hour = 9, minute = 0, second = 0)
    end_time =  utc.shift(hours=+ meeting_period)

    # add logic if end time is aftr 9 . kinda important 
    end_time = end.replace(hour = 9, minute = 0, second = 0)

    meeting_start_time = utc 

    while (meeting_start_time < end_time):
            time_period.append(
                {
                    "start_time" : meeting_start_time,
                    "end_time" : meeting_start_time.shift(hours = +meeting_duration)
                }
            )
            meeting_start_time = meeting_start_time.shift(hours = +meeting_duration)

    

    return time_period


def remove_after_before_work_time(time_period:list):

    for period in time_period:

        day_start_time = period['start_time']
        day_end_time = period['end_time']

        day_start_time = day_start_time.replace(hour = 9)
        day_end_time = day_end_time.replace(hour = 17)

        if(period['start_time'] < day_start_time or period['start_time'] > day_end_time):
                time_period.remove(period)

    return time_period


def return_free_time_sloths(working_time:list, event_times:list):

            for i in range(len(working_time)):
                    clash = check_for_clashes(working_time[i],event_times)
                    if(clash):
                        working_time.remove(working_time[i])
            return working_time

def check_for_clashes(time_sloth:dict, event_times:list):
            for i in range(len(event_times)):
                if(time_sloth['start_time'] >= event_times[0]['begin'] and time_sloth['start_time'] <= event_times[0]['end']):
                    return True

                elif(time_sloth['end_time'] <= event_times[0]['begin'] and time_sloth['end_time'] >= event_times[0]['end']):
                        break
                        return True

            return False           


@jaseci_action(act_group=["ics"], allow_remote=True)
def free_time_slots(meeting_duration:int,meeting_period:int,url:str):
    ics_text = get_ics_file(url)
    calendar = calendar_object(ics_text)
    meetings = retrieve_all_meetings(calendar.events)
    sloths = get_all_sloths(meeting_duration,meeting_period)
    cleansed_sloths = remove_after_before_work_time(sloths)
    free_time_sloths = return_free_time_sloths(cleansed_sloths,meetings)

    return free_time_sloths

@jaseci_action(act_group=["ics"], allow_remote=True)
def same_time_slots(slots:list):
    matches = []
    first_meeting = slots[0]
    slots = slots[1:]
    for i in range(len(first_meeting)):

        match = first_meeting[i]['start_time']
        for x in range(slots):
            for y in range(slots[x]):
                if(slots[x][y]['start_time'] == match):
                    matches.append(sloths[x][y])
    return matches









