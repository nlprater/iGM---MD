function initializePage() {
  $('.cd_middle').hide();
  $('.cd_right').hide();
}

function enableSortable() {
  $( "#sortable" ).sortable();
  $( "#sortable" ).disableSelection();
}

function createDraft() { 
  $('#draft_setup').click(function(event){
    event.preventDefault();

  var draft_data = {
    name             : $('#name').val(),
    number_of_gms    : $('#number_of_gms').val(),
    number_of_rounds : $('#number_of_rounds').val(),
    access           : $('#access').val(),
    draft_type       : $('#draft_type').val()
  }

  console.log(draft_data);
  
  $.post('/draft', draft_data, function(response){
      console.log(response);
     $('#draft_setup').append(response)
  });

  $('.cd_middle').show();
  
  });
}

function createGMStints() {
  $('#team_selection_form').submit(function(event){
      event.preventDefault();

      var checked = $('.team_checkbox:checked').map(function() {
        return $(this).val();
        }).get();

      var team_data = {
      teams : checked
      }

      console.log(team_data)

      $.post('/gm_stint', team_data,function(response){
        console.log(response);
        $('.cd_right').show();
      });
    });
}



$(document).ready(function() {
  initializePage();
  enableSortable();
  createDraft();
  createGMStints();
});

// $("#sortable").sortable({
//         stop: function(event, ui) {
//         alert("New position: " + ui.item.index());
//         }
//        });
//       $("#sortable").disableSelection();
