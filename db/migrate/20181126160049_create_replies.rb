class CreateReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.belongs_to    :comment, foreign_key: true
      t.text          :content

      t.timestamps
    end
  end
end
