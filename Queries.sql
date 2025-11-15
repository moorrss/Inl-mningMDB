SELECT
    s.Name AS Leverantör,
    a.AddressLine || ', ' || p.PostalCode || ' ' || c.City AS Huvudadress,

    GROUP_CONCAT(DISTINCT pn.PNumber) AS Telefonnummer,
    GROUP_CONCAT(DISTINCT ea.Email) AS Epostadresser
FROM Suppliers s
LEFT JOIN Addresses a ON s.AddressId = a.Id
LEFT JOIN PostalCodes p ON a.PostalCodeId = p.Id
LEFT JOIN Cities c ON p.CityId = c.Id
LEFT JOIN SuppliersPN spn ON s.Id = spn.SuppliersId
LEFT JOIN PhoneNumbers pn ON spn.PhoneId = pn.Id
LEFT JOIN SuppliersEmail sem ON s.Id = sem.SuppliersId
LEFT JOIN EmailAddress ea ON sem.EmailId = ea.Id
GROUP BY s.Id, s.Name, Huvudadress;

SELECT
    s.Name AS Leverantör,
    c.FirstName || ' ' || c.LastName AS Kontaktperson,
    GROUP_CONCAT(DISTINCT pn.PNumber) AS Telefon,
    GROUP_CONCAT(DISTINCT ea.Email) AS Epost
FROM Contacts c
JOIN Suppliers s ON c.SupplierId = s.Id
LEFT JOIN ContactsPN cpn ON c.Id = cpn.ContactsId
LEFT JOIN PhoneNumbers pn ON cpn.PhoneId = pn.Id
LEFT JOIN ContactsEmail cem ON c.Id = cem.ContactsId
LEFT JOIN EmailAddress ea ON cem.EmailId = ea.Id
GROUP BY s.Name, Kontaktperson
ORDER BY s.Name;

SELECT
    s.Name AS Leverantör,
    i.ItemNumber AS Artikelnummer,
    i.Name AS Råvara,
    i.PricePerKg AS Pris_per_Kg
FROM Suppliers s
JOIN SupplierCatalog sc ON s.Id = sc.SupplierId
JOIN Ingredients i ON sc.IngredientId = i.Id
ORDER BY s.Name, i.Name;

SELECT
    p.Name AS Produkt,
    i.Name AS Råvara,
    ri.StockQuantity AS Mängd_i_recept
FROM Products p
JOIN RecipeIngredients ri ON p.Id = ri.ProductId
JOIN Ingredients i ON ri.IngredientId = i.Id
ORDER BY p.Name, i.Name;

SELECT
    ItemNumber AS Artikelnummer,
    Name AS Råvara,
    PricePerKg AS Pris_per_Kg
FROM Ingredients
ORDER BY Name;

SELECT
    Name AS Råvara,
    StockQuantity AS Lagerkvantitet_kg,
    ItemNumber AS Artikelnummer
FROM Ingredients
ORDER BY Lagerkvantitet_kg ASC;

SELECT
    p.Date AS Inköpsdatum,
    s.Name AS Leverantör,
    i.Name AS Råvara,
    pl.StockQuantity AS Inköpt_Kvantitet_kg,
    pl.PurchasesPrice AS Inköpspris_per_kg
FROM Purchases p
JOIN Suppliers s ON p.SupplierId = s.Id
JOIN PurchaseLines pl ON p.Id = pl.PurchaseId
JOIN Ingredients i ON pl.IngredientId = i.Id
ORDER BY p.Date DESC;