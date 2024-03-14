<%@ page import="java.util.Properties" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.UUID" %>

<%
// Get form data
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String username = request.getParameter("username");
String password = request.getParameter("password");

// Generate activation code (you may customize this as needed)
String activationCode = UUID.randomUUID().toString();

// Send activation email
String fromEmail = "priyasinghh2423@gmail.com"; 
String host = "smtp.gmail.com"; // SMTP server host
String port = "587"; // SMTP server port
String usernameSMTP = "priyasinghh2423@gmail.com"; // SMTP server username
String passwordSMTP = "ofnzlyqammixphug"; // SMTP server password

Properties props = new Properties();
props.put("mail.smtp.host", host);
props.put("mail.smtp.port", port);
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.debug", "true");
props.put("mail.smtp.ssl.trust", "*");
//props.put("mail.smtp.port", String.valueOf(port));

// Create session with authentication
Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(usernameSMTP, passwordSMTP);
    }
});

try {
    // Create a default MimeMessage object.
    MimeMessage message = new MimeMessage(mailSession);
    message.setFrom(new InternetAddress(fromEmail));
    message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
    message.setSubject("Account Activation");

    // Create activation link
    String activationLink = "http://yourwebsite.com/activate?code=" + activationCode;

    // Email content
    String content = "Dear " + name + ",\n\n"
                   + "Please click the following link to activate your account:\n"
                   + activationLink + "\n\n"
                   + "Thank you,\n"
                   + "Your Website Team";

    // Set email content
    message.setText(content);

    // Send message
    Transport.send(message);

    // Show success message
    out.println("<script>alert('Activation link sent to " + email + ". Please check your email.');</script>");

    // Store activation code in session attribute
    session.setAttribute("activationCode", activationCode);

} catch (MessagingException mex) {
    // Show error message with more details
    out.println("<script>alert('Error sending activation link. Please try again later. Error details: " + mex.getMessage() + "');</script>");
mex.printStackTrace();
}
%>
