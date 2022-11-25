select nombre , descripcion 
from jugadores left join goles
on jugadores.id_jugador = goles.id_jugador
order by descripcion asc;