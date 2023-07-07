walker send_email {
    can  request.post;
    has access_token = "EwCIA8l6BAAUAOyDv0l6PcCVu89kmzvqZmkWABkAARaLG/HWzTSMnaAD5n/V0PARpwDZ5TS/W3iv6+5l74bJyobDPSmg4wJ+NojmxL5rvnnIoqyJHohaT2i+OMpu4QJR3NaTGe8l7i3uU5c/cY4TQ16x+0k04h8paxw6ysoHNgW8NVxQIeFNzTrUYQz87O7on1CBthbbdcIg+Lb6rP+OB0tuGbZi5xu3pPActHpfhvppEPMKmUCI9gvyHRmXK0IO0aheeXfGWTilPSsOjODZ+pBv5WQmlwBhMtq0m4fS/VzUMOF6C7vm9lZTT7dAy37QpaD7ALZ80rlpw8wKyd5E6bXwcFoG77eX9sdKMmFx96bMH7VrPs6aAr45HMGqu2UDZgAACIbWC3rWacOoWAJWKA2UyGt5ucrPBDd9Hs2byhOJrzjeAZK88m8dXvxYBX5upDm5qmOtq6i4tw7B5t27JogkuFkxcGTn/ShQ2CTnnG9wYs6fF4oj/3kU12eQpDF80DEwK8qAZxSwPioryZXIpcVD+f6YucjvY1wXYQqPVXFb/faXYlYMZtLGFQ7a023ijotigx5JjI5bQNj7OWyq7WBhtMhvGWSa24hf2OHbYnnuITgypINbtQe+fRhFMuklHc7aZukciengqpFKYTOxnCkAmmDgHhDczh3VI1v9HtxiDC7ruUYMXvjJzCS5a4DT58HcLwtHTfNAZxHaIISP1Y65bb6zxuM/QLxo6yWSmwJOQ2onXXcjKanE8/qykb1voUoKxAI8tJ/lBBNrUE5u7FCKFgZkFGsvTt14D4Bzd1/BCOfz6xurHiQ7zrzYgQ5CU5YRNnqFSBQLF9s9nfdcwKy59ltSZ1XCmu29qHHaY+7wv/L5rkK5oYvXyxJe5DH94xkQUTTd/LfkIDPA38H9AfszCaKLgxaERLa/KIbgVn83jk+jXdReSbDJ7fGG8fn4H6lC+GnYRHxXR60mFr/YvGf8C0ICEufHqQbWolpDLntoHURHC+xey1ZBiCtmR/VyGvLKVACYJi8rsHbtpCP95+UFkX1qF3Teh6e6oD+MW0RPiRp6wvrFSCNRFpIy6VRH6DZ5RveVsFqPLeb9xy/9DKKVzVD1Z+q/yUj9XgxM6rxz2okCmzgO9jRX8vj5VM9MDScBldK6B0kYjrbRX5zkBEVbfAaOdMV74IjP/Bnkl84hkJ9D+e6TAg==";
    has graph_url = "https://graph.microsoft.com/v1.0/me/sendMail";
    has messsage;
    has email;


    root {

    email_msg = {
                "message": {
                        "subject": "Meet for lunch?",
                        "body": {
                        "contentType": "Text",
                        "content": "The new cafeteria is open."
                        },
                    "toRecipients": [
                {
                    "emailAddress": {
                    "address": "shiwprasadtimothy@gmail.com"
                    }
                }
            ]
        }
    } ;
    headers={'Authorization': 'Bearer ' + access_token};
    report request.post(graph_url,email_msg,headers);



    }
}