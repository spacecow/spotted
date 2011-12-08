class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :current, User, :id => user.id
      if user.role? :admin
        can [:index,:current], User
      end
    else
      can :create, User 
    end
  end
end
