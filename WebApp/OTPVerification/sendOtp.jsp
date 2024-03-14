
<%@ page import="java.io.*, java.util.*, javax.mail.*, javax.mail.internet.*, javax.servlet.http.*, javax.servlet.*" %>

<%
    // Retrieve the email parameter from the request
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    // Your JavaMail configuration and SMTP server details
    String host = "smtp.gmail.com";
    String user = "priyasinghh2423@gmail.com";
    String password = "ofnzlyqammixphug";
    


    // Generate a random 6-digit OTP
    int otp = (int) (Math.random() * 900000) + 100000;

    // Set up JavaMail properties
    Properties properties = new Properties();
    properties.put("mail.smtp.host", host);
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.port", "587");
    properties.put("mail.debug", "true");
    properties.put("mail.smtp.ssl.trust", "*");

    // Get the default Session object.
    //Session session = Session.getDefaultInstance(properties);
    Session mailSession = Session.getInstance(properties, new javax.mail.Authenticator() {
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(user, password);
    }
});

    try {
        // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(user));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
        message.setSubject("Your OTP for Registration");

        // Set the actual message
        message.setText("Your OTP is: " + otp);
        
        // Email content
        String content = "Dear " + name + ",\n\n"
                   + "Please enter your otp to visit the dashboard:\n"
                   + otp + "\n\n"
                   + "Thank you,\n"
                   + "Your Website Team";

        message.setText(content);          
                   
        // Send message
        Transport.send(message);

        // Respond to the client-side JavaScript with 'success'
        
        out.println("<script>alert('Otp sent to " + email + ". Please check your email.');</script>");
    } catch (MessagingException mex) {
        mex.printStackTrace();
        // Respond to the client-side JavaScript with 'failure'
        out.print("failure");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Verification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        button {
            background-color: #007BFF;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="otpForm">
        <label for="otp">Enter OTP:</label>
        <input type="text" id="otp" required>

        <button type="button" onclick="verifyOTP()">Submit</button>
    </form>

    <script>
        function verifyOTP() {
            // Perform OTP verification logic
            // For simplicity, just redirect to the dashboard in this example
            window.location.href = "dashboard.html";
        }
    </script>
</body>
</html>
