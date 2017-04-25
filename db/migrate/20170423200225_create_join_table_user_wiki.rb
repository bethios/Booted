class CreateJoinTableUserWiki < ActiveRecord::Migration
  def change
    create_join_table :users, :wikis do |t|
       t.index [:user_id, :wiki_id]
       t.index [:wiki_id, :user_id]
    end

    create_table :collaborators do |t|
      t.integer :user_id
      t.integer :wiki_id
      t.timestamps
    end

    add_index :collaborators, :id, unique:  true
    add_index :collaborators, :user_id
    add_index :collaborators, :wiki_id
  end
end
