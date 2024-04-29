# README

This README covers the setup of project for codehall assignment

it covers project setup instructions and sample input and output response

## Requirements

This app currently works with:

* Ruby 3.1.0
* Rails 6.1.4
* PostgreSQL

Once the code is pulled correctly and required dependencies are installed, execute one by one

# bundle install (installs all the gems)

# rails db:create (creates database)

# rails db:migrate (executes the migration files)

# rails db:seed (some sample data is added in seed file)

After this you should be able to start the server

##url
http://127.0.0.1:3000/user_exams  [POST]

## Sample api body

{
  "first_name": "Shreyas",
  "last_name": "Sudhakaran",
  "phone_number": "123457",
  "college_id": "1",
  "exam_id": "1",
  "start_time": "01/05/2024"
}

## Sample api resonse
{
    "success": true,
    "message": "",
    "data": {
        "id": 5,
        "user": {
            "id": 4,
            "first_name": "Shreyas",
            "last_name": "Sudhakaran",
            "phone": "123457"
        },
        "exam": {
            "id": 1,
            "name": "Test exam",
            "college": {
                "id": 1,
                "name": "Test College"
            }
        },
        "start_time": "2024-05-01T00:00:00.000+05:30"
    },
    "meta": [],
    "errors": []
}
