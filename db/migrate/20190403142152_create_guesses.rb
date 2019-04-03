class CreateGuesses < ActiveRecord::Migration[5.1]
  def change
    create_table :guesses do |t|
      t.belongs_to   :user, foreign_key: true
      t.string       :content

      t.timestamps
    end
  end
end
