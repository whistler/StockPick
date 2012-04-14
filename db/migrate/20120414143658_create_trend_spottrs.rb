class CreateTrendSpottrs < ActiveRecord::Migration
  def change
    create_table :trend_spottrs do |t|

      t.timestamps
    end
  end
end
