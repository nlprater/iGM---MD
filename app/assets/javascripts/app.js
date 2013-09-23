$(function() {
         $( "#sortable" ).sortable();
         $( "#sortable" ).disableSelection();
          });

$(document).ready(function() {
  $('.cd_middle').hide();
  $('.cd_right').hide();
  $('#draft_setup').submit(function(event){
    event.preventDefault();

    var draft_data = {
      name             : $('#name').val(),
      number_of_gms    : $('#number_of_gms').val(),
      number_of_rounds : $('#number_of_rounds').val(),
      access           : $('#access').val(),
      type             : $('#draft_type').val()
    }
    
    $.post('/draft/new', draft_data, function(response){
       $('#draft_setup').append(response)
    });

    $('.cd_middle').show();
    $('#team_selection_form').submit(function(event){
      event.preventDefault();

      // $('.cd_right').load('create_draft #sortable');

      var checked = $('.team_checkbox:checked').map(function() {
        return $(this).val();
        }).get();

      var team_data = {
      teams : checked
      }

      $.post('/gm_stint/new', team_data,function(response){
      	$('.cd_right').load(response);
      	$('.cd_right').show();
      });
    });

      
      $("#sortable").sortable({
        stop: function(event, ui) {
        alert("New position: " + ui.item.index());
        }
       });
      $("#sortable").disableSelection();


  });
});