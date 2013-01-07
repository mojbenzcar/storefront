package storefront.admin;

import storefront.data.InvoiceDB;
import storefront.business.Invoice;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class ProcessInvoiceServlet extends HttpServlet
{
    public void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException
    {     
        HttpSession session = request.getSession();

        Invoice invoice = (Invoice) session.getAttribute("invoice");
        int invoiceID = invoice.getInvoiceNumber();

        InvoiceDB.updateInvoiceIsProcessed(invoiceID);

        String url = "/admin/displayInvoices";
        RequestDispatcher dispatcher =
            getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}