class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.column :user, :string
      t.column :rating, :integer
      t.column :content, :string

      t.timestamps
    end
  end
end
