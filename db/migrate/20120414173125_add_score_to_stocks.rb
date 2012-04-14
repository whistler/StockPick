class AddScoreToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :score, :float

  end
end
