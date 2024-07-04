class AddDistanceToPlanets < ActiveRecord::Migration[7.1]
  def change
    add_column :planets, :distance, :string
  end
end
