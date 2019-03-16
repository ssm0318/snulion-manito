class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.belongs_to :manito,           null: false, foreign_key: { to_table: :users }
      t.belongs_to :manitee,           null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
