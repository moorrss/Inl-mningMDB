INSERT INTO
 Suppliers (Name)
VALUES ('Kvarnen AB'),
 ('Socker AB'),
  ('Frukt och Bär');

INSERT INTO
 Ingredients (
 ItemNumber,
 Name,
 PricePerKg,
 StockQuantity
 )
VALUES (
 'MJO-VET',
 'Vetemjöl',
 10.50,
  100.0 ),
 (
 'SOC-STR',
 'Strösocker',
 15.00,
 50.0 ),
 (
 'KAN-MAL',
 'Kanel',
 80.00,
 10.0
 ),
 (
 'KRD-MAL',
 'Kardemumma',
 150.00,
 5.0
 ),
 (
 'MJO-RAG',
 'Rågmjöl',
 12.00,
 80.0
 ),  (
 'APP-R',
 'Äpplen',
 25.00,
 15.0
 );

INSERT INTO
 Products (Name)
VALUES ('Kanelbulle'),
('Kardemummabulle'),
 ('Surdegslimpa'),
 ('Äppelkaka');

INSERT INTO
 Cities (City)
VALUES ('Kvarnstad'),
 ('Grannstad'),
 ('Malmö'),
    ('Lagerstaden');

INSERT INTO
 AddressType (Value)
VALUES  ('Leverans'),
 ('Faktura');

INSERT INTO
 EmailAddress (Email)
VALUES ('gunde.kvarn@kvarnen.se'),
 ('gunhild@socker.se'),
 ('lisa@fruktobär.se'),
 ('faktura@kvarnen.se');

INSERT INTO
 PhoneNumbers (PNumber)
VALUES ('010-123456'),
 ('020-654321'),
 ('010-987654'),
    ('040-112233');

INSERT INTO
Contacts (
 SupplierId,
 FirstName,
 LastName
 )
VALUES (1, 'Gunde', 'Kvarn'),
 (2, 'Gunhild', 'Gransson'),
 (3, 'Lisa', 'Svan');

INSERT INTO
 PostalCodes (PostalCode, CityId)
VALUES ('123 45', 1),
('543 21', 2),
 ('211 22', 3),
    ('888 99', 4);

INSERT INTO
 Purchases (SupplierId, Date)
VALUES (1, '2025-10-31 09:30:00'),
    (2, '2025-11-01 14:00:00');

INSERT INTO
 Addresses (AddressLine, PostalCodeId)
VALUES ('Kvarngatan 1', 1),
 ('Granstigen 3', 2),
 ('Storbackagatan 2', 3),
    ('Fakturavägen 10', 4);

INSERT INTO
SupplierCatalog (SupplierId, IngredientId)
VALUES (1, 1),
 (1, 5),
 (2, 2),
 (2, 3),
 (2, 4),
 (3, 6);

INSERT INTO
 RecipeIngredients (
 ProductId,
 IngredientId,
 StockQuantity
 )
VALUES (1, 1, 0.5),
 (1, 2, 0.1),
 (1, 3, 0.02),
 (2, 1, 0.5),
 (2, 2, 0.1),
 (2, 4, 0.03),
 (3, 1, 0.3),
 (3, 5, 0.7),
 (4, 1, 0.4),
 (4, 2, 0.2),
 (4, 6, 1.0);

INSERT INTO
 PurchaseLines (
 PurchaseId,
 IngredientId,
 StockQuantity,
 PurchasesPrice
)
VALUES (1, 1, 50.0, 10.25),
(1, 5, 25.0, 12.00),
    (2, 2, 100.0, 14.50);

INSERT INTO
 ContactsEmail (ContactsId, EmailId)
VALUES (1, 1),
 (2, 2),
 (3, 3);

INSERT INTO
 SuppliersEmail (SuppliersId, EmailId)
VALUES (1, 1),
 (2, 2),
 (3, 3),
    (1, 4);

INSERT INTO
SuppliersPN (SuppliersId, PhoneId)
VALUES (1, 1),
(2, 2),
 (3, 3);

INSERT INTO
ContactsPN (ContactsId, PhoneId)
VALUES (1, 1),
 (2, 2),
 (3, 4);

UPDATE Suppliers SET AddressId = 1 WHERE Id = 1;
UPDATE Suppliers SET AddressId = 2 WHERE Id = 2;
UPDATE Suppliers SET AddressId = 3 WHERE Id = 3;

INSERT INTO
    SuppliersAddresses (SuppliersId, AddressId, AddressTypeId)
VALUES 
    (1, 1, 1),
    (1, 1, 2),
    (1, 4, 3),
    (2, 2, 1),
    (2, 2, 2),
    (2, 2, 3),
    (3, 3, 1);

INSERT INTO
    ContactsAddresses (ContactsId, AddressId, AddressTypeId)
VALUES
    (1, 1, 1);