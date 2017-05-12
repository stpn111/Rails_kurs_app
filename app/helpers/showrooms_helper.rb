module ShowroomsHelper
  # nested_start  
  def link_to_add_showroom(form, collection)
    # Создаём новый объект. Аналог build в ранних примерах
    new_object = Showroom.new
    # Нам нужна nested-форма. В момент создания ссылки её ещё нет. Создадим её
    # Все showrooms в форме имеют свой номер 
    # Мы его пока заменям на фразу new_ru
    fields = form.fields_for(:showrooms, new_object,
     :child_index => 'new_showroom') do |fr|
    render('collections/many_showrooms_form', fr: fr, i: 'новый')
    end
    # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
    link_to(?#, class: 'btn btn-info', 
    	id: 'add_showroom_link', data: {content: "#{fields}"}) do
     fa_icon("plus") + " " + t('app.collection.new')
    end
  end
  def link_to_remove_showroom(form)  
    # При удалении nested-конструкции. Она реально не удаляется
    # Соответствующий html-блок скрывается
    # При этом выставляется значение специального поля _destroy
    # По этому поля rails понимает, что связь надо удалить
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
        link_to(?#, class: 'remove_fields remove_showroom') do 
      fa_icon('times', title: 'Удалить зал') + ' Удалить'      
    end
  end
  # nested_finish
end
