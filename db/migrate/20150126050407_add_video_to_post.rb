class AddVideoToSkateSession < ActiveRecord::Migration
  def change
    add_column :skate_sessions, :video, :string
  end
end
