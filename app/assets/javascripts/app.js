$(document).ready(function(){
  attachListeners();
})

function attachListeners(){
  nextActivity();
  previousActivity();
  // addActivity();
  addVacation();
  addDestination();
}

class Vacation{
  constructor(id, name, budget, destination_id, user_id){
    this.id = id
    this.name = name
    this.budget = budget
    this.destination_id = destination_id
    this.user_id = user_id
  }
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

Vacation.prototype.buildVacation = function(){
  let html = ""

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
      // let typeNames = data.types.map((type) => type.name);
      //   $.each(typeNames, function(){
      //     $(".activity_types").append(this + "<br>")});
      $("a.previous").attr("data-id", data.id);
      $("a.next").attr("data-id", data.id) + 1;
    }).fail(function(){
        alert("Oops! Go forward : )");
        window.location.href="http://localhost:3000/activities/list"
    })
    e.preventDefault();
  })
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
        console.log(response)
      }
    })
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

// function addActivity(){
//   $("form#new_activity").submit(function(e){
//      e.preventDefault();
//      // don't actually submit this form
//      alert("clicked but not submitted!")
//      // var values = $(this).serialize();
//      // var posting = $.post('/activities', values);
//      // posting.done(function(data){
//      //    console.log(data)
//      // //
//      // // debugger
//      // //
//      $.ajax({
//        type: "POST",
//        url: "/activities",
//        data: $(this).serialize(),
//        success: function(response) {
//          let activity = new Activity
//        }
//      })
//   })
// }



  // $("#show_activities").click(function(e){
  //   e.preventDefault();
  //   $("#show_activities").hide(); //hide the show activities link when activities are shown
  //   console.log(this.href)
  // })
  //   $.get(this.href).success(function(v_activities){
  //     $.each(v_activities, function(v_activity){
  //       debugger
  //       $("ol#display_vacation_activities").append(
  //         "<li>" +
  //         "<b>" + v_activity.activity.name + "</b><br>" +
  //         "<b>Number of People: </b>" + v_activity.people + "<br>" +
  //         "<b>Total cost of this activity: </b>$" + v_activity.total_cost + "($" + v_activity.activity.price + "per person)" +
  //         "</li>"
  //       )
  //     })
  //   })

//   })
// }
