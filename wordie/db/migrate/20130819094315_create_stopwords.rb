class CreateStopwords < ActiveRecord::Migration
  def change
    create_table :stopwords do |t|
      t.string :stop_word

      t.timestamps
    end
  end
end
