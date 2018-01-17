$(document).ready(function (){
  attachListeners();
})
// With turbolinks the javascript is only loaded once.
// This will fix issues of javascript not executing on a link_to click || back button click.
// $(function() {
//   $(document).on('turbolinks:load', function() {
//     attachListeners();
//   })
// })

function attachListeners(){
  $(".next").click(function(e){
    e.preventDefault();
    var nextId = parseInt($(".next").attr("data-id"));
    $.get("/vacations/" + nextId + ".json", function(data){
      console.log(data)
      $("#vacation_name").text(data["name"]);
      $("#destination").text(data["destination"]["city"] + ", " + data["destination"]["country"]);
      $("#date").text(data["date"]);
      $("#length").text(data["length"]);
      $("#vacation_budget").text("$" + data["budget"]);
      $("#activities_total").text("$" + data["activities_total"]);
    })
  })
  $("a.previous").click(function(){
    alert("Testing PREVIOUS!!!")
  })
}
