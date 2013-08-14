class CreateUris < ActiveRecord::Migration
  def change
    create_table :uris do |t|
      t.string :uri
      t.integer :word_id

      t.timestamps
    end
  end
end
