--Listar alla kontaktpersoner till respektive företag
SELECT
    Suppliers.Name AS Företag,
    Contacts.FirstName || ' ' || Contacts.LastName AS Kontaktperson,
    PhoneNumbers.PNumber AS Telefon,
    EmailAddress.Email AS Epost
FROM
    Contacts
    JOIN Suppliers ON Contacts.SupplierId = Suppliers.Id
    LEFT JOIN ContactsPN ON Contacts.Id = ContactsPN.ContactsId
    LEFT JOIN PhoneNumbers ON ContactsPN.PhoneId = PhoneNumbers.Id
    LEFT JOIN ContactsEmail ON Contacts.Id = ContactsEmail.ContactsId
    LEFT JOIN EmailAddress ON ContactsEmail.EmailId = EmailAddress.Id;

--Listar alla företag med address mm...
SELECT
    Suppliers.Name AS Företag,
    Addresses.AddressLine || ', ' || PostalCodes.PostalCode || ' ' || Cities.City AS Huvudadress,
    PhoneNumbers.PNumber AS Telefon,
    EmailAddress.Email AS Epost
FROM
    Suppliers
    LEFT JOIN Addresses ON Suppliers.AddressId = Addresses.Id
    LEFT JOIN PostalCodes ON Addresses.PostalCodeId = PostalCodes.Id
    LEFT JOIN Cities ON PostalCodes.CityId = Cities.Id
    LEFT JOIN SuppliersPN ON Suppliers.Id = SuppliersPN.SuppliersId
    LEFT JOIN PhoneNumbers ON SuppliersPN.PhoneId = PhoneNumbers.Id
    LEFT JOIN SuppliersEmail ON Suppliers.Id = SuppliersEmail.SuppliersId
    LEFT JOIN EmailAddress ON SuppliersEmail.EmailId = EmailAddress.Id;

--Listar alla produkter där de börjar ta slut i lagert
SELECT
    Ingredients.Name AS Råvara_att_köpa,
    Ingredients.StockQuantity AS Kvar_i_lager_kg,
    Suppliers.Name AS Leverantör,
    Ingredients.PricePerKg AS Senaste_pris_per_kg
FROM
    Ingredients
    JOIN SupplierCatalog ON Ingredients.Id = SupplierCatalog.IngredientId
    JOIN Suppliers ON SupplierCatalog.SupplierId = Suppliers.Id
WHERE
    Ingredients.StockQuantity < 20.0;

--Listar äppelkaka med vilka ingridienser från vilket företag.
SELECT DISTINCT
    Products.Name AS Produkt,
    Ingredients.Name AS Råvara_som_behövs,
    Suppliers.Name AS Leverantör_att_kontakta
FROM
    Products
    JOIN RecipeIngredients ON Products.Id = RecipeIngredients.ProductId
    JOIN Ingredients ON RecipeIngredients.IngredientId = Ingredients.Id
    JOIN SupplierCatalog ON Ingredients.Id = SupplierCatalog.IngredientId
    JOIN Suppliers ON SupplierCatalog.SupplierId = Suppliers.Id
WHERE
    Products.Name = 'Äppelkaka';

--Listar den totala utgifterna
SELECT
    Suppliers.Name AS Leverantör,
    SUM(
        PurchaseLines.StockQuantity * PurchaseLines.PurchasesPrice
    ) AS Totalt_Inköpsbelopp
FROM
    Suppliers
    JOIN Purchases ON Suppliers.Id = Purchases.SupplierId
    JOIN PurchaseLines ON Purchases.Id = PurchaseLines.PurchaseId
GROUP BY
    Suppliers.Name
ORDER BY Totalt_Inköpsbelopp DESC;