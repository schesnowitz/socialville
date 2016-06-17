class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        can :update, Status do |status|
          status.user == user
      end
        can :destroy, Status do |status|
          status.user == user
      end
        can :read, :all
      end

  end
end
