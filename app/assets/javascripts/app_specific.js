//= require redactor-rails
//= require bootstrap-datepicker
//= require jquery-scrolltofixed
//= require admin_portada
//
$(document).ready(function(){
  $('.show-tooltip').tooltip()

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
          "<input type=hidden name='portada[home_sections_attributes]["+section_post_id+"][section_posts_attributes]["+li_pos+"][post_id]' value='"+id+"'>" +
          "<input type=hidden name='portada[home_sections_attributes]["+section_post_id+"][section_posts_attributes]["+li_pos+"][position]' value='"+position+"'>"

          );
        placeholder.removeClass('placeholder').addClass('ready');
        $.each($("[data-p_id='"+id+"']"), function(index, value) {
          $(value).draggable({ disabled: true });
        });

      }
    });

  $('.move-up').live('click', function(e){
      e.preventDefault();
      note = $(this).parents('.ready');
      prev = note.prev();
      next = note.next();
      if (prev.length > 0){
          if (note.data('create') == true ){
              if ($("input[name^='portada[home_sections_attributes]["+note.data('section')+"][section_posts_attributes]["+note.data('index')+"][position]']").length == 0){
                  input = "<input type='hidden' name=portada[home_sections_attributes]["+note.data('section')+"][section_posts_attributes]["+note.data('index')+"][position] value='"+note.data('position')+"' />";
                  note.parents('.well').next('.section-posts').append(input)
              }
              if ($("input[name^='portada[home_sections_attributes]["+prev.data('section')+"][section_posts_attributes]["+prev.data('index')+"][position]']").length == 0){
                  input = "<input type='hidden' name=portada[home_sections_attributes]["+prev.data('section')+"][section_posts_attributes]["+prev.data('index')+"][position] value='"+prev.data('position')+"' />";
                  note.parents('.well').next('.section-posts').append(input)
              }
          }
          prev_text = prev.find('span').text();
          note_text = note.find('span').text();
          prev.find('span').text(note_text);
          note.find('span').text(prev_text);
          input_note = $("input[name^='portada[home_sections_attributes]["+note.data('section')+"][section_posts_attributes]["+note.data('index')+"][position]']");
          input_prev = $("input[name^='portada[home_sections_attributes]["+prev.data('section')+"][section_posts_attributes]["+prev.data('index')+"][position]']");
          input_note_val =  input_note.val();
          input_prev_val =  input_prev.val();
          input_note.val(input_prev_val);
          input_prev.val(input_note_val);
      }
  })

  $('.move-down').live('click', function(e){
    e.preventDefault()
    note = $(this).parents('.ready')
    prev = note.prev()
    next = note.next('.ready')
    if (next.length > 0){
        if (note.data('create') == true ){

            if ($("input[name^='portada[home_sections_attributes]["+note.data('section')+"][section_posts_attributes]["+note.data('index')+"][position]']").length == 0){
                input = "<input type='hidden' name=portada[home_sections_attributes]["+note.data('section')+"][section_posts_attributes]["+note.data('index')+"][position] value='"+note.data('position')+"' />";
                note.parents('.well').next('.section-posts').append(input)
            }
            if ($("input[name^='portada[home_sections_attributes]["+next.data('section')+"][section_posts_attributes]["+next.data('index')+"][position]']").length == 0){
                input = "<input type='hidden' name=portada[home_sections_attributes]["+next.data('section')+"][section_posts_attributes]["+next.data('index')+"][position] value='"+next.data('position')+"' />";
                note.parents('.well').next('.section-posts').append(input)
            }
        }
        next_text = next.find('span').text()
        note_text = note.find('span').text()
        next.find('span').text(note_text)
        note.find('span').text(next_text)
        input_note = $("input[name^='portada[home_sections_attributes]["+note.data('section')+"][section_posts_attributes]["+note.data('index')+"][position]']")
        input_next = $("input[name^='portada[home_sections_attributes]["+next.data('section')+"][section_posts_attributes]["+next.data('index')+"][position]']")
        input_note_val =  input_note.val()
        input_next_val =  input_next.val()
        input_note.val(input_next_val)
        input_next.val(input_note_val)
  }
})
})
