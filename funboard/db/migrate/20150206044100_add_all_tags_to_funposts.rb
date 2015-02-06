class AddAllTagsToFunposts < ActiveRecord::Migration
  def change
    add_column :funposts, :all_tags, :string
  end
end
