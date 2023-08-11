CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateEvent`(
    IN eventName VARCHAR(45),
    IN eventDate DATE,
    IN eventTime TIME,
    IN eventDescription TEXT,
    IN eventStreet VARCHAR(45),
    IN eventCologne VARCHAR(45),
    IN eventPostalCode VARCHAR(45),
    IN eventMunicipality VARCHAR(45),
    IN eventState VARCHAR(45),
    IN userId INT,
    IN organizationId INT,
    IN category_ VARCHAR(45)
)
BEGIN
    INSERT INTO events (
        name,
        event_date,
        event_time,
        description,
        street,
        cologne,
        postal_code,
        municypaly,
        state,
        user_id,
        organization_id,
        category
    )
    VALUES (
        eventName,
        eventDate,
        eventTime,
        eventDescription,
        eventStreet,
        eventCologne,
        eventPostalCode,
        eventMunicipality,
        eventState,
        userId,
        organizationId,
        category_
    );
END