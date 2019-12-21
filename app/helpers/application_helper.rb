module ApplicationHelper
     def div_form_group
        content_tag :div, class: "form-group" do
            yield
        end
    end

    def form_control_class
        "form-control"
    end
end
