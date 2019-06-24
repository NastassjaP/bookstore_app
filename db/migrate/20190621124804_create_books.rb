class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.date :date_published
      t.references :user, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
