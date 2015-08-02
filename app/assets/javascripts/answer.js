$(document).ready(function(){
  $(".new_answer").on('submit', function(event){
    event.preventDefault();
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize()
    }).done(function(answerPartial){
      $(".answer-container").append(answerPartial)
      $(".new_answer").trigger("reset")
    }).fail(function(error){
      console.log(error, "hidden panda")
    })
  })
})
