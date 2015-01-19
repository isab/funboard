class CreateFunposts < ActiveRecord::Migration
  def change
    create_table :funposts do |t|
      t.string :title
      t.string :description
      t.string :url

      t.timestamps null: false
    end
  end
end
