-- webmaker-android user story (LOGIN-ONLY)
-- summary: request access token

-- user agent: android version >= 41
http.set_user_agent_string("Mozilla/5.0 (Android 4.4; Mobile; rv:41.0) Gecko/41.0 Firefox/41.0")

local base_url = "https://id-webmaker-org-staging.herokuapp.com"

local client_id = "client_id=wm_id_zIPGbkEDB5Cv9dCzo7nS"
local grant_type = "&&grant_type=password"
local uid = "&&uid=agdubs"
local password = "&&password=thisisnotarealpassword"
local scopes = "&&scopes=projects"

local post_data =   client_id ..
                    grant_type ..
                    uid ..
                    password ..
                    scopes

-- request access token from id
http.request_batch({
    {
        "POST",
        base_url .. "/login/oauth/access_token",
        data=post_data
    }
})

client.sleep(math.random(45,100))

