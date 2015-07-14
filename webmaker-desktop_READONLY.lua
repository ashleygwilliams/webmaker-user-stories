-- webmaker-desktop user story (READ-ONLY)
-- summary: discover -> project -> project -> discover

-- user visits discover page
http.request(
  "GET",
    "https://webmaker-api.herokuapp.com/discover"
)

-- user visits an individual project page
http.request(
  "GET",
    "https://webmaker-api.herokuapp.com/users/717/projects/628"
)

-- user visits a related project page
http.request(
  "GET",
    "https://webmaker-api.herokuapp.com/users/711/projects/616"
)

-- user visits discover page
http.request(
  "GET",
    "https://webmaker-api.herokuapp.com/discover"
)
