CREATE VIEW top_2_hits_do_momento AS
SELECT S.song_name AS cancao , COUNT(LH.song_id) as reproducoes FROM songs AS S
INNER JOIN listenning_history AS LH ON S.song_id = LH.song_id
GROUP BY cancao ORDER BY reproducoes DESC LIMIT 2;
