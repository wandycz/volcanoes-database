--2
copy country (id, name, continent, area_km2, id_capital)
from 'C:/Ewa/Studia/SQL/Projekt/Projekt/country.csv'
with		
delimiter ',' --separator
header 		-- czy jest nagłówek
csv		--typ pliku
null '';	--co jest nullem


--1
copy capital (name, id)
from 'C:/Ewa/Studia/SQL/Projekt/Projekt/capital.csv'
with		
delimiter ',' --separator
header 		-- czy jest nagłówek
csv		--typ pliku
null '';	--co jest nullem


--4
copy volcano (id, name, id_country, type, activity, id_size)
from 'C:/Ewa/Studia/SQL/Projekt/Projekt/volcano.csv'
with		
delimiter ',' --separator
header 		-- czy jest nagłówek
csv		--typ pliku
null '';	--co jest nullem




--3
copy size (id, name, relative_h)
from 'C:/Ewa/Studia/SQL/Projekt/Projekt/size.csv'
with		
delimiter ',' --separator
header 		-- czy jest nagłówek
csv		--typ pliku
null '';	--co jest nullem


--5
copy vei (id, class, description, plume, ejecta_vol)
from 'C:/Ewa/Studia/SQL/Projekt/Projekt/vei.csv'
with		
delimiter ',' --separator
header 		-- czy jest nagłówek
csv		--typ pliku
null '';	--co jest nullem



--6
copy pyroclast (id, size, name)
from 'C:/Ewa/Studia/SQL/Projekt/Projekt/pyroclast.csv'
with		
delimiter ',' --separator
header 		-- czy jest nagłówek
csv		--typ pliku
null '';	--co jest nullem

--7
copy eruption (id, id_volcano, date, casualties, economic_dmg_dollars, id_vei, id_pyroclast)
from 'C:/Ewa/Studia/SQL/Projekt/Projekt/eruption.csv'
with		
delimiter ',' --separator
header 		-- czy jest nagłówek
csv		--typ pliku
null '';	--co jest nullem



