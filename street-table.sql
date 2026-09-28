CREATE TABLE street
(
    id   BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    drivable BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (id),
    FULLTEXT KEY ft_street_name (name) WITH PARSER ngram
        COMMENT 'Повнотекстовий пошук за частиною назви (ngram)'
) DEFAULT CHARSET=utf8mb4;



