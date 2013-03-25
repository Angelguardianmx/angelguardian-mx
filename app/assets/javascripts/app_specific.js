//= require redactor-rails
//= require bootstrap-datepicker
//= require jquery-ui
//= require autocomplete-rails
//
//
$(document).ready(function(){
  $( ".draggable" ).draggable({
    connectToSortable: ".droppable",
    helper: "clone",
    revert: "invalid"
  });
  $( ".droppable" ).droppable({
      drop: function( event, ui ) {
        id = ui.draggable.data('p_id')
        section_id = ui.draggable.data('section_id')
        placeholder = $(this).find('.placeholder').get(0);
        placeholder = $(placeholder)
        placeholder.find('span').text(ui.draggable.find('.title').text());
        section_post_id = placeholder.data('section');
        li_pos = placeholder.data('index');
        position = placeholder.data('position');
        $(this).next('.section-posts').append(
          "<input type=hidden name='portada[home_sections_attributes]["+section_post_id+"][section_posts_attributes]["+li_pos+"][post_id]' value='"+id+"'>"
          );
        placeholder.removeClass('placeholder').addClass('ready');
        $.each($("[data-p_id='"+id+"']"), function(index, value) {
          $(value).draggable({ disabled: true });
        });

      }
    });
})
