SELECT current_title, 
printf('%16.12e', sp_x),
printf('%16.12e', sp_y),
printf('%16.12e', sp_z)
FROM result 
WHERE step=10
-- AND current_title IN ("jks", "qks");
-- AND current_title IN ("jxc", "qxc");
-- AND current_title IN ("jzero", "qzero");
-- AND current_title IN ("jhart", "qhart");
-- AND current_title IN ("jion", "qion");
AND current_title IN ("jtotal", "qtotal");