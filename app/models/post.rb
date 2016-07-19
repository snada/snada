class Post < ActiveRecord::Base
  include FriendlyId
  friendly_id :title, use: [:slugged]

  validates :title, presence: true
  validates :description, presence: true
  validates :body, presence: true

  def self.default_scope
    order(created_at: :desc)
  end
end
