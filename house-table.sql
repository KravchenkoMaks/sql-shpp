CREATE TABLE house
(
    id        BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    street_id BIGINT UNSIGNED NOT NULL,
    number    VARCHAR(64) NOT NULL COMMENT 'Номер дому: 12, 12А, 5/2',
    latitude  DECIMAL(10, 7) NULL  COMMENT 'Широта (WGS84)',
    longitude DECIMAL(10, 7) NULL  COMMENT 'Довгота (WGS84)',
    PRIMARY KEY (id),
    UNIQUE KEY uq_house_street_number (street_id, number),
    CONSTRAINT fk_house_street
        FOREIGN KEY (street_id) REFERENCES street (id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT chk_house_coords CHECK (
        (latitude IS NULL AND longitude IS NULL) OR
        (latitude IS NOT NULL AND longitude IS NOT NULL)
        ),
    CONSTRAINT chk_house_lat CHECK (latitude IS NULL OR latitude BETWEEN -90 AND 90),
    CONSTRAINT chk_house_lon CHECK (longitude IS NULL OR longitude BETWEEN -180 AND 180)
) DEFAULT CHARSET=utf8mb4;
