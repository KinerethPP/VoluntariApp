CREATE DEFINER=`root`@`localhost` PROCEDURE `div_volunteer`(
email_n varchar(45),password_n varchar(45),enable_n tinyint,role_n int,name_n varchar(255),
surname_n varchar(255),lastanme_n varchar(255),birthday_n date,address_n text,phone_n varchar(10),
curp_n varchar(18))
BEGIN 
	DECLARE created_user INT;
	START TRANSACTION;
	insert users (email,password,enable,role_id) values (email_n,password_n,enable_n,role_n);
	SELECT LAST_INSERT_ID() INTO created_user;
	insert volunteers(name,surname,lastanme,birthday,address,phone,curp,user_id) 
    values (name_n ,surname_n ,lastanme_n ,birthday_n ,address_n ,phone_n ,curp_n , created_user);
	COMMIT;
END