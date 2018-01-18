$(document).ready(function (){
  attachListeners();
})



function attachListeners(){
  $(".next").click(function(e){
    e.preventDefault();
    var nextId = parseInt($(".next").attr("data-id")) + 1;
    $.get("/vacations/" + nextId + ".json", function(data){
      console.log(data)
      $("#vacation_name").text(data["name"]);
      $("#destination").text(data["destination"]["city"] + ", " + data["destination"]["country"]);
      $("#date").text(data["date"]);
      $("#length").text(data["length"]);
      $("#vacation_budget").text("$" + data["budget"]);
      $("#activities_total").text("$" + data["activities_total"]);
      $(".next").attr("data-attribute", data["id"])
    })
  })
  $("a.previous").click(function(){
    alert("Testing PREVIOUS!!!");
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
