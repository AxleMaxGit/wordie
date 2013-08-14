class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :search_term

      t.timestamps
    end
  end
end
