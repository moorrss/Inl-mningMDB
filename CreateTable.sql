DROP TABLE IF EXISTS Suppliers;

DROP TABLE IF EXISTS Contacts;

DROP TABLE IF EXISTS Cities;

DROP TABLE IF EXISTS PostalCOdes;

DROP TABLE IF EXISTS Addresses;

DROP TABLE IF EXISTS Addresstype;

DROP TABLE IF EXISTS ContactsAddresses;

DROP TABLE IF EXISTS SuppliersAddresses;

DROP TABLE IF EXISTS EmailAddress;

DROP TABLE IF EXISTS ContactsEmail;

DROP TABLE IF EXISTS SuppliersEmail;

DROP TABLE IF EXISTS PhoneNumbers;

DROP TABLE IF EXISTS SuppliersPN;

DROP TABLE IF EXISTS ContactsPN;

DROP TABLE IF EXISTS Ingredients;

DROP TABLE IF EXISTS Products;

DROP TABLE IF EXISTS SupplierCatalog;

DROP TABLE IF EXISTS RecipeIngredients;

DROP TABLE IF EXISTS Purchases;

DROP TABLE IF EXISTS PurchaseLines;

CREATE TABLE Suppliers (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(100) NOT NULL,
    AddressId INTEGER,
    FOREIGN KEY (AddressId) REFERENCES Addresses (Id)
);

CREATE TABLE Contacts (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    SupplierId INTEGER NOT NULL,
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(60) NOT NULL,
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id)
);

CREATE TABLE Cities (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    City VARCHAR(50)
);

CREATE TABLE PostalCodes (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    PostalCode VARCHAR(10) NOT NULL,
    CityId INTEGER,
    FOREIGN KEY (CityId) REFERENCES Cities (Id)
);

CREATE TABLE Addresses (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    AddressLine VARCHAR(100) NOT NULL,
    PostalCodeId INTEGER,
    FOREIGN KEY (PostalCodeId) REFERENCES PostalCodes (Id)
);

CREATE TABLE AddressType (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Value VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE ContactsAddresses (
    ContactsId INTEGER,
    AddressId INTEGER,
    AddressTypeId INTEGER,
    PRIMARY KEY (
        ContactsId,
        AddressId,
        AddressTypeId
    ),
    FOREIGN KEY (ContactsId) REFERENCES Contacts (Id),
    FOREIGN KEY (AddressId) REFERENCES Addresses (Id),
    FOREIGN KEY (AddressTypeId) REFERENCES AddressType (Id)
);

CREATE TABLE SuppliersAddresses (
    SuppliersId INTEGER,
    AddressId INTEGER,
    AddressTypeId INTEGER,
    PRIMARY KEY (
        SuppliersId,
        AddressId,
        AddressTypeId
    ),
    FOREIGN KEY (SuppliersId) REFERENCES Suppliers (Id),
    FOREIGN KEY (AddressId) REFERENCES Addresses (Id),
    FOREIGN KEY (AddressTypeId) REFERENCES AddressType (Id)
);

CREATE TABLE EmailAddress (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE ContactsEmail (
    ContactsId INTEGER,
    EmailId INTEGER,
    PRIMARY KEY (ContactsId, EmailId),
    FOREIGN KEY (ContactsId) REFERENCES Contacts (Id),
    FOREIGN KEY (EmailId) REFERENCES EmailAddress (Id)
);

CREATE TABLE SuppliersEmail (
    SuppliersId INTEGER,
    EmailId INTEGER,
    PRIMARY KEY (SuppliersId, EmailId),
    FOREIGN KEY (SuppliersId) REFERENCES Suppliers (Id),
    FOREIGN KEY (EmailId) REFERENCES EmailAddress (Id)
);

CREATE TABLE PhoneNumbers (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    PNumber VARCHAR(30)
);

CREATE TABLE SuppliersPN (
    SuppliersId INTEGER,
    PhoneId INTEGER,
    PRIMARY KEY (SuppliersId, PhoneId),
    FOREIGN KEY (SuppliersId) REFERENCES Suppliers (Id),
    FOREIGN KEY (PhoneId) REFERENCES PhoneNumbers (Id)
);

CREATE TABLE ContactsPN (
    ContactsId INTEGER,
    PhoneId INTEGER,
    PRIMARY KEY (ContactsId, PhoneId),
    FOREIGN KEY (ContactsId) REFERENCES Contacts (Id),
    FOREIGN KEY (PhoneId) REFERENCES PhoneNumbers (Id)
);

CREATE TABLE Ingredients (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    ItemNumber VARCHAR(20) NOT NULL UNIQUE,
    Name VARCHAR(100) NOT NULL,
    PricePerKg DECIMAL NOT NULL,
    StockQuantity DECIMAL NOT NULL DEFAULT 0.0
);

CREATE TABLE Products (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE SupplierCatalog (
    SupplierId INTEGER,
    IngredientId INTEGER,
    PRIMARY KEY (SupplierId, IngredientId),
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id) ON DELETE CASCADE,
    FOREIGN KEY (IngredientId) REFERENCES Ingredients (Id) ON DELETE CASCADE
);

CREATE TABLE RecipeIngredients (
    ProductId INTEGER,
    IngredientId INTEGER,
    StockQuantity DECIMAL NOT NULL,
    PRIMARY KEY (ProductId, IngredientId),
    FOREIGN KEY (ProductId) REFERENCES Products (Id) ON DELETE CASCADE,
    FOREIGN KEY (IngredientId) REFERENCES Ingredients (Id) ON DELETE CASCADE
);

CREATE TABLE Purchases (
    Id INTEGER PRIMARY KEY AUTOINCREMENT,
    SupplierId INTEGER NOT NULL,
    Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SupplierId) REFERENCES Suppliers (Id)
);

CREATE TABLE PurchaseLines (
    PurchaseId INTEGER,
    IngredientId INTEGER,
    StockQuantity DECIMAL NOT NULL,
    PurchasesPrice DECIMAL NOT NULL,
    PRIMARY KEY (PurchaseId, IngredientId),
    FOREIGN KEY (PurchaseId) REFERENCES Purchases (Id) ON DELETE CASCADE,
    FOREIGN KEY (IngredientId) REFERENCES Ingredients (Id)
);