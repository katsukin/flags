class CreateBottles < ActiveRecord::Migration[5.1]
  def change
    create_table :bottles do |t|
      t.string :url
      t.string :pic_url
      t.string :pic_type
      t.string :cabinet
      t.string :user_id
      t.text :comment

      t.timestamps
    end
  end
end
