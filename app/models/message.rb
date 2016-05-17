class Message < ApplicationRecord
  belongs_to :user
  belongs_to :status 
  after_create_commit { MessageBroadcastJob.perform_later self }
end
