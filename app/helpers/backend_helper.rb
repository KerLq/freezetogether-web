module BackendHelper
    def is_admin?
        current_user.role.admin? ? true : redirect_to root_path
    end
end
