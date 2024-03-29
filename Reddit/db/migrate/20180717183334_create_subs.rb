class CreateSubs < ActiveRecord::Migration[5.1]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :moderator_id, null: false
    end
    add_index :subs, :title
    add_index :subs, :description
    add_index :subs, :moderator_id
  end
end
