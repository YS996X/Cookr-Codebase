# Backend Setup Instructions




Use this guide to set up the backend for this project.




It uses Node.js, Express.js, supabase for auth ,  database and API requests and aws for hosting.




Write the complete code for every step and everything. Do not get lazy. Write everything that is needed. create separate files for each page/screen.




I want you to go through all of these instructions before starting to code.


you also need to add comments in the code to explain what that code does.




there are a few mentions of "user" , "app user" , "they" in the instructions. this refers to the users of the app.




make sure to not CODE ANY FRONTEND. we only need the backend for this project. the frontend is already built and is based on flutter. so do not code any frontend. only the backend. i have mentioned at some places how some buttons/actions are supposed to work but most them are only for your reference and do not need to be coded. except redirecting to a different screen for the "study set" once user is done uploading notes. (refer to line 44 for more information but make sure to not miss any of the instructions before that.)


hav

## Helpful Links




If you or the developer get stuck or encounter an error, refer to the following documentation:




- [Express Documentation](https://expressjs.com/en/starter/installing.html)
- [Node.js Documentation](https://nodejs.org/en/docs)
- [Supabase Documentation](https://supabase.com/docs)
- [supabase-flutter-github](https://github.com/supabase/supabase-flutter)




## Install Libraries




Make sure to install all the required libraries or instruct the developer to install them.




## Functionality




This is the most important part. You have to write the complete code for all the functionality that the developer expects in the project.




This app is a study app with a TikTok-like UI.




### How it works:




1. **Uploading Notes:**
   - App users upload their notes into the app, which are then stored in the database as text or PDF. The PDF is converted into text using the OCR API.
   - OCR API endpoint (POST): `https://api.ocr.space/parse/image`
   - API key: `K84041686288957`
   (i might use google vision api instead of ocr space api so make sure you code both in the backend so i can switch between them later. and make sure to add commenents so i know where and what to do)
   - Users can give a title to their notes, which will also be stored in the database.
   - Notes are private and can only be accessed by the user who uploaded them.
     how does the user upload notes?: once user opens the upload notes page. they are shown two boxes 1. title and 2. text notes. they enter the title and text in the respective boxes and click upload. the title and text are stored in the database. they also have a button on the same page to upload pdf called "extract pdf" once the app user clicks on it opens a popup with 2 options 1. "click to upload a file" and 2. is a text box where they can enter the title for it.
REMEMBER: THIS IS INDEXED AND LINKED TO THE USERID OF THAT PARTICULAR USER.

### feed screen:
- this screen is where the questions are displayed after the user clicks on "let me cook" button. for a study set. and then gets rediredted to a screen which shows the text "let's cook {title of the study set}" and has a button which says "let's cook". once the user clicks on "let's cook" button. the user is sent to the feed and questions are displayed on the screen. REMEMBER ONLY ONE QUESTION IS SHOWN PER PAGE AND NEXT QUESTION IS SHOWN AFTER THE USER SCROLLS DOWN.
- the questions are generated using the GPT 3.5 turbo model. remember 2 questions are need to be generated one for the current screen and one for the next screen to avoid empty screens.
2. **Starting a Study Set:**
   - After uploading notes, the user is transferred to the feed screen where they can press a button to start a study set.
   - The study set screen shows the title of the notes at the top and a button named "Let me cook".
   - A study set consists of questions and answers based on the notes uploaded by the user.
   - Questions and answers are generated using the GPT 3.5 turbo model.
   - Example prompt for generating questions:
     ```json
     {
       "model": "gpt-3.5-turbo-instruct",
       "prompt": "The following is an important and crucial part of what you should response back to me. I want you to take a moment to really think with that AI brain of yours and follow my extremely clear instructions. You tend to make the mistake of starting your response with 'Answer' so I stated it many times in this set of instructions, HOPING you would listen for once in your life: I want you to create ONE practice question to test me on ONE piece of info on the attached notes, including the answer following the question. The entire response (question and answer together) must be no more than 75 words. Always stick to the following format NO MATTER WHAT: Start the question with 'Question:' and the answer with 'Answer:'. Never start with a response with 'Answer'. Here's an example if you still don't understand me: 'Question: What is the difference between a proton and an electron? Answer: Protons are positively charged and electrons are negatively charged.' Remember to follow that example. Count your words and ensure the total does not exceed 75 words. Do not add any external information, instead- give a response in 1-3 sentences. Here are the notes: '<notes>' Now with these notes, I want you to test me on the next sentence. The previous question was '<num>' , Do not repeat this question. Move on to another section of these notes. I don't want you to answer the previous question. I want you to create a new one. Another parameter before I go; never leave a response blank. And remember. No matter what, do not begin with the first word as 'Answer:' And always follow the example I gave you.",
       "temperature": 1,
       "max_tokens": 150,
       "top_p": 1,
       "frequency_penalty": 0,
       "presence_penalty": 0
     }
     ```
   - The question is displayed on the screen, and the user can click the "reveal answer" button to see the answer.




3. **Navigating Questions:**
   - Users can scroll up and down to see the next and previous questions.
   - Generate two questions at a time: one for the current screen and one for the next screen to avoid empty screens.
   - A counter called "cooked this session" at the bottom shows the number of questions completed. The counter increases by one each time the user presses the "reveal answer" button and scrolls to the next question. (this counter resets daily at 12am)




4. **Saving and Liking Questions:**
   - Users can save and like questions.
   - Saved/liked questions are stored in the database and can be accessed from the library screen.
   - Users can view their saved/liked questions in a list format.

REMEMBER: THIS IS INDEXED AND LINKED TO THE USERID OF THAT PARTICULAR USER.


### Signup/Login Screen:




- Users can sign up/login using Google login, handled by supabase authentication.
When a user signs up/logs in for the first time their profile picture is fetched from their google profile picture and saved so it can be shown as their profile picture on the app(this app that we’re working on). THIS ONLY HAPPENS ONCE PER USER
For first time login/signups Their day of registration also gets saved and is later shown on the profile. Here is the format “16 September 2008”.THIS ONLY HAPPENS ONCE PER USER
when user signs up/logs in for the first time. generate a random username for them (make sure its unique and not used by anyone else before) and save it in the database. (it could be anything and can be changed later by the user in the settings screen)
when the user signs up for first time their name is fetched from their google account and is saved in the database. and then used as their name in the app and can't be changed later by the user in the settings screen.
Make sure you establish appropriate auth permissions so these tasks are doable.
- After logging in/signing in, users are redirected to the home screen.
- once the user signs up/logs in for first time. a unique userid is generated for them and is stored in the database  its made by supabase authentication. (everything like notes , study sets , liked and saved questions are linked to this userid.)
### userbase / user / user database
- for every user the following data is stored in the database:
- username
- profile picture
- join date
- bio
- streak counter
- aura points counter
- total cooked this session counter
- notes
- study sets
- liked and saved questions
- email / google login information
- userid
- subscription status (free or pro)
- name

how are the users different from each other?: every user has a uniquie id chosen by them. (at first singup, they're given their name from google account as userid but they can change it later in the settings screen.) MAKE SURE NO USERNAME MATCHES WITH EACH OTHER. EVERY USERNAME IS MAXIMUM 13 CHARACTERS LONG. AND AN '@' IS ADDED TO THE START OF THE USERNAME BY DEFAULT. FOR EXAMPLE: @yuvi

### user discovery
- users can discover other users by searching their usernames. how?: 
- the users can click on the "people" button on the up left side of the feed screen. once they click on it they will see the list of all the users that they have visited before in a list. what info will be shown in the list? username , profile picture , aura points and userid. (user can go to that user's profile by clicking on the button beside their profile list) users can also search for other users by entering their usernames in the search bar. once entered the list of the users with matching or similar usernames will be shown. and they can click on the respective user to go to their profile.

MAKE SURE ITS OPTIMIZED FOR RESOURCES.i


### Library Screen:




- This screen shows all the notes uploaded by the user.
- Users can delete notes from the library screen.
- The library screen shows only the titles of the notes and a button to start a study set. Once clicked on a study set it will take the user to the Home Screen and start that study set aka start generating questions and answers using the notes from that respective study set
- users can also search for their notes by entering the title in the search bar. once entered the list of the notes with matching or similar titles will be shown.




### liked questions screen:
this screen shows the questions liked by the user. How does it work: what it does is that once a user likes a question. It gets saved to the database (the question). And can be accessed from liked questions screen. Users can also delete the respective questions after saving them by clicking the delete button beside every question. How does it look in the screen?: this is how it will look
Question: a question
Answer: a answer
Question: a question
Answer: a answer
Question: a question
Answer: a answer
Question: a question
Answer: a answer
     Both answer and question are displayed in different play boxes.
     - users can also search for their liked questions by entering the question in the search bar. once entered the list of the questions with matching or similar questions will be shown.

   REMEMBER: THIS IS INDEXED AND LINKED TO THE USERID OF THAT PARTICULAR USER.




### Saved questions screen:
this screen shows all the saved questions by the user: How does it work: what it does is that once a user likes a question. It gets saved to the database (the question). And can be accessed from liked questions screen. Users can also delete the respective questions after saving them by clicking the delete button beside every question. How does it look in the screen?: this is how it will look
Question: a question
Answer: a answer
Question: a question
Answer: a answer
Question: a question
Answer: a answer
     Both answer and question are displayed in different play boxes.
   - users can also search for their saved questions by entering the question in the search bar. once entered the list of the questions with matching or similar questions will be shown.
   REMEMBER: THIS IS INDEXED AND LINKED TO THE USERID OF THAT PARTICULAR USER.


### Streak counter




- The streak counter is a counter that shows how many days in a row the user has studied.
- The streak counter resets to zero if the user misses a day.
- The streak counter is stored in the database and can be accessed from the profile screen.
   
REMEMBER: THIS IS INDEXED AND LINKED TO THE USERID OF THAT PARTICULAR USER.


### Aura Points (counter)
 - This counter is different than the streak counter (refer to lines 93 to 97). what it does is it looks at two counters. 1. cooked this session and 2. streak counter
 - if the streak counter is less than 10days then there will be a 1x multiplier to the aura points. (it will stay the same as the cooked this session counter)
   if the user has a streak more than 10 and less than 20 days then there will be a 1.1x multiplier to the aura points.(cooked this session counter but multiplied by 1.1)
   if the user has a streak more than 20 and less than 30 days then there will be a 1.2x multiplier to the aura points.(cooked this session counter but multiplied by 1.2)
   if the user has a streak more than 30 days then there will be a 1.3x multiplier to the aura points.(cooked this session counter but multiplied by 1.3)
   REMEMBER THE COOKED THIS SESSION COUNTER RESETS TO ZERO AT 12AM. BUT AURA POINTS COUNTER DOES NOT RESET TO ZERO. AND MAKE SURE THAT AURA POINTS COUNTER IS STORED IN THE DATABASE BEFORE THE COOKED THIS SESSION COUNTER RESETS.

REMEMBER: THIS IS INDEXED AND LINKED TO THE USERID OF THAT PARTICULAR USER.


   REMEMBER: the streak counter is different from the aura points counter. AND DOES NOT RESET TO ZERO AND IS DIFFERENT FOR EACH USER.






### Profile Screen:




- This screen shows the user's profile information, including username, name, profile picture, and the name of the most recent study set.
- users can edit their username. by clicking on the username in the profile screen. by clicking on the settings button in the top right corner. under the place where it shows the username. there is small button that says "change username". once clicked it will open a popup with a text box and a submit button. once submitted the username will be updated. RULES FOR NAME CHANGE
- A counter shows how many days in a row the user has studied aka streak. The counter resets to zero if the user misses a day.
- Users can edit their bio, which can be seen by other users. bio can be edited once users click on their bio and it will open a popup with a text box and a submit button. once submitted the bio will be updated.
- profile screen also shows the join date of the user.

 - users can upload their profile photo. by clicking on the profile photo in the profile screen. it will open a popup where they can upload a photo from gallery or camera. (only for their own profile)


 




Remember: You do not need to create the front end for this app. Just the backend. The frontend is already built and is based on Flutter.






### leaderboard screen:
- this screen shows the top 10 users with the most aura points. to be able displayed on the leaderboard screen. the user must have atleast 350 aura points. if not they will not be displayed on the leaderboard screen.
leaderboard has all the 10 people listed in order from 1st to 10th with their aura points and name. and also their profile picture. people can click on the respective user to go to their profile.
### algorithm


since we have a feed screen. aka where study sets are displayed. we need an algorithm to optimize the question to the user's liking. this is how it works:
- if user likes a question. user will see similiar questions in feed. (after every one - two scrolls).




### Question Generator Implementation

The question generator is a crucial component of our study app. It uses the Claude 3.5 Sonnet model to create questions based on user notes. Here's how to implement it:

1. Create a `generateQuestion` function that takes two parameters:
   - `notes`: A string containing the user's study notes
   - `previousQuestionNum`: A number or string representing the previous question (to avoid repetition)

2. Implement input validation to ensure `notes` is a non-empty string.

3. Construct the prompt for the AI model using the provided template. Include the `notes` and `previousQuestionNum` in the prompt.

4. Make an API call to the Claude 3.5 Sonnet model using axios. Use the following endpoint and parameters:
   - Endpoint: `https://api.anthropic.com/v1/complete`
   - Method: POST
   - Headers: 
     - 'Content-Type': 'application/json'
     - 'Authorization': `Bearer ${process.env.ANTHROPIC_API_KEY}`
   - Body:
     - prompt: The constructed prompt
     - model: 'claude-3.5-sonnet'
     - max_tokens_to_sample: 150
     - temperature: 1
     - top_p: 1
     - frequency_penalty: 0
     - presence_penalty: 0

5. Extract the generated question and answer from the API response. The response should be in the format "Question: [question] Answer: [answer]".

6. Return an object with two properties:
   - question: The extracted question
   - answer: The extracted answer

7. Implement error handling:
   - Log any errors that occur during the API call
   - Throw a new error with a user-friendly message

8. Use environment variables to store sensitive information like the API key.

9. Export the `generateQuestion` function so it can be used in other parts of the application.

Remember to install the necessary dependencies (axios) and set up the environment variable for the API key before using this function.



### error logging
- any error that occurs in the backend should be sent to the developer via this discord webhook: https://discord.com/api/webhooks/1294088919864049674/kVggMNLjKlyvL_rrTwVdoIXi6wDhwMVVsjhnP8YfObp7EEduH7IidxaPNfFw1XAbaOQG . how to send error logs to the developer via this webhook: make sure to ping @everyone in the webhook so the developer knows to check it. then send the error message , error stack and the line number where the error occured in the code. and what was the error.



### rate limiting
- make sure to implement rate limiting in the backend. for what?
- for the pdf notes upload add a limit of 2 uploads per day (limit of 10 uploads per day for pro users)

Use a rate limiting middleware (e.g., express-rate-limit) to enforce these limits. Ensure rate limit information is included in API responses.




### userdatabase
- the userdatabase is created using indexes and every user is connected to their userid created by firebase authentication. 
- the userdatabase is used to store the user's data such as username, profile picture, join date, bio, streak counter, aura points counter, total cooked this session counter, notes, study sets, liked and saved questions, email / google login information, userid, subscription status (free or pro) all of it is indexed and linked to the userid. 
- everything is indexed and linked to the userid. to make it easier and faster to access the data.


## Scheduled Tasks

Implement the following scheduled tasks to maintain system integrity:

1. Daily Reset:
   - Reset the "cooked this session" counter for all users at 12 AM local time.
   - Update Aura Points before resetting the counter.

2. Streak Update:
   - Check and update user streaks daily at 12 AM local time.
   - Reset streak to zero for users who didn't study the previous day.

3. Leaderboard Update:
   - Recalculate and update the leaderboard daily at 1 AM.


### weekly report
- every week you need to send a weekly report to the developer via discord webhook. what is it? it is a summary of the past week's activities. what should be included in this report?
- total number of new users added
- total number of users who upgraded to pro
- total number of users who downgraded from pro to free
- total number of study sets created
- total number of questions liked and saved
- how much resources were used by the application the past week.
- in a properly formatted markdown format.
make sure to ping @everyone in the webhook so the developer knows to check it.


### emergency report
- every time there is an error that the developer needs to know about immediately. you need to send a report to the developer via discord webhook. the message should be "EMERGENCY: [error message] at [file name] on [line number]"
- everytime there is too much traffic on the server. you need to send a report to the developer via discord webhook. the message should be "TOO MUCH TRAFFIC: [error message] at [file name] on [line number]"
- everythime there is suspecious activity on the server. you need to send a report to the developer via discord webhook. the message should be "SUSPICIOUS ACTIVITY: [error message] at [file name] on [line number]"
- everytime the apis are down. you need to send a report to the developer via discord webhook. the message should be "APIS ARE DOWN: [error message] at [file name] on [line number]"
- everytime the server is running slow. you need to send a report to the developer via discord webhook. the message should be "SERVER IS RUNNING SLOW: [error message] at [file name] on [line number]"
- everytime some service is down. you need to send a report to the developer via discord webhook. the message should be "[service name] IS DOWN: [error message] at [file name] on [line number]"
- everytime suspecious bot activity is detected on the server. you need to send a report to the developer via discord webhook. the message should be "SUSPICIOUS BOT ACTIVITY DETECTED: [error message] at [file name] on [line number]" (it could be a brute force scrolling for example generating and scrolling through questions really fast which is not normal and suspecious. and could be done by bots or someone using a auto-clicker or auto-scroller.) (make sure to include the userid of the user who's activity is suspecious in the message. and what they were doing before it happened.)
- make sure to ping @everyone in the webhook so the developer knows to check it.


### API Structure Implementation

Develop a RESTful API structure that covers all functionalities described in the previous instructions. Follow these guidelines:

1. Create endpoints for all major features:
   - User authentication and management
   - Note upload and management
   - Study set creation and management
   - Question generation and interaction
   - User discovery and search
   - Leaderboard functionality

2. Use appropriate HTTP methods (GET, POST, PUT, DELETE) for each endpoint.

3. Implement proper request/response formats:
   - Use JSON for data exchange
   - Include appropriate status codes in responses
   - Provide meaningful error messages

4. Ensure all endpoints are properly authenticated and authorized.

5. Implement versioning for the API to allow for future updates.

6. Document each endpoint with:
   - Description of its functionality
   - Required parameters
   - Expected response format
   - Possible error scenarios

Remember to keep the API design RESTful and intuitive for frontend integration.

### Database Schema Design

Create a comprehensive database schema that efficiently stores all required data. Consider the following:

1. Design tables/collections for:
   - Users
   - Notes
   - Study Sets
   - Questions (liked/saved)
   - Leaderboard data

2. Implement appropriate relationships between tables/collections.

3. Use indexing strategies to optimize query performance, especially for:
   - User-specific data retrieval
   - Leaderboard calculations
   - Search functionality

4. Ensure the schema supports all features described in the previous instructions.

5. Implement data validation rules at the database level where appropriate.

6. Consider data types carefully to optimize storage and query performance.

7. Design the schema with scalability in mind, anticipating future growth.

### Authentication Flow Implementation

Develop a secure authentication flow using Google login and supabase authentication. Include the following:

1. Implement the Google sign-in process using supabase authentication.

2. Create a token-based authentication system for API requests.

3. Implement secure token storage and transmission.

4. Handle token refresh and expiration gracefully.

5. Implement logout functionality, ensuring proper token invalidation.

6. Store necessary user information securely upon first login/signup.

7. Implement appropriate error handling for authentication failures.

8. Ensure the authentication flow works seamlessly with the frontend Flutter app.

For all these tasks, prioritize security, performance, and scalability. Implement best practices for Node.js and Express.js development, and ensure comprehensive error handling and logging throughout the system. The AI should use these guidelines to create a robust, efficient, and secure backend implementation that aligns with the overall project requirements.

### Sharing questions
- users can share their in-feed questions with other users. how to do it: there is a button on the near every question (just like save and like buttons) in the feed screen. it looks like a 'share' icon. when clicked it will open a popup. which will basically show that question and and answer and the reveal button just like on the feed screen but this time there will be a few more things like the name of the study set. on the up side it says "this question was sent by [name of the user]. then user will get a app popup to able to share that question with other people in a form of link. how to implement it:
implement caching for the most frequently accessed data. if necessary.


### mcq questions 
- just like how we have a feed screen to display questions. we have a seprate feed for mcq questions. 
- we will use the same claude 3.5 sonnet model to generate mcq questions. and here is the sample prompt:
```json
{
  "model": "gpt-3.5-turbo-instruct",
  "prompt": ""Based on the following student's notes and the provided index number, generate a multiple-choice question. Use the sentence corresponding to the index number to create the question. Ensure the question includes four answer options labeled 'a)', 'b)', 'c)', and 'd)', and clearly indicate the correct answer by its letter (e.g., 'b'). Maintain the format exactly as follows:

Notes:
<notes>

Index Number: <num>

Format:

Question: [Insert Question Based on the Indexed Sentence]
a) [Option 1]
b) [Option 2]
c) [Option 3]
d) [Option 4]
Answer: [Correct Answer's Letter]

Example Prompt:

Using the following notes and the index number, create a multiple-choice question:

Notes:

In 1492, Columbus sailed the ocean blue.
He was looking for a new trade route to Asia but instead discovered the Americas.
The voyage was funded by the Spanish monarchs, Ferdinand and Isabella.
Index Number: 2

Format:

Question: What was Columbus searching for when he discovered the Americas?
a) A new continent
b) A trade route to Asia
c) Wealth and gold
d) The Fountain of Youth
Answer: b"

",
  "temperature": 1,
  "max_tokens": 120,
  "top_p": 1,
  "frequency_penalty": 0,
  "presence_penalty": 0
}
```

-  it works the same way as the feed screen. but only difference is that this time there will be 4 options and only one of them will be correct. it also ustilizes the notes from the user. use most of the same instructions as the feed screen. how user uses it once on the screen: user will be on the mcq feed screen. and it will show a question and 4 options. the user clicks and selects a option and then clicks on the reveal button to see if they got it right or wrong. and the user can click on the share button to share the question with other users. they can also save or like the question.
(its the same a feed screen just the different study mode)

- how can user activate this mode? once user starts a study set. they can click on the "search icon" on the feed screen. where they will see two options. standard and multiple choice. they click on multiple choice and study set starts. thats it. they can do the same to switch to standard mode if they are in mcq mode. by clicking on the "search icon" and then clicking on standard.(make these only work when user is in the parallel  screen. meaning: if the user is in standard mode they can switch to mcq mode and same for the mcq mode they can switch to standard mode too. but if the user is in the standdard mode and try to click and switch to standard mode it will not work. same for the mcq mode. they need to be in the parallel screen to be able to switch modes. if not then it will not work.)


mode switching:
- if the user is in standard mode and they click on the "search icon" they will see two options. standard and multiple choice. they click on multiple choice and study set starts. thats it. they can do the same to switch to standard mode if they are in mcq mode. by clicking on the "search icon" and then clicking on standard.(make these only work when user is in the parallel screen. meaning: if the user is in standard mode they can switch to mcq mode and same for the mcq mode they can switch to standard mode too. but if the user is in the standdard mode and try to click and switch to standard mode it will not work. same for the mcq mode. they need to be in the parallel screen to be able to switch modes. if not then it will not work.)




### sharing questions
- users can share their in-feed questions with other users. how to do it: there is a button on the near every question (just like save and like buttons) in the feed screen. it looks like a 'share' icon. when clicked it will open a popup. which will basically show that question and and answer and the reveal button just like on the feed screen but this time there will be a few more things like the name of the study set. on the up side it says "this question was sent by [name of the user]. then user will get a app popup to able to share that question with other people in a form of link. how to implement it:
once a user clicks on the share button. save that question and answer in the database and link it to a random id. then generate a shareable link using the id. and then send that link to the user. and then when the user clicks on the link it will open the app and show that question and answer. and then the user can click on the reveal button to see if they got it right or wrong. and the user can click on the share button to share the question with other users. they can also save or like the question. (question gets deleted from the database after 20 days.) (remember only in-app user who is logged in can acces the shared questions. if they're not logged in they will be redirected to the login screen. and if the user does not have the app installed they will be redirected to the playstore or appstore to download the app.)


...

### API Endpoints

Implement the following API endpoints for the backend. These endpoints cover all the functionality described in the previous sections:

Implement the following API endpoints for the backend:

1. User Authentication:
   - POST /api/auth/signup - Register a new user
   - POST /api/auth/login - Log in a user
   - POST /api/auth/logout - Log out a user
   - GET /api/auth/user - Get current user information

2. Notes Management:
   - POST /api/notes - Upload a new note (text or PDF)
   - GET /api/notes - Retrieve all notes for the current user
   - GET /api/notes/:id - Retrieve a specific note
   - PUT /api/notes/:id - Update a note
   - DELETE /api/notes/:id - Delete a note

3. Study Sets:
   - POST /api/studysets - Create a new study set
   - GET /api/studysets - Retrieve all study sets for the current user
   - GET /api/studysets/:id - Retrieve a specific study set
   - PUT /api/studysets/:id - Update a study set
   - DELETE /api/studysets/:id - Delete a study set

4. Question Generation:
   - POST /api/questions/generate - Generate questions for a study set
   - GET /api/questions/:studySetId - Retrieve questions for a specific study set

5. User Interactions:
   - POST /api/questions/:id/like - Like a question
   - POST /api/questions/:id/save - Save a question
   - DELETE /api/questions/:id/like - Unlike a question
   - DELETE /api/questions/:id/save - Unsave a question

6. User Profile:
   - GET /api/users/:username - Get user profile
   - PUT /api/users/profile - Update user profile

7. Leaderboard:
   - GET /api/leaderboard - Get the current leaderboard

8. User Discovery:
   - GET /api/users/search?query=:searchTerm - Search for users

9. Sharing Questions:
   - POST /api/questions/:id/share - Generate a shareable link for a question
   - GET /api/shared-questions/:uniqueId - Retrieve a shared question

10. Study Modes:
    - POST /api/studysets/:id/mode - Switch study mode (standard/multiple choice)

11. OCR:
    - POST /api/ocr - Convert PDF to text using OCR

Ensure all endpoints are properly authenticated where necessary and implement appropriate error handling and response formats for each endpoint.

once app is opened make sure its connected to the server and it is sending and recieving data properly.

### make sure all the apis are working fine and are stored somewhere secure and are not exposed to the public. (have all the apis in one single seprate file) maybe use a .env file to store the apis.


### API Implementation Instructions

Follow these instructions to implement the API endpoints for your backend. Ensure that each endpoint is secure, efficient, and well-documented.

#### 1. User Authentication

- **POST /api/auth/signup**
  - **Description:** Register a new user.
  - **Request:** Accepts user details (e.g., email, password).
  - **Response:** Returns a success message and user ID.
  - **Security:** Ensure password hashing and input validation.

- **POST /api/auth/login**
  - **Description:** Log in a user.
  - **Request:** Accepts email and password.
  - **Response:** Returns a JWT token for authentication.
  - **Security:** Validate credentials and handle failed attempts.

- **POST /api/auth/logout**
  - **Description:** Log out a user.
  - **Request:** Accepts a JWT token.
  - **Response:** Returns a success message.
  - **Security:** Invalidate the token on the server.

- **GET /api/auth/user**
  - **Description:** Get current user information.
  - **Request:** Requires a valid JWT token.
  - **Response:** Returns user details.
  - **Security:** Ensure token validation.

#### 2. Notes Management

- **POST /api/notes**
  - **Description:** Upload a new note (text or PDF).
  - **Request:** Accepts note data and user ID.
  - **Response:** Returns the note ID and success message.
  - **Security:** Validate file types and sizes.

- **GET /api/notes**
  - **Description:** Retrieve all notes for the current user.
  - **Request:** Requires user ID.
  - **Response:** Returns a list of notes.
  - **Security:** Ensure user authentication.

- **GET /api/notes/:id**
  - **Description:** Retrieve a specific note.
  - **Request:** Requires note ID.
  - **Response:** Returns note details.
  - **Security:** Validate user access to the note.

- **PUT /api/notes/:id**
  - **Description:** Update a note.
  - **Request:** Accepts updated note data.
  - **Response:** Returns a success message.
  - **Security:** Validate user access and input data.

- **DELETE /api/notes/:id**
  - **Description:** Delete a note.
  - **Request:** Requires note ID.
  - **Response:** Returns a success message.
  - **Security:** Validate user access.

#### 3. Study Sets

- **POST /api/studysets**
  - **Description:** Create a new study set.
  - **Request:** Accepts study set data.
  - **Response:** Returns study set ID and success message.
  - **Security:** Validate input data.

- **GET /api/studysets**
  - **Description:** Retrieve all study sets for the current user.
  - **Request:** Requires user ID.
  - **Response:** Returns a list of study sets.
  - **Security:** Ensure user authentication.

- **GET /api/studysets/:id**
  - **Description:** Retrieve a specific study set.
  - **Request:** Requires study set ID.
  - **Response:** Returns study set details.
  - **Security:** Validate user access.

- **PUT /api/studysets/:id**
  - **Description:** Update a study set.
  - **Request:** Accepts updated study set data.
  - **Response:** Returns a success message.
  - **Security:** Validate user access and input data.

- **DELETE /api/studysets/:id**
  - **Description:** Delete a study set.
  - **Request:** Requires study set ID.
  - **Response:** Returns a success message.
  - **Security:** Validate user access.

#### 4. Question Generation

- **POST /api/questions/generate**
  - **Description:** Generate questions for a study set.
  - **Request:** Accepts study set ID and parameters.
  - **Response:** Returns generated questions.
  - **Security:** Validate input data.

- **GET /api/questions/:studySetId**
  - **Description:** Retrieve questions for a specific study set.
  - **Request:** Requires study set ID.
  - **Response:** Returns a list of questions.
  - **Security:** Validate user access.

#### 5. User Interactions

- **POST /api/questions/:id/like**
  - **Description:** Like a question.
  - **Request:** Requires question ID.
  - **Response:** Returns a success message.
  - **Security:** Ensure user authentication.

- **POST /api/questions/:id/save**
  - **Description:** Save a question.
  - **Request:** Requires question ID.
  - **Response:** Returns a success message.
  - **Security:** Ensure user authentication.

- **DELETE /api/questions/:id/like**
  - **Description:** Unlike a question.
  - **Request:** Requires question ID.
  - **Response:** Returns a success message.
  - **Security:** Ensure user authentication.

- **DELETE /api/questions/:id/save**
  - **Description:** Unsave a question.
  - **Request:** Requires question ID.
  - **Response:** Returns a success message.
  - **Security:** Ensure user authentication.

#### 6. User Profile

- **GET /api/users/:username**
  - **Description:** Get user profile.
  - **Request:** Requires username.
  - **Response:** Returns user profile details.
  - **Security:** Ensure user authentication.

- **PUT /api/users/profile**
  - **Description:** Update user profile.
  - **Request:** Accepts updated profile data.
  - **Response:** Returns a success message.
  - **Security:** Validate input data.

#### 7. Leaderboard

- **GET /api/leaderboard**
  - **Description:** Get the current leaderboard.
  - **Request:** No specific parameters required.
  - **Response:** Returns leaderboard data.
  - **Security:** Ensure user authentication.

#### 8. User Discovery

- **GET /api/users/search?query=:searchTerm**
  - **Description:** Search for users.
  - **Request:** Requires a search term.
  - **Response:** Returns a list of matching users.
  - **Security:** Ensure user authentication.

#### 9. Sharing Questions

- **POST /api/questions/:id/share**
  - **Description:** Generate a shareable link for a question.
  - **Request:** Requires question ID.
  - **Response:** Returns a shareable link.
  - **Security:** Ensure user authentication.

- **GET /api/shared-questions/:uniqueId**
  - **Description:** Retrieve a shared question.
  - **Request:** Requires unique ID.
  - **Response:** Returns question details.
  - **Security:** Validate access to shared content.

#### 10. Study Modes

- **POST /api/studysets/:id/mode**
  - **Description:** Switch study mode (standard/multiple choice).
  - **Request:** Requires study set ID and mode.
  - **Response:** Returns a success message.
  - **Security:** Validate user access.

#### 11. OCR

- **POST /api/ocr**
  - **Description:** Convert PDF to text using OCR.
  - **Request:** Accepts PDF file.
  - **Response:** Returns extracted text.
  - **Security:** Validate file types and sizes.

### Security and Environment

- **Environment Variables:** Store all sensitive information, such as API keys and database credentials, in a `.env` file. Ensure this file is not exposed to the public.
- **API Security:** Ensure all APIs are secured and not exposed to unauthorized access. Use authentication and authorization mechanisms to protect endpoints.
- **Error Handling:** Implement comprehensive error handling and logging for all endpoints to ensure issues are tracked and resolved efficiently.

### ADMOD
- only show ads to non subscribers.
- 1 ad every 3 scrolls. (skippable by scrolling away just like in instagram reels)
- using admod native advanced
- sound of ads should be muted.
ads can be both picture or videos
-- i will make the ad placeholder later.
### APP'S WHOLE FUNCTIONALITY:

- when user opens the app they will see the splash screen for 2 seconds.
- then they will see the login screen. (only if the user is not logged in)
- once they are logged in or already were logged in. they will see the home screen.
- first screen will be the let's cook screen. if the user has never added any notes or started any study set. it'll say "let's cook" and the text under it which is a variable will be "Start by adding your notes to use the app." (prevent them from scrolling up and down until they added notes and then started study set.)
- but if has already used the app before and also added notes and started study set. it'll say "let's cook {name of the last study set they did before turning off the app}" and the app will use that study set to generate the questions. (remember last used study set will always be the default until they use another study set.)
- once users scrolls they can interact with screen by cliking on reveal button to see if they got it right or wrong. and they can click on the share button to share the question with other users. they can also save or like the question.
- i have already told you how the aura points , streaks, leaderboard and cooked this session works.
- users can discover other users by searching for them (in the friends screen). they can see the other users profile by clicking on them. and they can see the other user's name , username , aura points , streak and profile picture.
- remember the recently visited profiles get added to the top of the friends screen.
- i have already told you how everything else works.


### ADD BARRIES TO MY GPT API REQUESTS SO NO ONE CAN ABUSE IT OR ACCES THE API KEY OR OTHER INFORMATION THAT IS STORED IN THE .ENV FILE. OR THE OTHER INFORMATION THAT THEY ARE NOT SUPPOSED TO ACCESS. (MAKE SURE THEY CANT ASK API ABOUT IT OR ANYTHING ELSE. IF THEY DO THEN IN THE FEED SCREEN JUST KEEP REPEATING THIS TEXT FOR EVERY QUESTION AND ANSWER "RESPONSE WAS BLOCKED BECAUSE IT WAS ASKING FOR SENSITIVE INFORMATION. IF YOU THINK THIS IS AN PLEASE CONTACT THE DEVELOPER")


### SUBSCRIPTIONS:

- USERS can subscribe to the pro subscription outside the app(on the website) using paypal.
it'll be a monthly subscription.

- subscription status is stored in the database.
 - once a user subscribes to monthly subscription.their status will changed in the database (using paypal api once the payment is done send the info to db with user's email. match that email with the user's email in the database and then change the subscription status to true.)
 - USERS SHOULD INSTANTLY RECIEVE THE SUBSCRIPTION STATUS CHANGE. AFTER THEY SUBSCRIBE. (REmove their subscription if they disputed th epayment , cancelled it etc,)


 - once the subscription is active. the base aura ticker for them is 1.5x (even if they miss streaks)
 - once the subscription is active. they can use the app without ads.


### subscription page in the settign: subscribers and non subscribers will see different things. non subscribers will see the subscribe button and subscribers will see the unsubscribe section.


