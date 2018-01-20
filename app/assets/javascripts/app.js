$(document).ready(function (){
  attachListeners();
})



function attachListeners(){
  nextActivity();
  previousActivity();
  // addActivity();
  addVacation();
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
    console.log(e.form);
    // var values = $(this).serialize();
    // var userId = parseInt($("#review_book_id").attr("value"));
    // var pageUrl =`/users/${userId}/vacations`;
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
