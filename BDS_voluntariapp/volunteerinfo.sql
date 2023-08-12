CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `volunteerinfo` AS
    SELECT 
        `v`.`id` AS `id_volun`,
        `v`.`name` AS `v_name`,
        `v`.`surname` AS `surname`,
        `v`.`lastanme` AS `lastanme`,
        `v`.`birthday` AS `birthday`,
        `v`.`address` AS `address`,
        `v`.`phone` AS `phone`,
        `v`.`curp` AS `curp`,
        `v`.`user_id` AS `user_id`,
        `u`.`id` AS `id_user`,
        `u`.`email` AS `email`,
        `u`.`enable` AS `enable`,
        `u`.`role_id` AS `role_id`
    FROM
        (`volunteers` `v`
        JOIN `users` `u` ON ((`v`.`user_id` = `u`.`id`)))