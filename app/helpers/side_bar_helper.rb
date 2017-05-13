module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Начальная страница',
      :icon => 'list',
      :controller => :welcome, 
      :action => :index
    }
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'},
    ]}
    result << {
      :name => 'Данные по музею',
      :icon => 'picture-o',
      :children => [
      {:name => 'Коллекции',
       :controller => :collections, :action => :index,
       :icon => 'picture-o',
       :class => 'long'},
      {:name => 'Экспонаты',
       :controller => :exhibits, :action => :index,
       :icon => 'trophy'},
      {:name => 'Выставочные залы',
       :controller => :showrooms, :action => :index,
       :icon => 'university'},
    ]} 
    result
  end
  
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles', 'exhibits', 'collections', 'showrooms'
      ctr.to_s == controller_name.to_s  
    else
      false
    end
  end
end
