hide_fields = ->
  if ($("#edit_exhibits").length > 0)
    $(".hidden-edit").remove()
  else
    $(".hidden-new").remove()

insert_form = ->
  if ($('#collection_select').val() == '' || $("#edit_exhibits").length > 0)
    $("#collection-fields").html($("#collection-fieldset").attr("data-content"))
    hide_fields()
    datepicker_activation()
#datepicker деактивируется каждый раз при закрытии/открытии формы    
    window.add_new_showroom()
  else
    $("#collection-fields").html("")
save_fix = ->
  if($('#collection_select').val() == '')
    $('#collection_select').remove()
exhibit_ready = ->
  insert_form()
  $('#collection_select').on 'change', insert_form
  $('#exhibit_save').on 'click', save_fix

#$(document).on 'page:load', exhibit_ready
$(document).on 'turbolinks:load', exhibit_ready
#$(document).ready exhibit_ready
