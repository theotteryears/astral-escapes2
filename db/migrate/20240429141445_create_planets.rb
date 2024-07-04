class CreatePlanets < ActiveRecord::Migration[7.1]
  def change
    create_table :planets do |t|
      t.string :name
      t.text :details
      t.string :location
      t.integer :price_per_night
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
