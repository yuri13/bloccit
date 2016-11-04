class CreateSponsoredPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsoredposts do |t|
      t.string :title
      t.text :body
      t.integer :price

      t.timestamps null: false
    end
  end
end
