class AddTryToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :try, :integer, :default => 2
  end
end
