CREATE PROCEDURE sp_LoginUser
    @Username VARCHAR(50),
    @Password VARCHAR(255)
AS
BEGIN
    SELECT UserID, Username, FullName, Role
    FROM   Users
    WHERE  Username = @Username
      AND  Password = @Password;
END
CREATE PROCEDURE sp_AddProduct
    @ProductName VARCHAR(100),
    @Category    VARCHAR(50),
    @Price       DECIMAL(10,2),
    @Quantity    INT,
    @MinStock    INT,
    @SupplierID  INT
AS
BEGIN
    INSERT INTO Products
        (ProductName, Category, Price, Quantity, MinStock, SupplierID)
    VALUES
        (@ProductName, @Category, @Price, @Quantity, @MinStock, @SupplierID);

    SELECT SCOPE_IDENTITY() AS NewProductID;
END