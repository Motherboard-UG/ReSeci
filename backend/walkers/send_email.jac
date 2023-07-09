walker send_email_plain_text {
    can  request.post;
    has access_token = "jcwKy59ltSZ1XCmu29qHHaY+ReSbDJ7fGG8fn4H6lC+GnYRHxIy6VRH6DZ5RveVsFqPLeb9xy/9DKKVzVD1Z+q/yUj9XgxM6rxz2okCmzgO9jRX8vj5VM9MDScBldK6B0kYjrbRX5zkBEVbfAaOdMV74IjP/Bnkl84hkJ9D+e6TAg==";
    has graph_url = "https://graph.microsoft.com/v1.0/techtonic_hackathon@outlook.com/sendMail";
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

    has access_token = "EwCQA8l6BAAUAOyDv0l6PcCVu89kmzvqZmkWABkAAU4FC6lPhs96TLEnaBvwxSlvey7LtdmDEzl9Uz8xj/rEeErfckiAjm7pggmvcXwaQ/iNF8xPEKNFg13cBoXPJvfDAKEsicRsohaKzyzR9fQWpADz3nvc/H0qPBe0s6ucXUfzllVseBevsc2q8MOIYT29IKDDj8u1GobcupKU/oUuAGF1smBXyS0L612oRX4G0LTtmZ0LW+hLrR+SPr0V0k+GuwdX1iB276GjNq2s9GTiQig0i9al5pi+z+aFPUFJ0oNO4Cp/efoNS2ve/ZsNBVruKm/jPK6n7oTwLjF89Oyu6RTJXJOp/GJwtVjsTcWJQDh/IP/XTozArCR6mH6Dzs0DZgAACBNKgNSsDs3lYAIji2Ltbh2Rg36gDTpOFd/S5RA1JfDfZviF4BeX7bOYVkg7S22pMP1u8BDQfgqiaJV6fXhkuQduMpOvHmQS8UsTUCkE2l60VdoclLytz0m957RP88X+VhmBq4L+hXQFTQpZ0WPETsUENTRJO788LZZMC66zn1kZvSE1Bf96QfrAvqLGVpSNocdpeVyFJJv9d21SMfwMLi1THDUCUPnY5+Y/pl/IJabU7R2MRlUrE39tDIya98e1ZctJfXskOClq9//JMV3ZaaaQus6QsWv2jwVPRUVrtvQmZn+OcH9HlVnPNHG9OAViE4wudiJGCdKRnKN1DNpL5hSlwVMprNBRK5CleuJ6P4Wv79v0yFXLKJj7u1ZR3Gw/3IORsZsd5SVzDUKJf0Vhv7Ry9SBMU0UDJYXATGpN5IY0ZEUK1Ir53XV5yJmTtThJVraPKDj6p8eEVXujUworsYZL2bfNbma3Pwb+nbfsCpg2rdA4ptG88HB/yIV7B74Zf2EoEMsX3uvSM9Svb8QCG0RKonHkuiFthakgsT378Ew8BjSA0j1QeLPu+YfwYmGfv0kkCgltB1pPsOVdooPBrxIKWZJM3ho9qtJRqq874iSTTint5Fgm0KdlyDSWo0VU+nVR5YoohjrtomPqsrnU9dTzx8NIOWadMdXo0Ibi77NKw6EVwHTTkXbHrn5bWBJ+EVWfUCPW5LhsHSIh2QHO3a6u70JQ8lFn5pOzs1NVPDxanYm8uObXGXuICPYRS4fQiUiB7HefSF0hekXZ/BasdoFBAvinE8BwZe1ffrULUDl/uLGgOwbYArdUNa8C";
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