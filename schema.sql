CREATE TABLE "User" (
  "UserId" int NOT NULL AUTO_INCREMENT,
  "Name" varchar(45) NOT NULL,
  "Email" varchar(45) NOT NULL,
  "Contact" decimal(11,0) NOT NULL,
  "Password" varchar(45) NOT NULL,
  "Address" varchar(250) NOT NULL,
  "Role" enum('Customer','Manager','Clerk','Admin') NOT NULL,
  PRIMARY KEY ("UserId"),
  UNIQUE KEY "Email_UNIQUE" ("Email")
);

CREATE TABLE "Product" (
  "ID" int NOT NULL AUTO_INCREMENT,
  "Name" varchar(50) DEFAULT NULL,
  "Description" varchar(255) DEFAULT NULL,
  "Status" varchar(11) DEFAULT NULL,
  "Image" varchar(50) DEFAULT NULL,
  "Price" int DEFAULT NULL,
  "Category" varchar(50) DEFAULT NULL,
  PRIMARY KEY ("ID")
);

CREATE TABLE "Orders" (
  "Id" int NOT NULL AUTO_INCREMENT,
  "ProductId" int DEFAULT NULL,
  "UserId" int DEFAULT NULL,
  "Quantity" int DEFAULT NULL,
  "ProductPrice" int DEFAULT NULL,
  "Date" date DEFAULT NULL,
  "Status" varchar(12) DEFAULT NULL,
  "PaymentMethod" varchar(25) DEFAULT NULL,
  "PickupTime" time DEFAULT NULL,
  PRIMARY KEY ("Id")
);

CREATE TABLE "Menu" (
  "ID" int NOT NULL AUTO_INCREMENT,
  "StartTime" time NOT NULL,
  "EndTime" time NOT NULL,
  "BreakFastTime" time NOT NULL,
  PRIMARY KEY ("ID")
);

CREATE TABLE "Feedback" (
  "FeedbackID" int NOT NULL AUTO_INCREMENT,
  "UserID" int DEFAULT NULL,
  "ProductID" int DEFAULT NULL,
  "Text" varchar(255) DEFAULT NULL,
  "Date" date DEFAULT NULL,
  PRIMARY KEY ("FeedbackID")
);

CREATE TABLE "Cart" (
  "UserId" int NOT NULL,
  "ProductId" int NOT NULL,
  "Quantity" int DEFAULT NULL,
  PRIMARY KEY ("UserId","ProductId")
);
