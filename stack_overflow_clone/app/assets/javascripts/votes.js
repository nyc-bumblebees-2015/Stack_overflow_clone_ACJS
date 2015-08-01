$(document).on('ready', function(){
  $('#upvote_form').on('submit',function(event){
    event.preventDefault();
    $form_data = $(event.target);
    $.ajax({
      url: $form_data.attr('action'),
      method: 'post',
      data: $form_data.serialize(),
      dataType: 'json'
    }).done(function(response){
      console.log(response)
    });
  });

})
