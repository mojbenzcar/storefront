package storefront.cart;

import storefront.data.ProductDB;
import storefront.business.Product;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.ArrayList;

/* the DisplayQuickOrderServlet loads all the products from the database at once and stores them in
 * the session. the advantage here is that we load every time a user connects.
 *
 * alternatively, we could load the products into the ServletContext and thus only load once when
 * the server is started.
 *
 */
public class DisplayQuickOrderServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, 
                      HttpServletResponse response)
                      throws ServletException, IOException
    {
        HttpSession session = request.getSession();

        // if list of products doesn't exist, initialize it, 
        // and store it for the remainder of the session
        if (session.getAttribute("products") == null)
        {
            ArrayList<Product> products = ProductDB.selectProducts();
            session.setAttribute("products", products);
        }
                
        // forward to the Quick Order page
        String url = "/cart/quick_order.jsp";
        RequestDispatcher dispatcher =
            getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);        
    }
    
    public void doPost(HttpServletRequest request, 
                       HttpServletResponse response)
                       throws ServletException, IOException
    {
        doGet(request, response);
    }
}
