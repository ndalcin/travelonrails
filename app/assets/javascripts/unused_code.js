// class Vacation{
//   constructor(id, name, budget, destination_id, user_id){
//     this.id = id
//     this.name = name
//     this.budget = budget
//     this.destination_id = destination_id
//     this.user_id = user_id
//   }
// }
//
// Vacation.prototype.buildVacation = function(){
//   let html = ""
// }
//
//
// function addVacation(){
//   $("form#new_vacation").submit(function(e){
//     e.preventDefault();
//     alert("clicked but not submitted new vacay!");
//     debugger
//     $.ajax({
//       type: "POST",
//       url: this.action,
//       data: $(this).serialize(),
//       dataType: "json",
//       success: function(response) {
//         console.log(response)
//       }
//     })
//   })
// }

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
