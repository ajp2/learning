class CreateTagTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_topics do |t|
      t.string :topic_name, null: false

      t.timestamps
    end
    add_index :tag_topics, :topic_name, unique: true
  end
end
