walker send_email_plain_text {
    can  request.post;
    has access_token = "EwCIA8l6BAAUAOyDv0l6PcCVu89kmzvqZmkWABkAARaLG/HWzTSMnaAD5n/V0PARpwDZ5TS/W3iv6+5l74bJyobDPSmg4wJ+NojmxL5rvnnIoqyJHohaT2i+OMpu4QJR3NaTGe8l7i3uU5c/cY4TQ16x+0k04h8paxw6ysoHNgW8NVxQIeFNzTrUYQz87O7on1CBthbbdcIg+Lb6rP+OB0tuGbZi5xu3pPActHpfhvppEPMKmUCI9gvyHRmXK0IO0aheeXfGWTilPSsOjODZ+pBv5WQmlwBhMtq0m4fS/VzUMOF6C7vm9lZTT7dAy37QpaD7ALZ80rlpw8wKyd5E6bXwcFoG77eX9sdKMmFx96bMH7VrPs6aAr45HMGqu2UDZgAACIbWC3rWacOoWAJWKA2UyGt5ucrPBDd9Hs2byhOJrzjeAZK88m8dXvxYBX5upDm5qmOtq6i4tw7B5t27JogkuFkxcGTn/ShQ2CTnnG9wYs6fF4oj/3kU12eQpDF80DEwK8qAZxSwPioryZXIpcVD+f6YucjvY1wXYQqPVXFb/faXYlYMZtLGFQ7a023ijotigx5JjI5bQNj7OWyq7WBhtMhvGWSa24hf2OHbYnnuITgypINbtQe+fRhFMuklHc7aZukciengqpFKYTOxnCkAmmDgHhDczh3VI1v9HtxiDC7ruUYMXvjJzCS5a4DT58HcLwtHTfNAZxHaIISP1Y65bb6zxuM/QLxo6yWSmwJOQ2onXXcjKanE8/qykb1voUoKxAI8tJ/lBBNrUE5u7FCKFgZkFGsvTt14D4Bzd1/BCOfz6xurHiQ7zrzYgQ5CU5YRNnqFSBQLF9s9nfdcwKy59ltSZ1XCmu29qHHaY+7wv/L5rkK5oYvXyxJe5DH94xkQUTTd/LfkIDPA38H9AfszCaKLgxaERLa/KIbgVn83jk+jXdReSbDJ7fGG8fn4H6lC+GnYRHxXR60mFr/YvGf8C0ICEufHqQbWolpDLntoHURHC+xey1ZBiCtmR/VyGvLKVACYJi8rsHbtpCP95+UFkX1qF3Teh6e6oD+MW0RPiRp6wvrFSCNRFpIy6VRH6DZ5RveVsFqPLeb9xy/9DKKVzVD1Z+q/yUj9XgxM6rxz2okCmzgO9jRX8vj5VM9MDScBldK6B0kYjrbRX5zkBEVbfAaOdMV74IjP/Bnkl84hkJ9D+e6TAg==";
    has graph_url = "https://graph.microsoft.com/v1.0/me/sendMail";
    has messsage;
    has email;
    has subject;


    root {

    email_msg = {
                "message": {
                        "subject": null,
                        "body": {
                        "contentType": "Text",
                        "content": null
                        },
                    "toRecipients": [
                {
                    "emailAddress": {
                    "address": null
                    }
                }
            ]
        }
    } ;

    email_msg['message']['content'] = message;
    email_msg['message']['toRecipients'][0]['emailAddress']['address'] = email;
    headers={'Authorization': 'Bearer ' + access_token};
    report request.post(graph_url,email_msg,headers);



    }
}

walker send_email_html {
    can request.post;

    has access_token = "EwB4A8l6BAAUAOyDv0l6PcCVu89kmzvqZmkWABkAAYFywKkCMqB4RUOPi+bZo5RS5428UnL9UYf7+FrZXZjEk0ogEh1X06dshm/XYqSYBPeL3xCe3zZer5Uxdiby89ZA/9dO5y/YT7crRWyOd5agvapNGLDylX/RQ8GINSSnwVI3biZmjJmAOxYurJ6HzqcgEcWH/ZlFE1oGLOeg1qakCmWTEdyKv1xo2JTZbvIf+JAAgLPelmyNdyRBvmgzxDUYn0K6NasVG7YQhBe4hvuwhygbeFVSduIGYDS/+k9mwuSgMYxg2qwJcg2Nb9BFmBHw+IQCa6uCaH4tSQN0GQ79N+JQSStpsiCWrlPybazpSgU73kWHxwAXFPLxMSQhjpoDZgAACAWUDwu/U83SSAKaROUm5Ms0YESB/CPWh8p/NTERk4VALzmFIR3k9ODc4/jI0di1sjUQIKXiTHuwl5KGTVXdDwiDR6BR0272lVOwjy7mzhtf2JIyW1HLjaKvQEBx1C1ujFOWjjlMrr6ZCo0nxyq16TnF/h5qsztlJxiJBnPYDXdNtQltbczvi5EdGAXz14Vf7GOVjU8we0/yi2ZOWNdMDPOWavhbvDEF1yow6pXY8/Qi4tRqLos6vJxS1DMRmRw2WIob3m3JWWbDMenzOmUtzgTYkPNka9MUe8NOoA0mrekvqxRB7Aa6OUQHqvS+Que7P8AzQ+q/v6U6LN05wyHfYqKTyrnLl8XdKlpWlksZ+byD9kQEWJuzkldMXUKbF2WB/kk9X+FGBNsO+Vmcfp3F2iZFbfqYXaI0okQUGclnT7MCvYIVWSvl51+BwkdDT/fbPJISZnWYwEhoeUl96Z2wPh2bis1sKKzUdyJsPnRrJipgCJNDdmV0SEhKSx0dj1zixF7JFEdNc6jKrPErJ4JhAd7NBQUZb+kuOvTIvWgbqOCNbD1JtOXeYUD1lEScwIppc/wocWUfoJmepGUnpyYuUS3PU66naI5idCA0bR6QS0lZzvYLxJHKVUZOuJ6HMX6VXVuBnr4kT5QxtsqXO0q2ThkBjrc3TqBJ1GsdHdQBcGsAOMlkhB6uSukLTo1gIY8URWNV585sKNE6fI332sOcjVRJnAGkqfYN9M02aLq8RwVySfYriYWndXaAk7N+6OXl5NG0I30B41dza0qCbAHR6gYLxJMC";
    has graph_url = "https://graph.microsoft.com/v1.0/me/sendMail";
    has messsage;
    has email;

    root {

        email_msg = {
                "message": {
                        "subject": "Meet for lunch?",
                        "body": {
                        "contentType": "HTML",
                        "content": "<h1>This is an important message<h1><ol><li>test 1</li> <li>test 2</li></ol>"
                        },
                    "toRecipients": [
                {
                    "emailAddress": {
                    "address": null
                    }
                }
            ]
        }
    } ;

    //email_msg['message']['content'] = message;
    email_msg['message']['toRecipients'][0]['emailAddress']['address'] = email;
    headers={'Authorization': 'Bearer ' + access_token};
    report request.post(graph_url,email_msg,headers);

    }

}