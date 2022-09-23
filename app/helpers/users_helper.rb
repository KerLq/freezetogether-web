# frozen_string_literal: true

module UsersHelper
  def user_avatar(user, size = 400)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      'https://randomuser.me/api/portraits/women/49.jpg'
    end
  end
end
