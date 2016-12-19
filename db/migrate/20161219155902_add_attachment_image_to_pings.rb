class AddAttachmentImageToPings < ActiveRecord::Migration
  def self.up
    change_table :pings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :pings, :image
  end
end
