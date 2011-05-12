module UsersHelper
  def profile_section_if_present(attribute, section_title)
    if attribute.present?
      content_tag(:h2, section_title) + 
      content_tag(:h1, attribute)
    end
  end
end
