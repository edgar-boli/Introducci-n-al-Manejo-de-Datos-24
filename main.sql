-- Crear la tabla "Restaurantes"
CREATE TABLE Restaurantes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Ubicacion VARCHAR(100) NOT NULL
);

-- Crear la tabla "Comidas"
CREATE TABLE Comidas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    Restaurante_ID INT,
    FOREIGN KEY (Restaurante_ID) REFERENCES Restaurantes(ID) ON DELETE CASCADE
);

-- Insertar registros en la tabla "Restaurantes"
INSERT INTO Restaurantes (Nombre, Ubicacion)
VALUES
('La Cocina Italiana', 'Centro'),
('Sabor Tropical', 'Norte'),
('Delicias del Mar', 'Italiana'),
('Pizza Margarita', 'Sur');

-- Insertar registros en la tabla "Comidas"
INSERT INTO Comidas (Nombre, Tipo, Precio, Restaurante_ID)
VALUES
('Pizza Margarita', 'Italiana', 20.50, 1),
('Lasaña de Carne', 'Italiana', 25.00, 1),
('Arepa de Queso', 'Italiana', 5.00, 2),
('Cazuela de Mariscos', 'Mariscos', 30.00, 3),
('Sancocho de Pescado', 'Mariscos', 18.00, 3);

SELECT * FROM Restaurantes;

SELECT *FROM Comidas;

SELECT Nombre, Tipo, Precio
FROM Comidas
WHERE Precio > 20.00;

SELECT Comidas.Nombre, Comidas.Tipo, Comidas.Precio
FROM Comidas
JOIN Restaurantes ON Comidas.Restaurante_ID = Restaurantes.ID
WHERE Restaurantes.Nombre = 'Delicias del Mar';

SELECT Restaurantes.Nombre, COUNT(Comidas.ID) AS Cantidad_Comidas
FROM Comidas
JOIN Restaurantes ON Comidas.Restaurante_ID = Restaurantes.ID
GROUP BY Restaurantes.Nombre
HAVING Cantidad_Comidas > 1;

UPDATE Comidas
SET Tipo = 'Fusión'
WHERE Nombre = 'Pizza Margarita';

SELECT *FROM Comidas;

DELETE FROM Restaurantes
WHERE Nombre = 'Sabor Tropical';

SELECT *FROM Comidas;
