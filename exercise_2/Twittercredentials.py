import tweepy

consumer_key = "bOUj1kWy2lvju3XPkGngfzFNs";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "LfogdLhgG9MmnGSy7uXliu04z4PZVeVH7Y7hqRnw4xZQsiuAeG";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "843227817764569089-qJ0X6L3dH0nEzbK37N1tMAdiFS67Orl";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "zSxpGinDIgvYQAtoBr3MSJD8TWuOvAUSPtEUCehGEIuUF";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



