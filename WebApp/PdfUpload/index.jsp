<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <b>Upload | <a href="viewPdf.jsp">View</a></b><br/><br/>
        <form action="UploadPdf" method="post" enctype="multipart/form-data">
            <input type="file" name="pdf" accept=".pdf" required/><br/><br/>
            <input type="submit"/>
        </form>
    </body>
</html>
   
