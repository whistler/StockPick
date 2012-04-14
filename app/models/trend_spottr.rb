require 'net/http'

class TrendSpottr < ActiveRecord::Base
  @@USERNAME = "hackto"
  @@PASSWORD = "HT2012"
  @@URL = "http://trendspottr.com/api/v1.1/search.php"
  
  def self.query( q )
    trendspottr_uri = URI(@@URL)
    params = { :q => q, :expand=> false}
    trendspottr_uri.query = URI.encode_www_form(params)
    
    request = Net::HTTP::Get.new(trendspottr_uri.request_uri)
    request.basic_auth @@USERNAME, @@PASSWORD
    
    response = Net::HTTP.start(trendspottr_uri.host, trendspottr_uri.port) {|http|
      http.request(request)
    }
    
    data = JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
    data
  end
  
  def self.weight( q )
    response = query( q )
    weight = 0.0 
    response["results"]["links"].each do |link|
      weight = weight + link["weight"].to_f
    end
    weight
  end
  
end
