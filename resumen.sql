SELECT j.id_jugador lmao, j.nombre pelotudos, posicion paquesirve, e.nombre dedondes_xd, es.nombre dondejuegasapo
FROM jugadores j, jugadoresxequipos je , equipos e , estadios es
WHERE year(j.fecha_nto) > 1995 and j.id_jugador = je.id_jugador and je.id_equipo = e.id_equipo and e.id_estadio = es.codigo 
	and j.id_jugador in (
		select g.id_jugador
		from goles g
)
order by j.nombre desc;