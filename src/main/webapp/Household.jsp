<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Household Donation</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-top: 50px;
            font-size: 2em;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007BFF;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Form Styles */
        form {
            width: 50%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            margin-top: 30px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-size: 1.1em;
            color: #555;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], 
        input[type="number"], 
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: white;
            font-size: 1.2em;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        /* Form responsive styles */
        @media (max-width: 768px) {
            form {
                width: 80%;
            }
        }

        @media (max-width: 480px) {
            form {
                width: 95%;
            }
        }
    </style>
</head>
<body>
    <h1>Donate Household Items</h1>
    
    <form method="post" action="HouseholdServlet">
    <div>
        <div class="form-group">
            <label for="item_name">Item Name:</label>
            <input type="text" name="item_name" id="item_name" required="required">
        </div>
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" name="quantity" id="quantity" required="required">
        </div>
        <div class="form-group">
            <label for="item_condition">Condition:</label>
            <input type="text" name="item_condition" id="item_condition" required="required">
        </div>
        <div class="form-group">
            <label for="donor_name">Your Name:</label>
            <input type="text" name="donor_name" id="donor_name" required="required">
        </div>
        <div class="form-group">
            <label for="contact_number">Contact Number:</label>
            <input type="text" name="contact_number" id="contact_number" required="required">
        </div>
        <div class="form-group">
            <label for="donation_date">Donation Date:</label>
            <input type="date" name="donation_date" id="donation_date" required="required">
        </div>
        <div class="form-group">
            <input type="submit" value="Donate">
        </div>
    </form>

    <a href="index.jsp#portfolio">Go back to Home</a>
</div>
    <script type="text/javascript">
        var status = "<%= request.getAttribute("status") %>";

        if (status == "donationSuccess") {
            swal("Thank you!", "Your donation has been successfully recorded.", "success");
        } else if (status == "donationFailed") {
            swal("Oops!", "There was an issue recording your donation. Please try again.", "error");
        } else if (status == "error") {
            swal("Error", "An error occurred. Please try again later.", "error");
        }
    </script>
</body>
</html>
