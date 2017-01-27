module ApplicationHelper
  def alert_for(flash_type)
  { success: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-warning',
    notice: 'alert-info'
  }[flash_type.to_sym] || flash_type.to_s
  end

  def form_image_select(ping)
    return image_tag ping.image.url(:medium),
                   id: 'image-preview',
                   class: 'img-responsive' if ping.image.exists?
    image_tag 'placeholder.png', id: 'image-preview', class: 'img-responsive'
  end

  def profile_avatar_select(user)
    return image_tag user.avatar.url(:medium), id: 'image-preview',
                   class: 'img-responsive img-circle profile-image' if user.avatar.exists?
    image_tag 'placeholder.png', id: 'image-preview', class: 'img-responsive img-circle profile-image'
  end
end