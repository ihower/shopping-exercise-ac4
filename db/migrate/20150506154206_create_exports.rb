class CreateExports < ActiveRecord::Migration
  def change
    create_table :exports do |t|
      t.integer :user_id
      t.string :token, :null => false
      t.timestamps null: false
    end

    add_index :exports, :token, :unique => true
    add_attachment :exports, :attachment

  end
end
