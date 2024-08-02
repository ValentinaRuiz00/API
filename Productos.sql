CREATE DATABASE APIREST; 
USE APIREST


CREATE TABLE Producto (
IdProducto INT IDENTITY PRIMARY KEY,
CodigoBarra VARCHAR(50),
Nombre VARCHAR(70),
Marca VARCHAR(50),
Categoria VARCHAR(50),
Precio Decimal(10,2))

INSERT INTO Producto (CodigoBarra, Nombre, Marca, Categoria, PRECIO) VALUES
('0012345678901', 'Coca-Cola 600ml', 'Coca-Cola', 'Bebidas', 1.50),
('0023456789012', 'iPhone 13', 'Apple', 'Electrónica', 999.99),
('0034567890123', 'Laptop Inspiron 15', 'Dell', 'Computadoras', 799.99),
('0045678901234', 'Leche Descremada 1L', 'La Serenísima', 'Lácteos', 0.90),
('0056789012345', 'Shampoo Head & Shoulders 400ml', 'Procter & Gamble', 'Cuidado Personal', 4.99),
('0067890123456', 'Televisor Samsung 55"', 'Samsung', 'Electrónica', 499.99),
('0078901234567', 'Cereal Corn Flakes 500g', 'Kellogg''s', 'Alimentos', 3.50),
('0089012345678', 'Detergente Ariel 1kg', 'P&G', 'Limpieza', 6.99),
('0090123456789', 'Zapatos Deportivos Air Max', 'Nike', 'Calzado', 120.00),
('0101234567890', 'Juego de Ollas 10 Piezas', 'T-Fal', 'Hogar', 79.99);

SELECT * FROM Producto


--Procedimiento almacenado para listar
CREATE PROCEDURE sp_lista_productos
AS 
BEGIN
	SELECT 
	IdProducto,CodigoBarra,Nombre,
	Marca,Categoria,Precio
	FROM Producto
END

--Procedimiento almacenado para guardar un producto
CREATE PROCEDURE sp_guardar_producto(
@CodigoBarra VARCHAR(50),
@Nombre VARCHAR(70),
@Marca VARCHAR(50),
@Categoria VARCHAR(100),
@Precio DECIMAL(10,2))
AS
BEGIN
	INSERT INTO Producto(CodigoBarra,Nombre,Marca,Categoria,Precio)
	VALUES(@CodigoBarra,@Nombre,@Marca,@Categoria,@Precio)
END

--Procedimiento almacenado para editar un producto
CREATE PROCEDURE sp_editar_producto(
@IdProducto INT,
@CodigoBarra VARCHAR(50) NULL,
@Nombre VARCHAR(70) NULL,
@Marca VARCHAR(50) NULL,
@Categoria VARCHAR(100) NULL,
@Precio DECIMAL(10,2)NULL)
AS
BEGIN
	UPDATE Producto SET 
	CodigoBarra = ISNULL(@CodigoBarra,CodigoBarra),
	Nombre = ISNULL(@Nombre,Nombre),
	Marca = ISNULL(@Marca,Marca),
	Categoria = ISNULL(@Categoria,Categoria),
	Precio = ISNULL(@Precio,Precio)
	WHERE IdProducto = @IdProducto
END

--Procedimiento almacenado para eliminar un producto
CREATE PROCEDURE sp_eliminar_producto(
@IdProducto int)
AS
BEGIN
	DELETE FROM Producto WHERE IdProducto = @IdProducto
END