module ApplicationHelper
    def select_current_user
        User.find_by_id(current_user)
    end
end
