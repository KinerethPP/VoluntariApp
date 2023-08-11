CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_voluntario`(
    IN id_vol INT,
    IN address_ TEXT,
    IN phone_ VARCHAR(10),
    IN email_ VARCHAR(255),
    IN password_ VARCHAR(255)
)
BEGIN
    DECLARE current_email VARCHAR(255);
    DECLARE current_password VARCHAR(255);

    /* Obtener el correo y la contraseña actuales */
    SELECT email, password INTO current_email, current_password
    FROM users
    WHERE id = (SELECT user_id FROM volunteers WHERE id = id_vol);

    /* Verificar que el correo y la contraseña sean diferentes a los actuales */
    IF current_email <> email_ AND current_password <> password_ THEN
        /* Tabla de voluntarios, actualización de datos personales */
        UPDATE volunteers
        SET address = address_, phone = phone_
        WHERE id = id_vol;

        /* Tabla de usuarios, actualización de datos (email, password) */
        UPDATE users
        SET email = email_, password = password_
        WHERE id = (SELECT user_id FROM volunteers WHERE id = id_vol);
        commit;

        SELECT 'Actualización exitosa' AS result;
    ELSE
        SELECT 'El correo y la contraseña deben ser diferentes a los actuales' AS result;
    END IF;
END