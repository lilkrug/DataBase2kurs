Use Univer;
go
CREATE TABLE Products
(
    Id INT IDENTITY PRIMARY KEY,
    ProductName NVARCHAR(30) NOT NULL,
    Manufacturer NVARCHAR(20) NOT NULL,
    Price MONEY NOT NULL,
    IsDeleted BIT NULL
);

GO
CREATE TRIGGER products_delete
ON Products
INSTEAD OF DELETE
AS
UPDATE Products
SET IsDeleted = 1
WHERE ID =(SELECT Id FROM deleted)

 
INSERT INTO Products(ProductName, Manufacturer, Price)
VALUES ('iPhone X', 'Apple', 79000),
('Pixel 2', 'Google', 60000);
 
DELETE FROM Products 
WHERE ProductName='iPhone X';
 
SELECT * FROM Products;