class Ability
  include CanCan::Ability
  
  def initialize(current_user)
     current_user ||= User.new # Guest user
     if current_user.role_id == 1  
      can :manage, :all
    end  
  end
  
end