<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Food Donation</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .form-container h2 {
            text-align: center;
        }

        .form-container label {
            display: block;
            margin: 10px 0 5px;
        }

        .form-container input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #45a049;
        }

        .form-container a {
            display: block;
            margin-top: 15px;
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
        }

        .form-container a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Donate Food Items</h2>
    <form action="FoodServlet" method="post">
        <label for="food_name">Food Name:</label>
        <input type="text" id="food_name" name="food_name" required>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" min="1" required>

        <label for="donor_name">Donor Name:</label>
        <input type="text" id="donor_name" name="donor_name" required>

        <label for="contact_number">Contact Number:</label>
        <input type="text" id="contact_number" name="contact_number" pattern="[0-9]{10}" required>

        <label for="donation_date">Donation Date:</label>
        <input type="date" id="donation_date" name="donation_date" required>

        <label for="expiry_date">Expiry Date:</label>
        <input type="date" id="expiry_date" name="expiry_date" required>

        <button type="submit">Donate</button>
    </form>

    <a href="index.jsp#portfolio">Go back to Home</a> 
</div>

<script>
    var status = "<%= request.getAttribute("status") %>";

    if (status === "donationSuccess") {
        swal("Thank you!", "Your food donation has been successfully recorded.", "success");
    } else if (status === "donationFailed") {
        swal("Oops!", "There was an issue recording your donation. Please try again.", "error");
    } else if (status === "error") {
        swal("Error", "An error occurred. Please try again later.", "error");
    }
</script>

</body>
</html>
