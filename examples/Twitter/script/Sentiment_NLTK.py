# @BEGIN Sentiment_NLTK @desc Exercise YW for Analysing Tweets with NLTK
# @in Static_Tweets @uri file:static_tweet.csv
# @out Sentiment_Result @desc jpg file which contains sentiment score in pie chart @uri file:Scores_NLTK.jpg

import json
import simplejson as json
from collections import Counter
import re
import matplotlib.pyplot as plt
import requests

# @BEGIN AccessTweets @desc To read the tweets from tweet.csv file
# @in tweets_data_path @as Static_Tweets @desc CSV file which contains static tweets @uri file:static_tweet.csv
# @out tweets_file @as TweetRead
tweets_data_path = 'static_tweet.csv'
tweets_data = []
tweets_file = open(tweets_data_path, "r")
# @END AccessTweets

negative = 0
neutral = 0
positive = 0

# @BEGIN CountSentiments @desc Calculate sentiments with NLTK
# @in tweets_file @as TweetRead
# @out positive @as PositiveCount
# @out negative @as NegativeCount
# @out neutral @as NeutralCount
for line in tweets_file:

    r = requests.post("http://text-processing.com/api/sentiment/",data={'text':line})
    jsn_dict = r.json()
    sentiment = jsn_dict["label"]

    if sentiment == 'neg':
        negative = negative+1

    elif sentiment == 'neutral':
        neutral = neutral+1
   
    else:
        positive = positive+1
# @END CountSentiments
   
# @BEGIN Measures  @desc SetPieChartMeasures
# @in positive @as PositiveCount
# @in negative @as NegativeCount
# @in neutral @as NeutralCount
# @out explode @as Explode
# @out labels @as Labels
# @out sizes @as Sizes
# @out colors @as Colors
explode = (0, 0.1, 0) 
labels = 'Positive', 'Negative', 'Neutral'
sizes = [positive, negative, neutral]
colors = ['gold', 'yellowgreen', 'lightcoral']
# @END SetPieChartMeasures

# @BEGIN DrawPieChart @desc Pie chart saved in Scores_NLTK.jpeg
# @param explode @as Explode
# @param labels @as Labels
# @in sizes @as Sizes
# @param colors @as Colors
# @out plt @as Sentiment_Result @uri file:Scores_NLTK.jpg
plt.pie(sizes, explode=explode, colors=colors,
        autopct='%1.1f%%', startangle=120)
plt.legend(labels, loc=(-0.05, 0.05), shadow=True)
plt.axis('equal')
plt.savefig('Scores_NLTK.jpg')
# @END DrawPieChart

# @END Sentiment_NLTK
