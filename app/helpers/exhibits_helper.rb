module ExhibitsHelper
  # nested_start  
  def link_to_add_collection(form, exhibit)
    # Создаём новый объект. Аналог build в ранних примерах
    new_object = Collection.new()
    # Нам нужна nested-форма. В момент создания ссылки её ещё нет. Создадим её
    # Все role_users в форме имеют свой номер 
    # Мы его пока заменям на фразу new_ru
    fields = form.fields_for(:collections, new_object, 
      :child_index => 'new_collection') do |fr|
      render('exhibits/one_exhibit_form', fr: fr, i: 'Новая')
    end
    # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
    link_to(?#, class: 'btn btn-info', 
        id: 'add_collection_link', data: {content: "#{fields}"}) do 
      fa_icon("plus") + " Новая коллекция" 
    end
  end

  def link_to_remove_collection(form)  
    # При удалении nested-конструкции. Она реально не удаляется
    # Соответствующий html-блок скрывается
    # При этом выставляется значение специального поля _destroy
    # По этому поля rails понимает, что связь надо удалить
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
        link_to(?#, class: 'remove_fields remove_collection') do 
      fa_icon('times', title: 'Удалить коллекцию') + ' Удалить'      
    end
  end
  # nested_finish
end
