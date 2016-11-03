class CreateSponsoredPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsored_posts do |t|
      t.string :title
      t.text :body
      t.integer :price
      t.references :topic, foreign_key: true

      t.timestamps null: false
    end
  end
end
