class AddAttachmentPictureToBlogs < ActiveRecord::Migration
  def self.up
    change_table :blogs do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :blogs, :picture
  end
end
