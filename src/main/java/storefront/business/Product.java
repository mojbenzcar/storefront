package storefront.business;

import java.text.NumberFormat;
import java.io.Serializable;

public class Product implements Serializable
{
    private String code;
    private String description;
    private double price;
    
    public Product()
    {
        code = "";
        description = "";
        price = 0;
    }
    
    public void setCode(String code)
    {
        this.code = code;
    }
    
    public String getCode()
    {
        return code; 
    }
    
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description; 
    }
    
    public void setPrice(double price)
    {
        this.price = price;
    }

    public double getPrice()
    {
        return price; 
    }
    
    public String getPriceCurrencyFormat()
    {
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        return currency.format(price);
    }
        
    public String getImageURL()
    {
        String imageURL = "/storefront/images/" + code + "_image.jpg";
        return imageURL;
    }
}
