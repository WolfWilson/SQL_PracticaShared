USE DPersonal

--update personal set personal.UserName = a.usuario
Select personal.AyN, personal.UserName, a.apeynom AyN_from_Personal, a.usuario
from personal join User_name a on substring(a.apeynom,1,6) = substring(personal.AyN,1,6)
where 
personal.UserName is null 
and personal.Activo = 1
and CHARINDEX(' ', personal.AyN) > 0 -- primer espacio en blanco 
and SUBSTRING(personal.AyN, CHARINDEX (' ', personal.AyN) + 1, 7) = SUBSTRING(a.apeynom, CHARINDEX(' ', a.apeynom) + 1, 7) -- caracteres siguientes después del espacio en blanco
--and CHARINDEX(' ', b.AyN) > 0 -- segundo espacio espacio en blanco
--and SUBSTRING(b.AyN, CHARINDEX (' ', b.AyN) + 1, 3) = SUBSTRING(a.apeynom, CHARINDEX(' ', a.apeynom) + 1, 3)

--order by b.AyN


SELECT c.Apeynom, c.usuario from User_name c
where c.Apeynom LIKE 'Barros%'
OR c.Apeynom LIKE 'Santa%%'

SELECT * FROM User_name P
SELECT * FROM personal


/*

USE DPersonal

Select b.AyN, b.UserName, a.apeynom, a.usuario
from personal b 
inner join User_name a on substring(a.apeynom,1,4) = substring(b.AyN,1,4)
where b.UserName is null 
and b.Activo = 1
and CHARINDEX(' ', b.AyN) > 0 -- Encuentra el primer espacio en blanco en AyN
and CHARINDEX(' ', a.apeynom) > 0 -- Encuentra el primer espacio en blanco en apeynom
and SUBSTRING(b.AyN, CHARINDEX(' ', b.AyN) + 1, 2) = SUBSTRING(a.apeynom, CHARINDEX(' ', a.apeynom) + 1, 2) -- Compara caracteres siguientes después del primer espacio en blanco
and CHARINDEX(' ', b.AyN, CHARINDEX(' ', b.AyN) + 1) > 0 -- Encuentra el segundo espacio en blanco en AyN
and CHARINDEX(' ', a.apeynom, CHARINDEX(' ', a.apeynom) + 1) > 0 -- Encuentra el segundo espacio en blanco en apeynom
and SUBSTRING(b.AyN, CHARINDEX(' ', b.AyN, CHARINDEX(' ', b.AyN) + 1) + 1, 2) = SUBSTRING(a.apeynom, CHARINDEX(' ', a.apeynom, CHARINDEX(' ', a.apeynom) + 1) + 1, 2) -- Compara caracteres siguientes después del segundo espacio en blanco
order by b.AyN
*/
