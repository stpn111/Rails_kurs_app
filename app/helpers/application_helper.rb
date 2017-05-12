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
  
  #Любая роль, кроме оператора и администратора - только для внешних сотрудников. 
  #Например, при проверке гос. инспекцией, можно выдать доступ проверяющему, чтобы он мог смотреть нужную информацию.
  #Т.е.,  добавляется роль "Inspector", если ему не нужно показывать какие-то определенные поля
  #в обход текущих ограничений, то можно будет прописать просто is_inspector? и будут наложены ограничения как
  #и от админа/оператора, так и отмеченные для инспектора
  def check_auth (roles)
    bool = false
    roles.each{|x| bool ||= @current_role_user.try("is_#{x}?")}
    unless bool
      redirect_to(ip_path(
          :bad_action_name => action_name,
          :bad_controller_name => controller_name,
          :bad_user_role => @current_role_user.try(:id)))
     end
  end
  
  ROLE_FOR_METHODS.each do |rname|
    define_method "is_#{rname}?" do
      @current_role_user.try("is_#{rname}?")
  end
  end
  
  
end
