$(document).on('ready', function(){
  $('#upvote').on('submit', function(event){
    console.log('hi')
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
