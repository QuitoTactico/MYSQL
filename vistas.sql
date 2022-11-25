-- es CREATE al principio, pero luego no me dejaba cambiarlo XD 
ALTER VIEW goles_de_jugadores as
	select j.id_jugador, nombre , count(g.id_jugador) n_goles
	from jugadores j left join goles g
	on j.id_jugador = g.id_jugador
	group by j.id_jugador
	order by n_goles desc;

select *
from goles_de_jugadores
order by id_jugador desc;