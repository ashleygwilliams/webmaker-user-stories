# webmaker-user-stories
>scripts simulating mozilla webmaker stories for load balancing tests

## webmaker-desktop (READONLY)
A user arriving from the snippet lands on the `/discover` page. They then navigate to a specific project; next, they visit a related project. Finally they return to the `/discover` page.

## webmaker-android (LOGIN)
A pre-existing user enters their username and password. A POST request is made to `/login/oauth/access_token`.

## webmaker-android (MAKE PAGES)
A logged in user hits the `/discover` page and then proceeds to make a project with 10 blank pages in it.
