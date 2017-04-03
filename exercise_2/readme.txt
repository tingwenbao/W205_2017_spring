W205 Excercise 2

Instance used: 
AMI Name: UCB MIDS W205 EX2-FULL
AMI ID: ami-d4dd4ec3

Packages needed:
1. Install psycopg by running : $ pip install psycopg2==2.6.2
2. Install Tweepy by running : $ pip install tweepy

Twitter Application:
You should create your own Twitter Application in order to run this excercise. Visit https://apps.twitter.com/ and click on "Create New App". Create your new application and you will be using your own keys and tokens to run this excercise. 

To run the process:
1. Start your instance and mount the volumn onto it. The instance used is listed above
2. Create a directory and git clone "excercise_2" folder into it
3. Start postgres in the instance. Hadoop is supposed to auto-start for this instance, if not, start hadoop as well
4. cd to spouts folder (cd <your directory>/exercise_2/extweetwordcount/src/spouts) and create TwitterCredentials.py with your own Twitter Credential. The code is below:

twitter_credentials = {
    "consumer_key"        :  "<enter your consumer key>",
    "consumer_secret"     :  "<enter your consumer secret key>",
    "access_token"        :  "<enter your access token>",
    "access_token_secret" :  "<enter your access token secret key>",
}
def auth_get(auth_key):
    if auth_key in twitter_credentials:
        return twitter_credentials[auth_key]
    return None

5.cd back to extweetwordcount folder, run the app with : sparse run. Run it for as long as you want and use Cntrl+C to stop
6. To see the result, run the finalresults.py in the same directory: python finalresults.py <the word you want to search>. If you don't include a specific word, it will return all
7. To see words within certain range, run the histogram.py in the same directory: python histogram.py number1,number2


