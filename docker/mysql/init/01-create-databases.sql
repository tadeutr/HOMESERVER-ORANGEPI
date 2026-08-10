CREATE DATABASE IF NOT EXISTS bd_tripoli
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

CREATE DATABASE IF NOT EXISTS bd_ricotradesys
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

GRANT ALL PRIVILEGES ON bd_tripoli.* TO 'admin'@'%';

GRANT ALL PRIVILEGES ON bd_ricotradesys.* TO 'admin'@'%';

FLUSH PRIVILEGES;