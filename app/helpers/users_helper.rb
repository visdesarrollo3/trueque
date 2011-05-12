# encoding: UTF-8

module UsersHelper
  def profile_section_if_present(attribute, section_title)
    if attribute.present?
      content_tag(:h2, section_title) + 
      content_tag(:h1, attribute)
    end
  end
  
  def avatar_link(user)
    link_to bordered_image(
      user.avatar.url(:small),
      :title => "Ver perfíl de #{user.name}",
      :alt => "Ver perfíl de #{user.name}"
    ),
    user,
    :title => "Ver perfil de #{user.name}",
    :alt => "Ver perfil de #{user.name}"
  end
end
