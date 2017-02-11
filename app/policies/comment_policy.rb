class CommentPolicy < ApplicationPolicy

    def create?
      user.present? && user.admin?
    end
    
    def destroy?
      user.present? && (record.user == user || user.admin? || user.moderator?)
    end
end