/************************************************************
* Create the database named storefront and all of its tables.
************************************************************/
  
DROP DATABASE IF EXISTS storefront;
  
CREATE DATABASE storefront;
  
USE storefront;
  
CREATE TABLE User (
    UserID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    EmailAddress VARCHAR(50),
    CompanyName VARCHAR(50),
    Address1 VARCHAR(50),
    Address2 VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip VARCHAR(50),
    Country VARCHAR(50),
    CreditCardType VARCHAR(50),
    CreditCardNumber VARCHAR(50),
    CreditCardExpirationDate VARCHAR(50),
  
    PRIMARY KEY (UserID)
);
  
CREATE TABLE Invoice(
    InvoiceID INT NOT NULL AUTO_INCREMENT,
    UserID INT NOT NULL,
    InvoiceDate DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
    TotalAmount FLOAT NOT NULL DEFAULT '0',
    IsProcessed enum('y','n') DEFAULT NULL,
  
    PRIMARY KEY (InvoiceID),
    FOREIGN KEY (UserID) REFERENCES User (UserID)
);
  
CREATE TABLE LineItem(
    LineItemID INT NOT NULL AUTO_INCREMENT,
    InvoiceID INT NOT NULL DEFAULT '0',
    ProductID INT NOT NULL DEFAULT '0',
    Quantity INT NOT NULL DEFAULT '0',
  
    PRIMARY KEY (LineItemID),
    FOREIGN KEY (InvoiceID) REFERENCES Invoice (InvoiceID)
);
  
CREATE TABLE Product(
    ProductID INT NOT NULL AUTO_INCREMENT,
    ProductCode VARCHAR(10) NOT NULL DEFAULT '',
    ProductDescription VARCHAR(100) NOT NULL DEFAULT '',
    ProductPrice DECIMAL(7,2) NOT NULL DEFAULT '0.00',
  
    PRIMARY KEY (ProductID)
);
  
INSERT INTO Product VALUES 
  ('1', 'pr01', 'Commemorative Wedding Cups', '119.99'),
  ('2', 'pr02', 'product no2', '12.95'),
  ('3', 'pr03', 'product no3', '14.95');
  
CREATE TABLE UserPass (
  Username varchar(15) NOT NULL PRIMARY KEY,
  Password varchar(15) NOT NULL
);
  
INSERT INTO UserPass VALUES ('james', 'j02200396'),
                            ('heather', 'heatherpass'),
                            ('admin', 'j02200396');
                          
CREATE TABLE UserRole (   
  Username VARCHAR(15) NOT NULL,
  Rolename VARCHAR(15) NOT NULL,

  PRIMARY KEY (Username, Rolename)
);
  
INSERT INTO UserRole VALUES ('heather', 'service'),
                            ('james', 'programmer');
