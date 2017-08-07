class CreateMemos < ActiveRecord::Migration[5.0]
  def change
    create_table :memos do |t|
      t.text :text
      t.timestamps null: false
    end
  end
end
