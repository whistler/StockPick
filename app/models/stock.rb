require 'yahoofinance'

class Stock < ActiveRecord::Base
  has_many :quotes
  
  def get_quotes
    self.quotes.each do |quote|
      quote.destroy
    end
    YahooFinance::get_historical_quotes_days( self.symbol, 14 ) do |row|
      Quote.create(:stock_id=>self.id, :date => row[0], :open => row[1], :high => row[2],:low => row[3], :close => row[4] , :volume => row[5], :adjusted_close => row[6])
    end
  end
  
  def self.get_data
    Stock.all.each do |stock|
      stock.get_quotes
      stock.score = TrendSpottr.weight("$#{stock.symbol}")
      stock.save!
    end
  end
  
end
