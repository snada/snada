class Post < ActiveRecord::Base
  include FriendlyId
  friendly_id :title, use: [:slugged]

  acts_as_taggable_on :categories
  acts_as_disqusable

  validates :title, presence: true
  validates :description, presence: true
  validates :body, presence: true
  validates :category_list, presence: true

  def self.default_scope
    order(created_at: :desc)
  end
end
