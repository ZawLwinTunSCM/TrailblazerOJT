class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{id} #{name}"
  end

  def login_user
    h.content_tag :span, "Current User", class: "badge badge-primary" if user.id == 1
  end
end
