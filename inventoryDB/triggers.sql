CREATE TRIGGER trg_AfterProductUpdate
ON Products
AFTER UPDATE
AS
BEGIN
    UPDATE Products
    SET    UpdatedAt = GETDATE()
    WHERE  ProductID IN (SELECT ProductID FROM inserted);

    INSERT INTO StockAlerts (ProductID, AlertMsg)
    SELECT i.ProductID,
           'LOW STOCK: ' + i.ProductName +
           ' — only ' + CAST(i.Quantity AS VARCHAR) + ' units left!'
    FROM   inserted i
    WHERE  i.Quantity <= i.MinStock;
END