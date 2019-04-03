class AddGuessedToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :guessed, :boolean, :default => false
  end
end
