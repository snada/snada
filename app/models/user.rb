class User < ActiveRecord::Base
  enum role: [ :normal, :admin ]

  acts_as_authentic do |c|
    c.validate_email_field = false
  end
end
