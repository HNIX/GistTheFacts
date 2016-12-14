module UsersHelper
  def avatar_for(user, options = { size: 80 })
    size = options[:size]
    if user.avatar?
      image_tag user.avatar.url(:thumb), width: size, class: "avatar_image"
    else
      image_tag "default-avatar.jpg", width: size, class: "avatar_image"
    end
  end
end
