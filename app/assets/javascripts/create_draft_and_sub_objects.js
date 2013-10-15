$(document).ready(function() {
  initializePage();
  enableSortable();
  createDraft();
  createGMStints();
  createDraftOrder();
});

//=================================================================

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
  
  $.post('/draft', draft_data, function(response){
      console.log(response);
     $('#draft_setup').append(response)
  });

  if($('#draft_type').val() === 'Draft as a Team'){
    $('.cd_middle').show();
  }else{
    $('.cd_right').show();
  }

  });
}

function createGMStints() {
  $('#team_selection_form').submit(function(event){
      event.preventDefault();

      var checked = $('.team_checkbox:checked').map(function() {
        return $(this).val();
        }).get();

      var team_data = {teams : checked}

      $.post('/gm_stint', team_data,function(response){
        $('.cd_right').show();
      });
    });
}


function createDraftOrder() {
  $('#draft_order_selection_button').click(function(event){
    event.preventDefault();

    var ordered_team_array = []
    $('#sortable > li').each(function(index) {
      ordered_team_array.push($( this ).text() );
    });

    var draft_order = {draft_order : ordered_team_array}

    $.post('/draft/1/round/1/draft_position', draft_order, function(response){
      console.log(response);
    });
  });
}
