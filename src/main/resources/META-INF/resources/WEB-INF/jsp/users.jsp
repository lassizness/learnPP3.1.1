<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>User List</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>User List</h1>
<table id="users-table">
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Age</th>
    <th>Action</th>
  </tr>
  <!-- Rows will be added by JavaScript -->
</table>
<hr>
<h2>Add User</h2>
<form id="add-user-form">
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" required>

  <label for="age">Age:</label>
  <input type="number" id="age" name="age" required>

  <input type="submit" value="Add User">
</form>

<script>
  $(document).ready(function() {
    // Load users on page load
    $.get("/users", function(data) {
      data.forEach(function(user) {
        $('#users-table').append('<tr><td>' + user.id + '</td><td>' + user.name + '</td><td>' + user.age + '</td><td><button onclick="deleteUser(' + user.id + ')">Delete</button></td></tr>');
      });
    });

    // Handle form submission
    $('#add-user-form').on('submit', function(e) {
      e.preventDefault();

      var name = $('#name').val();
      var age = $('#age').val();

      $.post("/users/add", { name: name, age: age }, function() {
        location.reload(); // reload the page to see the new user
      });
    });
  });

  function deleteUser(id) {
    $.ajax({
      url: '/users/' + id,
      type: 'DELETE',
      success: function() {
        location.reload(); // reload the page to see the changes
      }
    });
  }
</script>
</body>
</html>
