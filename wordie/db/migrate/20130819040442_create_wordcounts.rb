class CreateWordcounts < ActiveRecord::Migration
  def change
    create_table :wordcounts do |t|
      t.string :keyword
      t.string :keyword_stem
      t.string :pos_type
      t.integer :count
      t.integer :paragraph_id

      t.timestamps
    end
  end
end
