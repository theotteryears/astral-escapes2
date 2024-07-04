class AddPictureColumnToPlanets < ActiveRecord::Migration[7.1]
  def change
    add_column :planets, :planet_img, :string
  end
end
