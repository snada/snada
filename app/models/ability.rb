class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, Post
      can :create, UserSession
      cannot :manage, Pic
    end
  end
end
