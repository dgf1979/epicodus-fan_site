class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :user, :string
      t.column :title, :string
      t.column :description, :string
      t.column :rating, :integer

      t.timestamps
    end
  end
end
