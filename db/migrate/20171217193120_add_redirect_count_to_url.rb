class AddRedirectCountToUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :redirect_count, :integer, default: 0, null: false
  end
end
