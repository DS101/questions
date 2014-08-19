class IntrestingQuestion
  attr_accessible :questions, :name

  def fetch_username
    HTTParty.get("http://api.wunderground.com/api/YOUR_API_KEY/hourly/q/20001.xml")
  end


end