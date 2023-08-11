CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_organizacion`(
    IN id_organ INT,
    IN bussines_name_ VARCHAR(45),
    IN municipality_ VARCHAR(255),
    IN state_ VARCHAR(255),
    IN postal_code_ VARCHAR(5),
    IN cologne_ VARCHAR(255),
    IN street_ VARCHAR(255),
    IN phone_ VARCHAR(10),
    IN email_ VARCHAR(255),
    IN password_ VARCHAR(15)
)
BEGIN
    DECLARE current_email VARCHAR(255);
    DECLARE current_password VARCHAR(255);
    
    /* Obtener el correo y la contraseña actuales */
    SELECT email, password INTO current_email, current_password
    FROM users
    WHERE id = (SELECT user_id FROM organizations WHERE id = id_organ);

    /* Verificar que el correo y la contraseña sean diferentes a los actuales */
    IF current_email <> email_ AND current_password <> password_ THEN
        /* Tabla de organizacion, actualización de datos personales */
        UPDATE organizations
        SET bussines_name = bussines_name_,municipality = municipality_ ,state= state_,postal_code = postal_code_,cologne = cologne_,street = street_,phone = phone_
        WHERE id = id_organ;

        /* Tabla de usuarios, actualización de datos (email, password) */
        UPDATE users
        SET email = email_, password = password_
        WHERE id = (SELECT user_id FROM organizations WHERE id = id_organ);
        commit;

        SELECT 'Actualización exitosa' AS result;
    ELSE
        SELECT 'El correo y la contraseña deben ser diferentes a los actuales' AS result;
    END IF;
END