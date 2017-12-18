class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :original_url, null: false
      t.string :shortened_url, null: false
      
      t.timestamps
    end
  end
end
