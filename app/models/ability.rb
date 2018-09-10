class Ability
  include CanCan::Ability
  
  def initialize user
     user ||= User.new # nếu chưa login
     if user.is_admin?
         can :manage, :all # cấp tất cả quyền cho admin
     else
         can [:index, :show], [Product, Cartegory] # cấp quyền cho user không phải là admin
         can :read, :store
     end
  end
end
