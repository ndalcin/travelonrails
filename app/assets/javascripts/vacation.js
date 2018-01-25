$(document).on('turbolinks:load', function() {
  addVacation();
  showActivities();
})

class Vacation{
  constructor(id, name){
    this.id = id
    this.name = name
  }
}

Vacation.prototype.buildVacation = function(){
  let html = ""
  html += "<li>"
  html += `<a href="http://localhost:3000/vacations/${this.id}">${this.name}</a>`
  html += "</li>"
  return html
}


function addVacation(){
  $("form#new_vacation").submit(function(e){
    e.preventDefault();
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      dataType: "json",
      success: function(response) {
        let vacation = new Vacation(response.id, response.name)
        console.log(vacation)
        $("ol#current_vacations").append(vacation.buildVacation());
        $("form#new_vacation").trigger("reset");
        $("#submit_vacation").removeAttr("disabled")
      }
    })
  })
}
// On Vacation Show Page
function showActivities(){
  $("a#show_activities").click(function(e){
    e.preventDefault();
    $("a#show_activities").hide();
     //hide the show activities link when activities are shown
    $.get(this.href).success(function(activities){
      $.each(activities, function(index, activity){
        $("#display_vacation_activities").append(
          "<li>" +
          `<a href="http://localhost:3000/activities/${activity.id}/edit">${activity.name}</a></br>` +
          "<b>  Price: </b></br>" +
          "$" + activity.price + "</li></br>"
        )
      })
    })
  })
}
