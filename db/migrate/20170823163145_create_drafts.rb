class CreateDrafts < ActiveRecord::Migration[5.1]
  def change
    create_table :drafts do |t|
      t.string :title
      t.text :body
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
