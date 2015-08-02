class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voteable, polymorphic: true, index: true
      t.references :user
      t.integer :value
      t.timestamps null: false
    end
  end
end
