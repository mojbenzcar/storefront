package storefront.catalog;

import storefront.data.ProductDB;
import storefront.business.Product;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class DisplayProductServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        // get request parameters
        String productCode = request.getParameter("productCode");

        // update the Model
        Product product = ProductDB.selectProduct(productCode);
        HttpSession session = request.getSession();
        session.setAttribute("product", product);

        // forward to the View
        String url = "/catalog/" + productCode + "/index.jsp";
        RequestDispatcher dispatcher =
            getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
