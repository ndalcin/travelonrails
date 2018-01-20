# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
  <!-- On vacation's show page, clicking the link 'click to see planned activities' renders all vacation's activities -->
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
  <!-- Navigate to an activity's show page (navbar Activities, click link), you can scroll through all activities using next and previous buttons -->
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.
  <!-- On the activity show pages rendered above, activity types are also rendered to the DOM, displaying the activity's types (activity has_many types) -->
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
  <!-- Destinations index page allows a user to create a new destination through a form. Once submitted, the new destination is rendered without a page refresh as a new list item in the DOM -->
- [x] Translate JSON responses into js model objects.
  <!-- Vacation and Destination JS model objects -->
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
  <!-- Vacation JS model method: buildVacation() -->
  <!-- Destination JS model method: buildDestination() -->
Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
