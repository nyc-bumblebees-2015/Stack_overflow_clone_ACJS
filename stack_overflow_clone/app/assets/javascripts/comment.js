$(document).ready(function(){
  $(".question-comment-form").hide()
  $(".answer-comment-form").hide()

  $(".question-comment-link").on('click', function(event){
    event.preventDefault();
    $(".question-comment-form").show()
  })

  $(".question-comment-form").on('submit', function(event){
    event.preventDefault();
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize()
    }).done(function(response){
        $(".question-comment-container").prepend(response.comment)
        $(".new_comment").trigger('reset')
        $(".question-comment-form").hide()
    }).fail(function(error){
        console.log(error, "fail panda")
    })
  })

  $(".answer-comment-link").on('click', function(event){
    event.preventDefault();
  })

  $(".answer-comment-form").on('submit', function(event){
    event.preventDefault();
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize()
    }).done(function(response){
      $(".answer-comment-container" + response.answer_id).prepend(response.comment)
      $(".new_comment").trigger('reset')
      $(".answer-comment-form").hide()
    }).fail(function(error){
      console.log(error, "bad panda")
    })
  })

})
