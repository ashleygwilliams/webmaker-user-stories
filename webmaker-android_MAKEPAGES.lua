-- webmaker-android user story (LOGIN-ONLY)
-- summary: discover -> make new project -> make a blank page x10

-- user agent: android version >= 41
http.set_user_agent_string("Mozilla/5.0 (Android 4.4; Mobile; rv:41.0) Gecko/41.0 Firefox/41.0")

local request_headers = {
  authorization="token thisisatokenthatisnotrealsoyoucantuseitprovideyourown",
  ["Content-Type"]="application/json"
}
local base_url = "https://webmaker-api.herokuapp.com"
local user_path = "/users/884"
local sleeptime  = 45

-- visit discover page
http.request_batch({
    {
      "GET",
      base_url .. "/discover",
      response_body_bytes=10240
    }
  }
)

client.sleep(sleeptime)

-- make a new project
local response = http.request_batch({
  {
    "POST",
    base_url .. user_path .. "/projects",
    headers=request_headers,
    data=json.stringify({
      title="test project name"
    }),
    response_body_bytes=10240
  }
})

client.sleep(sleeptime)

-- parse response to get page URL
response = json.parse(response[1]["body"])
local project_id = response.project.id
local project_path = "/projects/" .. project_id
local page_url = base_url .. user_path .. project_path .. "/pages"

-- request project pages 
http.request_batch({
  {
    "GET",
    page_url,
    response_body_bytes=10240
  }
})

client.sleep(100)

-- utility to make a blank page for a single user's project
function make_page(n)
  local response = http.request_batch({
      {
        "POST",
        page_url,
        headers = request_headers,
        data = json.stringify({
            x = n+1,
            y = 0,
            styles = json.stringify({
              backgroundColor="#f2f6fc"
            })
        }),
        response_body_bytes = 10240
      }
  })
    
    client.sleep(sleeptime)
  
    return response
end

-- make 10 pages
for i=1,10 do make_page(i) end
