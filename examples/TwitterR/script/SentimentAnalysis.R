# @BEGIN Sentiment_DatumBox @desc Exercise YW for Analysing Tweets with DatumBox API
# @in Static_Tweets @uri file:static_tweet.csv
# @out Sentiment_Result @desc jpg file which contains sentiment score in pie chart @uri file:Scores_Datumbox.jpg

# @BEGIN AccessTweets @desc To read the tweets from tweet.csv file
# @in tweets_data_path @as Static_Tweets @desc CSV file which contains static tweets @uri file:static_tweet.csv
# @out tweets_file @as TweetRead
tweets_data_path = 'C:\\Users\\B4062419\\Desktop\\Sentiments\\static_tweet.csv'
tweets_file = read.csv(tweets_data_path)
# @END AccessTweets

negative = 0
neutral = 0
positive = 0

db_key='ad3a9235644e84b0d2f9920f489dacd9'

# @BEGIN CountSentiments @desc Calculate sentiments with DatumBox
# @in tweets_file @as TweetRead
# @out positive @as PositiveCount
# @out negative @as NegativeCount
# @out neutral @as NeutralCount
for(i in 1:nrow(tweets_file))
{
  row <- tweets_file[i,]
  #myData <- read.csv("C:\\Users\\B4062419\\Desktop\\Sentiments\\static_tweet.csv", i)
  print(paste("Printing Row ",i))
  print(row)
  data <- getURL(paste("http://api.datumbox.com/1.0/TwitterSentimentAnalysis.json?api_key=", db_key, "&text=",row, sep=""))
  
  js <- fromJSON(data)
  
  # get mood probability
  sentiment = js$output$result
  print(sentiment)
  
  #sent = sentiment(row)
  x = sentiment
  if (grepl(sentiment,'neutral')) {
    neutral = neutral+1
  } else if (grepl(sentiment,'positive')) {
    positive = positive+1
  } else{
    negative = negative+1
  }
  print(sent)
}
# @END CountSentiments

print(neutral)
print(positive)
print(negative)


# @BEGIN Measures  @desc SetPieChartMeasures
# @IN positive @AS PositiveCount
# @IN negative @AS NegativeCount
# @IN neutral @AS NeutralCount
# @OUT exp @AS Explode
# @OUT labels @AS Labels
# @OUT sizes @AS Sizes
# @OUT colors @AS Colors
exp = 0.1
labels =c('Positive','Negative','Neutral')
sizes = c(positive, negative, neutral)
colors = c('gold', 'yellowgreen', 'lightcoral')
# @END Measures 

# @BEGIN DrawPieChart @desc Pie chart saved in Scores_DatumboxAPI.jpg
# @param explode @as Explode
# @param labels @as Labels
# @in sizes @as Sizes
# @param colors @as Colors
# @out pie @as Sentiment_Result @uri file:Scores_Datumbox.jpg
jpeg(filename="C:\\Users\\B4062419\\Desktop\\Sentiments\\Scores_Datumbox.jpg",width=480,height=480)
pie(c(22,7,70),labels=c('Positive','Negative','Neutral'),explode=exp,col=colors,main="Pie Chart of Sentiment Type",init.angle = 120)
dev.off()
# @END DrawPieChart

# @END Sentiment_DatumBox
