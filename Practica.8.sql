CREATE TRIGGER tr_insert
on Libro 
AFTER INSERT 
AS
BEGIN
select * from Libro
END

CREATE TRIGGER tr_delete
on Usuarios
AFTER DELETE
AS
BEGIN
select * from Usuarios
END

CREATE TRIGGER tr_update
on Usuarios
AFTER UPDATE
AS 
BEGIN
select * from Usuarios
END

CREATE TRIGGER tr_insertInstead
on Usuarios
INSTEAD OF INSERT
AS
PRINT 'In the instead-of Trigger'

DROP TRIGGER tr_insertInstead

Use Libreria