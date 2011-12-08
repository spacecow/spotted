class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can [:index], User
      can [:destroy,:current], User, :id => user.id
    else
      can [:create,:destroy], User 
    end
  end
end
