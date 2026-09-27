CREATE TABLE street
(
    id   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(120) NOT NULL,
    drivable BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (id),
    UNIQUE KEY uq_street_name_city (name, city),
    FULLTEXT KEY ft_street_name (name) WITH PARSER ngram
        COMMENT 'Повнотекстовий пошук за частиною назви (ngram)'
) DEFAULT CHARSET=utf8mb4;



