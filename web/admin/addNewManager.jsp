<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
    <head>
        <link rel="stylesheet" href="../css/addNewProduct-style.css">
        <title>Add New Product</title>
    </head>
    <body>
        <%    String msg = request.getParameter("msg");
            if ("done".equals(msg)) {
        %>
        <h3 class="alert">Manager Added Successfully!</h3>
        <%} %>
        <%
            if ("wrong".equals(msg)) {
        %>
        <h3 class="alert">Some thing went wrong! Try Again!</h3>
        <%} %>
        <%
            int id = 1;
            try {
                Connection con = ConnectionProvider.getCon();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select nvl(max(id),0) from managers");
                while (rs.next()) {
                    id = rs.getInt(1);
                    id = id + 1;
                }
            } catch (Exception e) {

            }
        %>
        <form action="addNewManagerAction.jsp" method="post">
            <h3 style="color: yellow;">Product ID:<%=id%> </h3>
            <input type="hidden" name="id" value="<%=id%>">

            <div class="left-div">
                <h3>Enter Name</h3>
                <input class="input-style" type="text" name="name" placeholder="Enter name" required> 
                <hr>
            </div>

            <div class="right-div">
                <h3>Enter Email</h3>
                <input class="input-style" type="email" name="email" placeholder="Enter email" required> 
                <hr>
            </div>

            <div class="left-div">
                <h3>Enter Password</h3>
                <input class="input-style" type="password" name="password" placeholder="Enter password" required> 
                <hr>
            </div>

            <div class="right-div">
                <h3>Active</h3>
                <select class="input-style" name="active">
                    <option value="Yes">Yes </option>
                    <option value="No">No </option>
                </select>
                <hr>
            </div>
            <!--<button class="button"> Save <i class='far fa-arrow-alt-circle-right'></i></button>-->
            <input type="submit">

    </body>
    <br><br><br>
</body>
</html>