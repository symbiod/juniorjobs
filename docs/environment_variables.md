## Using environment variables

We follow [12 factor app](https://12factor.net/) principles for projects.
In order to use ENV variables for app configuration you can use one of the following approaches:

* [direnv app](https://direnv.net/) for autoloading project ENV variables
* [dotenv gem](https://github.com/bkeepers/dotenv) for autoloading ENV variables on dev machine
* Explicitly setting ENV variables at your shell rc file(not recommended because of possible collisions)

Choose whatever works for you the best, but keep in mind, that all `.env` or `.envrc` files should be included at `.gitignore`.

## List of required ENV variables

**General ENV variables**

All these variables should be available at app startup

* APP_SECRET
* REDIS_HOST
* MAILCHIMP_LIST_ID
* MAILCHIMP_ACCESS_KEY_ID
* GITHUB_CLIENT_ID
* GITHUB_SECRET
* GITHUB_CALLBACK_DOMAIN

**FOR VKONTAKTE:**
1. [Create app for website](https://vk.com/apps?act=manage "Create app")
2. Get permanent TOKEN for group, you can use next reqest:
https://oauth.vk.com/authorize?client_id=6337548&display=page&redirect_uri=http://api.vk.com/blank.html&scope=wall,offline&response_type=token&v=5.71&state=123456
VK_TOKEN_RU =  (token)
VK_GROUP_ID_RU = -(group_id)

**FOR FACEBOOK:**

1. [Create app for website](https://developers.facebook.com/apps/ "Create app")

2. [Visit and get page access token:](https://developers.facebook.com/tools/explorer/ "Graph API Explorer")
https://oauth.vk.com/authorize?client_id=6337548&display=page&redirect_uri=http://api.vk.com/blank.html&scope=wall,offline&response_type=token&v=5.71&state=123456
FB_TOKEN_RU = (token)
FB_GROUP_ID_RU = (group id)

**FOR TELEGRAM:**
 [Create new bot](https://telegram.me/botfather "Bot father")

TELEGRAM_TOKEN_RU =  (token)
TELEGRAM_GROUP_ID_RU= -(chat_id)

**FOR TWITTER:**
[Create app](https://apps.twitter.com/ "New app")
Get all keys from apps details
CONSUMER_KEY = (consumer_key)
CONSUMER_SECRET = (consumer_secret)
ACCESS_TOKEN = (access_token)
 ACCESS_TOKEN_SECRET= (access_token_secret)

## Adding new ENV variable

* Use it in the code
* Add it to this document
* Add it to `deploy/secrets/application-secrets.yaml.tmpl`
* Add it to `deploy/deployments/juniorjobs.yaml`
* Ask to add it to CI/CD

