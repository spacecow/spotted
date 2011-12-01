class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :manage, User
    else
      can [:create,:index], User 
    end
  end
end
