$(document).on('ready', function(){
  $('#question_upvote').on('submit', function(event){
    console.log('hi')
    event.preventDefault();
    $form_data = $(event.target);
    $.ajax({
      url: $form_data.attr('action'),
      method: 'post',
      data: $form_data.serialize(),
      dataType: 'json'
    }).done(function(response){
      $('#question_vote_count').text(response.data)
    });
  });

  $('#question_downvote').on('submit', function(event){
    event.preventDefault();
    $form_data = $(event.target);
    $.ajax({
      url: $form_data.attr('action'),
      method: 'post',
      data: $form_data.serialize(),
      dataType: 'json'
    }).done(function(response){
      $('#question_vote_count').text(response.data)
    });
  });

  $('#answer_upvote').on('submit', function(event){
    event.preventDefault();
    $form_data =  $(event.target);
    $.ajax({
      url: $form_data.attr('action'),
      method: 'post',
      data: $form_data.serialize(),
      dataType: 'json'
    }).done(function(response){
      $('#answer_vote_count' + response.answer_id).text(response.data)
    })
  })

})
