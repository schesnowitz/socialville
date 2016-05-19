class AddStuff2ToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :facebook, :string
    add_column :users, :facebook_permission, :boolean, default: true
    
    add_column :users, :youtube, :string
    add_column :users, :youtube_permission, :boolean, default: true
    
    add_column :users, :twitter, :string
    add_column :users, :twitter_permission, :boolean, default: true
    

    add_column :users, :email_permission, :boolean, default: true
  end
end
