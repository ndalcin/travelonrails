$(document).on('turbolinks:load', function() {
  attachListeners();
})

function attachListeners(){
  nextActivity();
  previousActivity();
  addDestination();
  showActivities();
  addVacation();
}

class Destination{
  constructor(id, city, country){
    this.id = id
    this.city = city
    this.country = country
  }
}

Destination.prototype.buildDestination = function(){
  let html = ""
  html += "<li>"
  html += `${this.city}, ${this.country}`
  html += "</li>"
  return html
}


function nextActivity(){
  $("a.next").click(function(e){
    var nextId = parseInt($(".next").attr("data-id")) + 1;
    $.get("/activities/" + nextId + ".json", function(data){
      $("#activity_name").text(data["name"]);
      $("#activity_price").text("$" + data["price"]);
      $(".append_types").text("");
      var typeNames = data.types
      var div = $(".append_types")
      typeNames.forEach(function(type){
        div.append("<li><i>"+type.name+"</i></li>")
      })
      $("a.next").attr("data-id", data.id);
      $("a.previous").attr("data-id", data.id - 1);
    }).fail(function(){
      alert("Thanks for checking out the list!");
      window.location.href="http://localhost:3000/activities/list"
    })
    e.preventDefault();
  })
}

function previousActivity(){
  $("a.previous").click(function(e){
    var previousId = parseInt($(".previous").attr("data-id")) - 1;
    $.get("/activities/" + previousId + ".json", function(data){
      $("#activity_name").text(data["name"]);
      $("#activity_price").text("$" + data["price"]);
      $(".append_types").text("");
      var typeNames = data.types
      var div = $(".append_types")
      typeNames.forEach(function(type){
        div.append("<li><i>"+type.name+"</i></li>")
      })
      $("a.previous").attr("data-id", data.id);
      $("a.next").attr("data-id", data.id) + 1;
    }).fail(function(){
        alert("Oops! Go forward : )");
        window.location.href="http://localhost:3000/activities/list"
    })
    e.preventDefault();
  })
}

function addDestination(){
  $("form#new_destination").submit(function(e){
    e.preventDefault();
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      dataType: "json",
      success: function(response) {
        let destination = new Destination(response.id, response.city, response.country);
        $("#append_destination").append(destination.buildDestination());
        $("form#new_destination")[0].reset(); //clears form upon submission
      }
    })
  })
}

function showActivities(){
  $("a#show_activities").click(function(e){
    e.preventDefault();
    $("a#show_activities").hide(); //hide the show activities link when activities are shown
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
    alert("clicked but not submitted new vacay!");
    debugger
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      dataType: "json",
      success: function(response) {
        debugger
        let vacation = new Vacation(response.id, response.name)
        console.log(vacation)
        $("ol#current_vacations").append(vacation.buildVacation());
        $("form#new_vacation").trigger("reset")
      }
    })
  })
}
