select nombre , count(g.id_jugador) n_goles
from jugadores j left join goles g
on j.id_jugador = g.id_jugador
group by j.id_jugador
order by n_goles desc;