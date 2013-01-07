package storefront.data;

import java.sql.*;

public class ReportDB
{    
    // The User Email report
    public static String getUserEmail(String reportTitle)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        Statement statement = null;
        ResultSet rs = null;

        String header = "<!DOCTYPE html><html><head></head><body>";
        String footer = "</body></html>";
        String query =
                "SELECT * "
                +  "FROM User "
                +  "ORDER BY LastName";
        try
        {
            statement = connection.createStatement();
            rs = statement.executeQuery(query);
            String d = "\t";
            StringBuilder report = new StringBuilder(header + "<h1>" + reportTitle + "</h1><br/>"
                    + "<table align='left'><tr>"
                    + "<th>LastName</th>"
                    + "<th>FirstName</th>"
                    + "<th>EmailAddress</th>"
                    + "<th>CompanyName</th>"
                    + "<th>Address1</th>"
                    + "<th>Address2</th>"
                    + "<th>City</th>"
                    + "<th>State</th>"
                    + "<th>Zip</th>"
                    + "<th>Country</th>"
                    + "<th>UserID</th></tr>");
            while (rs.next())
            {
                report.append(
                    "<tr>" + "<td>" + rs.getString("LastName") + "</td>"
                  + "<td>" + rs.getString("FirstName") + "</td>"
                  + "<td>" + rs.getString("EmailAddress") + "</td>" 
                  + "<td>" + rs.getString("CompanyName") + "</td>" 
                  + "<td>" + rs.getString("Address1") + "</td>" 
                  + "<td>" + rs.getString("Address2") + "</td>" 
                  + "<td>" + rs.getString("City") + "</td>" 
                  + "<td>" + rs.getString("State") + "</td>" 
                  + "<td>" + rs.getString("Zip") + "</td>" 
                  + "<td>" + rs.getString("Country") + "</td>" 
                  + "<td>" + rs.getInt("UserID") + "</td></tr>");
            }
            report.append("</table>" + footer);
            return report.toString();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return null;
        }
        finally
        {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(statement);
            pool.freeConnection(connection);
        }
    }
    
    // The Order Summary report
    public static String getOrderSummary(String reportTitle, 
        String startDate, String endDate)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;

        String query =
                "SELECT ProductCode, ProductDescription, "
                +  "   ProductPrice, Quantity, "
                +  "   SUM(Quantity) AS ProductQuantity, "
                +  "   SUM(ProductPrice*Quantity) AS ProductTotal "
                +  "FROM Invoice "
                +  "   INNER JOIN LineItem ON Invoice.InvoiceID = LineItem.InvoiceID "
                +  "   INNER JOIN Product ON LineItem.ProductID = Product.ProductID "
                +  "WHERE InvoiceDate >= ? "
                +  "   AND InvoiceDate <= ? "
                +  "GROUP BY ProductCode, ProductDescription "
                +  "ORDER BY ProductTotal DESC";
        try
        {
            statement = connection.prepareStatement(query);
            statement.setString(1, startDate);
            statement.setString(2, endDate);
            rs = statement.executeQuery(query);
            String d = "\t";
            StringBuilder report = new StringBuilder(
                    reportTitle + "\n\n"
                    + "Start Date: " + startDate + "\n"
                    + "End Date: " + endDate + "\n\n"
                    + "ProductCode" + d
                    + "ProductDescription" + d
                    + "ProductPrice" + d
                    + "Quantity" + d
                    + "Total" + "\n");
            while (rs.next())
            {
                report.append(rs.getString("ProductCode") + d
                        + rs.getString("ProductDescription") + d
                        + rs.getDouble("ProductPrice") + d
                        + rs.getInt("ProductQuantity") + d
                        + rs.getDouble("ProductTotal") + "\n");
            }
            return report.toString();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return null;
        }
        finally
        {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(statement);
            pool.freeConnection(connection);
        }
    }
    
    // The Order Detail report
    public static String getOrderDetail(String reportTitle, 
            String startDate, String endDate)
    {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        Statement statement = null;
        ResultSet rs = null;

        String query =
                "SELECT InvoiceDate, Invoice.InvoiceID, "
                +    "User.UserID, EmailAddress, "
                +    "Product.ProductCode, ProductPrice, "
                +    "Quantity "
                +  "FROM User "
                +  "   INNER JOIN Invoice ON User.UserID = Invoice.UserID "
                +  "   INNER JOIN LineItem ON Invoice.InvoiceID = LineItem.InvoiceID "
                +  "   INNER JOIN Product ON LineItem.ProductID = Product.ProductID "
                +  "WHERE InvoiceDate >= '" + startDate + "' "
                +  "   AND InvoiceDate <= '" + endDate + "' "
                +  "ORDER BY InvoiceDate DESC";
        try
        {
            statement = connection.createStatement();
            rs = statement.executeQuery(query);
            String d = "\t";
            StringBuilder report = new StringBuilder(
                    reportTitle + "\n\n"
                    + "Start Date: " + startDate + "\n"
                    + "End Date: " + endDate + "\n\n"
                    + "Date" + d
                    + "Time" + d
                    + "InvoiceID" + d
                    + "EmailAddress" + d
                    + "UserID" + d
                    + "ProductCode" + d
                    + "ProductPrice" + d
                    + "Quantity" + d
                    + "LineItemAmount" + "\n\n");
            double quantityTotal = 0;
            double dollarTotal = 0;
            while (rs.next())
            {
                Date invoiceDate = rs.getDate("InvoiceDate");
                String invoiceDateString = invoiceDate.toString();
                Time invoiceTime = rs.getTime("InvoiceDate");
                String invoiceTimeString = invoiceTime.toString();
                double price = rs.getDouble("ProductPrice");
                int quantity = rs.getInt("Quantity");
                double lineItemAmount = 0.0;
                lineItemAmount = price * quantity;
                report.append(invoiceDateString + d
                        + invoiceTimeString + d
                        + rs.getInt("InvoiceID") + d
                        + rs.getString("EmailAddress") + d
                        + rs.getInt("UserID") + d
                        + rs.getString("ProductCode") + d
                        + price + d
                        + quantity + d
                        + lineItemAmount + "\n");
                quantityTotal += quantity;
                dollarTotal += lineItemAmount;
            }
            report.append("\n");
            report.append("Totals:" + d + d + d + d + d + d + d
                    + quantityTotal + d + dollarTotal);
            return report.toString();
        }
        catch(SQLException e)
        {
            e.printStackTrace();
            return null;
        }
        
        finally
        {
            DBUtil.closeResultSet(rs);
            DBUtil.closeStatement(statement);
            pool.freeConnection(connection);
        }
    }
}
