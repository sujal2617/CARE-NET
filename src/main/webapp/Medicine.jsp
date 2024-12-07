<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medicine Donation</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        input {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        input:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 3px rgba(0, 123, 255, 0.25);
        }

        button {
            width: 100%;
            background: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background: #0056b3;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }

        a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .form-container {
                padding: 15px;
            }

            input, button {
                font-size: 14px;
            }

            h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Donate Medicine</h2>
    <form action="MedicineServlet" method="post">
        <label for="medicine_name">Medicine Name:</label>
        <input type="text" id="medicine_name" name="medicine_name" required>

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
        swal("Thank you!", "Your medicine donation has been successfully recorded.", "success");
    } else if (status === "donationFailed") {
        swal("Oops!", "There was an issue recording your donation. Please try again.", "error");
    } else if (status === "error") {
        swal("Error", "An error occurred. Please try again later.", "error");
    }
</script>

</body>
</html>
