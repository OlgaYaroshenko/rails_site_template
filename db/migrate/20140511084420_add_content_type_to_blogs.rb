class AddContentTypeToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :content_type, :string
  end
end
