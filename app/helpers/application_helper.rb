module ApplicationHelper
  def lnil(date)
    date.nil? ? 'не указано' : l(date)
  end

  def breadcrumb_tag(&block)
    render 'application/breadcrumb', block: capture(&block)
  end
  ROLE_FOR_METHODS = []
  for i in 0...Role.all.size
	ROLE_FOR_METHODS << Role.all[i].name
  end
# Любая роль, кроме оператора и администратора - только для внешних сотрудников. 
#Например, при проверке гос. инспекцией, можно выдать доступ проверяющему, чтобы он мог смотреть нужную информацию.

  ROLE_FOR_METHODS.each do |rname|
    define_method "is_#{rname}?" do
      @current_role_user.try("is_#{rname}?")
    end
  end
end
