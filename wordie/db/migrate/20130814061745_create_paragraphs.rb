class CreateParagraphs < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.text :para_text
      t.integer :uri_id

      t.timestamps
    end
  end
end
