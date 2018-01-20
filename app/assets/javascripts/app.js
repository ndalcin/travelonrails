$(document).on('turbolinks:load', function() {
  nextActivity();
  previousActivity();
})



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
