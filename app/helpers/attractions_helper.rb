module AttractionsHelper
    def attraction_link_text(attraction)
        if admin?
            "Show #{attraction.name}"
        else
            "Go on #{attraction.name}"
        end
    end

    def td
        content_tag :td do
            yield
        end
    end
end
