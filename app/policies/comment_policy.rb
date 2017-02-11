class CommentPolicy < ApplicationPolicy

    def create?
      user.present? && user.admin?
    end
    
    def destroy?
      can_moderate?
    end
end