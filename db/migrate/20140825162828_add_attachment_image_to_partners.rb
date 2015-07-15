class AddAttachmentImageToPartners < ActiveRecord::Migration
  def self.up
    change_table :partners do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :partners, :image
  end
end
