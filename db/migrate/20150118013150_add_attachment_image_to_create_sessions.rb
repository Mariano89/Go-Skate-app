class AddAttachmentImageToCreateSessions < ActiveRecord::Migration
  def self.up
    change_table :create_sessions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :create_sessions, :image
  end
end
