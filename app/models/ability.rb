# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here.
    user ||= User.new # Guest user
    
    # Any user can read recipes marked as public
    can :read, Recipe, public: true
    # User can manage on recipes where they are the owner
    can :manage, Recipe, user_id: user.id
    
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
