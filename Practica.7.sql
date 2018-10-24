CREATE PROCEDURE LLamarTodosLibros
AS
SELECT * FROM Libro
EXEC LLamarTodosLibros

CREATE PROCEDURE LLamarTodosAutores2 @Ap_Patt nvarchar(20) 
AS
SELECT * FROM Autor WHERE Ap_Pat = @Ap_Patt
EXEC LLamarTodosAutores2 Ap_Pat = "River"

CREATE PROCEDURE LibroYAutores
AS
SELECT Titulo , Libro.Id_Autor FROM Libro, Autor where 
Libro.Id_Autor = Autor.Id_Autor
EXEC LibroYAutores

CREATE PROCEDURE PrestamoDias
AS
SELECT  Id_Prestamo, Fecha_Prestamo, Fecha_Entrega
FROM Prestamo_Libro
EXEC PrestamoDias

CREATE PROCEDURE DetallePrestamoYLibro
AS
SELECT Id_Prestamo ,  Id_Libro 
FROM Detalle
EXEC DetallePrestamoYLibro

CREATE TRIGGER tr_insert
on Libro 
AFTER INSERT 
AS
BEGIN
select * from Libro
END

create function Mifunction (
@param1 int
) returns table
as
begin
	return 4 + @param1
	end
select Libreria(5) as micloumna