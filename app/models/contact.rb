class Contact
  include ActiveModel::Model
  include ActiveModel::AttributeMethods

  define_attribute_methods :subject, :from, :body
  attr_accessor :subject, :from, :body

  validates :subject, :from, :body, presence: true
  validate :email_consistency

  private
    def email_consistency
      unless @from =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        errors.add(:from, "is not a valid email")
      end
    end
end
