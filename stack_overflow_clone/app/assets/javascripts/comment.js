$(document).ready(function(){
  $(".question-comment-form").on('submit', function(event){
    event.preventDefault();
  $.ajax({
    url: event.target.action,
    method: event.target.method,
    data: $(event.target).serialize()
  })
  .done(function(response){
    $(".question-comment-container").append(response)
  })
  .fail(function(error){
    console.log(error, "fail panda")
  })
 })
})
