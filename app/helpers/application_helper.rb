module ApplicationHelper
  def lnil(date)
    date.nil? ? 'не указано' : l(date)
  end

  def breadcrumb_tag(&block)
    render 'application/breadcrumb', block: capture(&block)
  end

  ROLE_FOR_METHODS = ['admin', 'operator']

  ROLE_FOR_METHODS.each do |rname|
    define_method "is_#{rname}?" do
      @current_role_user.try("is_#{rname}?")
    end
  end
end
