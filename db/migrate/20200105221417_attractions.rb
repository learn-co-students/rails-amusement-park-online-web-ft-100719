class Attractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :tickets
      t.integer :min_height
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.string :ride_id 
      t.timestamps
    end
    
  end
end

# Attraction is valid with a name, min_height, nausea_rating, happiness_rating, and ticket number