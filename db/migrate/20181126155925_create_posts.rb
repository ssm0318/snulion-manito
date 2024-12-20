class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string   :mission
      t.string   :title
      t.text     :content
      t.belongs_to   :user, foreign_key: true
      t.boolean  :show

      t.timestamps
    end
  end
end
