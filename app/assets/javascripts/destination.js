$(document).on('turbolinks:load', function() {
addDestination();
})

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
