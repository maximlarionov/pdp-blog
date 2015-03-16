class AddDefaultTrueToPublishedInPosts < ActiveRecord::Migration
  def change
    change_column_default :posts, :published, true
    change_column_null :posts, :published, false
  end
end
