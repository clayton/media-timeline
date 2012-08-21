sites = [
  {:name => "The Wall Street Journal", :url => "http://online.wsj.com/home-page"},
  {:name => "USA Today", :url => "http://www.usatoday.com/"},
  {:name => "The New York Times", :url => "https://www.nytimes.com/"},
  {:name => "Los Angeles Times", :url => "http://www.latimes.com/"},
  {:name => "San Jose Mercury News", :url => "http://www.mercurynews.com/"},
  {:name => "The Washington Post", :url => "http://www.washingtonpost.com/"},
  {:name => "Daily News", :url => "http://www.nydailynews.com/"},
  {:name => "New York Post", :url => "http://www.nypost.com/"},
  {:name => "Chicago Tribune", :url => "http://www.chicagotribune.com/"},
  {:name => "Chicago Sun-Times", :url => "http://www.suntimes.com/"},
  {:name => "The American Spectator", :url => "http://spectator.org/"},
  {:name => "The Atlantic", :url => "http://www.theatlantic.com/"},
  {:name => "Commentary", :url => "http://www.commentarymagazine.com/"},
  {:name => "The Economist", :url => "http://www.economist.com/"},
  {:name => "Foreign Affairs", :url => "http://www.foreignaffairs.com/"},
  {:name => "Mother Jones", :url => "http://www.motherjones.com/"},
  {:name => "The Nation", :url => "http://www.thenation.com/"},
  {:name => "National Review", :url => "http://www.nationalreview.com/"},
  {:name => "The New Yorker", :url => "http://www.newyorker.com/"},
  {:name => "The New Republic", :url => "http://www.tnr.com/"},
  {:name => "Newsweek", :url => "http://www.thedailybeast.com/newsweek.html"},
  {:name => "Reason", :url => "http://reason.com/"},
  {:name => "Time", :url => "http://www.time.com/time/"},
  {:name => "Townhall Magazine", :url => "http://townhall.com/"},
  {:name => "Daily Kos", :url => "http://www.dailykos.com/"},
  {:name => "Talking Points Memo", :url => "http://talkingpointsmemo.com/"},
  {:name => "The Politico", :url => "http://www.politico.com/"},
  {:name => "Wonkette", :url => "http://wonkette.com/"},
  {:name => "Think Progress", :url => "http://thinkprogress.org/?mobile=nc"},
  {:name => "HotAir", :url => "http://hotair.com/"},
  {:name => "RedState", :url => "http://redstate.com/"},
  {:name => "Real Clear Politics", :url => "http://www.realclearpolitics.com/welcomead/?ref=http://realclearpolitics.com/"},
  {:name => "Drudge Report", :url => "http://www.drudgereport.com/"},
  {:name => "Daily Caller", :url => "http://www.dailycaller.com/"},
  {:name => "Big Hollywood/Brietbart", :url => "http://www.breitbart.com/breitbart-tv/"},
  {:name => "Instapundit", :url => "http://pjmedia.com/instapundit/"},
  {:name => "NewsBusters", :url => "http://newsbusters.org/"},
  {:name => "AceOfSpades HQ", :url => "http://ace.mu.nu/"},
  {:name => "NBC News", :url => "http://www.nbcnews.com"},
  {:name => "ABC News", :url => "http://abcnews.go.com"},
  {:name => "CBS News", :url => "http://www.cbsnews.com"},
  {:name => "Fox News", :url => "http://www.foxnews.com"},
  {:name => "CNN", :url => "http://www.cnn.com"},
  {:name => "Google News", :url => "http://news.google.com"}
]

Site.delete_all
Capture.delete_all
Site.create(sites)