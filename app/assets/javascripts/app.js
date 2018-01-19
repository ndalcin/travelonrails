$(document).ready(function (){
  attachListeners();
})



function attachListeners(){
  nextActivity();
  previousActivity();
}

function nextActivity(){
  $("a.next").click(function(e){
    var nextId = parseInt($(".next").attr("data-id")) + 1;
    console.log(nextId)
    $.get("/activities/" + nextId + ".json", function(data){
      console.log(data)
      $("#activity_name").text(data["name"]);
      $("#activity_price").text("$" + data["price"]);
      $("a.next").attr("data-id", data["id"]);
      $("a.previous").attr("data-id", data.id - 1);
    }).fail(function(){
      alert("Thanks for checking out the list!");
      window.location.href="http://localhost:3000/activities/list"
      // $.get("/activities/1.json", function(data) {
      //   $("#activity_name").text(data["name"]);
      //   $("#activity_price").text("$" + data["price"]);
      //   $("a.next").attr("data-id", data["id"]);
      //   $("a.previous").attr("data-id", data.id - 1);
      // })
    })
    e.preventDefault();
  })
}

function previousActivity(){
  $("a.previous").click(function(e){
    var previousId = parseInt($(".next").attr("data-id")) - 1;
    console.log(previousId)
    $.get("/activities/" + previousId + ".json", function(data){
      console.log(data)
      $("#activity_name").text(data["name"]);
      $("#activity_price").text("$" + data["price"]);
      $("a.previous").attr("data-id", data["id"]);
      $("a.next").attr("data-id", data.id + 1);
    }).fail(function(){
      alert("Oops! Go forward : )");
      window.location.href="http://localhost:3000/activities/list"
      // $.get("/activities/14.json", function(data) {
      //   $("#activity_name").text(data["name"]);
      //   $("#activity_price").text("$" + data["price"]);
      //   $("a.next").attr("data-id", data["id"]);
      //   $("a.previous").attr("data-id", data.id - 1);
      // })
    })
    e.preventDefault();
  })




  $("#show_activities").click(function(e){
    e.preventDefault();
    $("#show_activities").hide(); //hide the show activities link when activities are shown
    console.log(this.href)

    $.get(this.href).success(function(v_activities){
      $.each(v_activities, function(v_activity){
        debugger
        $("ol#display_vacation_activities").append(
          "<li>" +
          "<b>" + v_activity.activity.name + "</b><br>" +
          "<b>Number of People: </b>" + v_activity.people + "<br>" +
          "<b>Total cost of this activity: </b>$" + v_activity.total_cost + "($" + v_activity.activity.price + "per person)" +
          "</li>"
        )
      })
    })

  })
}
