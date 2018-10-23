Select Nom_Autor + ' ' + Ap_Pat + ' ' + Ap_Mat as 'Nombre completo'
from Autor
use Libreria

select  Nom_Gen + ' y ' + Nom_SubGen as 'Composicion de generos'
from Genero, SubGenero


select Fecha_Prestamo, Fecha_Entrega as 'Tiempo de prestamo'
from Prestamo_Libro

use Libreria

Select top 3 * from Autor

Select * 
from  Autor group by '%A'

Select * 
from Genero
join Autor on Id_Genero = Id_Autor

/*inner join */
select Libro.Id_Libro, Autor.Id_Autor
from Libro
inner join Autor on Libro.Id_Autor= Autor.Id_Autor

/*lef join*/
select Titulo, Id_Libro, Id_Editorial
from Libro
left join Editorial on Libro.Id_Editorial = Editorial.IdEditorial

/*right join */
select Nom_Editorial, Id_Editorial
from Editorial
right join Libro on Editorial.IdEditorial = Libro.Id_Editorial
order by Nom_Editorial

/*full join*/
select Autor.Nom_Autor, Libro.Id_Autor
from Autor
full outer join Libro on Autor.Id_Autor=Libro.Id_Autor
order by Autor.Nom_Autor

select Nom_Editorial, Id_Editorial
from Editorial
right join Libro on Editorial.IdEditorial = Libro.Id_Editorial
where Nom_Editorial like 'A%' order by Id_Editorial


Select *
from Genero
where Nom_Gen like 'D%'




/* tabla del maestro de su base
select * from clientes join tlefenosdeclientes on clientes.id = telefonosdeclientes.idcliente 

 slect * from clientes c left join telfeconosdelcientes tc on c.id = tc.cliente
where c.rfc like 'X%'

 select count (c.id)
from clientes c
left join telfeonosdeclientes tc on c.id = tc.cliente
where tc.id is null 
select c.iddreccion, count (c.id)
from clientes c
left join telfenosdeclietnes tc on c.id = tc.cliente
grupo by iddireccion 
having count (c.id) > 1
order by count (c.id) desc*/