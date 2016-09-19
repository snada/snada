class AddUploadColumnsToPic < ActiveRecord::Migration
  def up
    add_attachment :pics, :upload
  end

  def down
    remove_attachment :pics, :upload
  end
end
