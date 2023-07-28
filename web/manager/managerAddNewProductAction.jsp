<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String category = request.getParameter("category");
    String price = request.getParameter("price");
    String active = request.getParameter("active");

    try {

        Connection con = ConnectionProvider.getCon();

        PreparedStatement ps = con.prepareStatement(" insert into product select nvl(max(id),0)+1,?,?,?,? from product");

        //ps.setInt(1, Integer.parseInt(id));
        //ps.setInt(1, 2);
        ps.setString(1, name);

        ps.setString(2, category);
 
        ps.setInt(3, Integer.parseInt(price));

        ps.setString(4, active);

        int i=ps.executeUpdate();

        response.sendRedirect("managerAddNewProduct.jsp?msg=done");
    } catch (Exception e) {
        response.sendRedirect("managerAddNewProduct.jsp?msg=wrong");
    }
%>
