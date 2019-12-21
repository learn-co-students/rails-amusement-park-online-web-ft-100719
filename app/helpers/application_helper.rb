module ApplicationHelper
     def div_form_group
        content_tag :div, class: "form-group" do
            yield
        end
    end

    def form_control_class
        "form-control"
    end

    def nav_bar_links
        capture do
            if is_logged_in?
                concat link_to current_user.name, current_user, class:"navbar-brand"
                concat " "
                concat link_to 'Log Out', logout_url, class:"navbar-brand", data: { method: :delete }
            else
                concat link_to 'Sign Up', new_user_url, class:"navbar-brand"
                concat " "
                concat link_to 'Log in', signin_url, class:"navbar-brand"
            end
        end
    end
end
