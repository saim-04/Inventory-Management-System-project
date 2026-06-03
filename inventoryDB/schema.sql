
CREATE TABLE Users (
    UserID    INT IDENTITY(1,1) PRIMARY KEY,
    Username  VARCHAR(50)  NOT NULL UNIQUE,
    Password  VARCHAR(255) NOT NULL,
    FullName  VARCHAR(100) NOT NULL,
    Role      VARCHAR(20)  DEFAULT 'Staff',
    CreatedAt DATETIME     DEFAULT GETDATE()
);
CREATE TABLE Suppliers (
    SupplierID   INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    Phone        VARCHAR(20),
    Email        VARCHAR(100),
    Address      VARCHAR(255)
);
