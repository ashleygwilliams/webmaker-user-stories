-- webmaker-android user story (NEW USER)
-- summary: create user request

-- user agent: android version >= 41
http.set_user_agent_string("Mozilla/5.0 (Android 4.4; Mobile; rv:41.0) Gecko/41.0 Firefox/41.0")

local base_url = "https://login.mofostaging.net"

function random_string(length)
  length = length or 1
    if length < 1 then return nil end
    local array = {}
    for i = 1, length do
      array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array) .. "A" .. "6"
end

local client_id = "client_id=wm_id_zIPGbkEDB5Cv9dCzo7nS"
local email = "&&email=new@user.com"
local uid = "&&username=" .. random_string(math.random(10, 20))
local password = "&&password=" .. random_string(math.random(10, 20))
local mail_list = "&&feedback=false"
local lang = "&&prefLang=en"

local post_data =   client_id ..
          uid ..
          password ..
          mail_list ..
          lang

-- request access token from id
http.request_batch({
    {
    "POST",
      base_url .. "/api/v2/user/create",
      data=post_data
    }
})

client.sleep(math.random(45,100))
