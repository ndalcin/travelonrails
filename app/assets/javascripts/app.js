$(document).ready(function (){
  attachListeners();
})
// With turbolinks the javascript is only loaded once.
// This will fix issues of javascript not executing on a link_to click || back button click.
$(function() {
  $(document).on('turbolinks:load', function() {
    attachListeners();
  })
})

function attachListeners(){
  $("a.next").click(function(){
    alert("Testing NEXT!!!")
  })
  $("a.previous").click(function(){
    alert("Testing PREVIOUS!!!")
  })
}
