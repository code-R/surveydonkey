class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :index, Survey

    if user.admin?
      can :manage, :all
    elsif user.persisted?
      can :read, Survey
    end
  end
end
