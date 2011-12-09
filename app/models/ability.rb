class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :show, User, :id => user.id
      can :current, User
      if user.role? :god
        can :manage, :all
      elsif user.role? :admin
        can [:index,:show,:destroy], User
      elsif user.role? :miniadmin
        can [:index,:show], User
      end
    else
      can :create, User 
    end
  end
end
