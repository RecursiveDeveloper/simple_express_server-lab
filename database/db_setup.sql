CREATE DATABASE IF NOT EXISTS `full-stackdb`;
USE `full-stackdb`;

-- Recreate only the tables managed by this setup script.
DROP TABLE IF EXISTS quality_assurance;
DROP TABLE IF EXISTS cloudops;
DROP TABLE IF EXISTS mobile;
DROP TABLE IF EXISTS backend;
DROP TABLE IF EXISTS frontend;
DROP TABLE IF EXISTS devops;
DROP TABLE IF EXISTS tools;

-- Canonical tool catalog. A tool used by multiple areas is stored only once.
CREATE TABLE tools (
    tool_id SMALLINT UNSIGNED NOT NULL,
    tool_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (tool_id),
    UNIQUE KEY uq_tools_tool_name (tool_name)
) ENGINE = InnoDB;

-- Each area table contains eight tool references. Sharing a tool_id across
-- area tables creates the many-to-many relationship for transversal tools.
CREATE TABLE devops (
    tool_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (tool_id),
    CONSTRAINT fk_devops_tool
        FOREIGN KEY (tool_id) REFERENCES tools (tool_id)
) ENGINE = InnoDB;

CREATE TABLE frontend (
    tool_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (tool_id),
    CONSTRAINT fk_frontend_tool
        FOREIGN KEY (tool_id) REFERENCES tools (tool_id)
) ENGINE = InnoDB;

CREATE TABLE backend (
    tool_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (tool_id),
    CONSTRAINT fk_backend_tool
        FOREIGN KEY (tool_id) REFERENCES tools (tool_id)
) ENGINE = InnoDB;

CREATE TABLE mobile (
    tool_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (tool_id),
    CONSTRAINT fk_mobile_tool
        FOREIGN KEY (tool_id) REFERENCES tools (tool_id)
) ENGINE = InnoDB;

CREATE TABLE cloudops (
    tool_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (tool_id),
    CONSTRAINT fk_cloudops_tool
        FOREIGN KEY (tool_id) REFERENCES tools (tool_id)
) ENGINE = InnoDB;

CREATE TABLE quality_assurance (
    tool_id SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (tool_id),
    CONSTRAINT fk_quality_assurance_tool
        FOREIGN KEY (tool_id) REFERENCES tools (tool_id)
) ENGINE = InnoDB;

INSERT INTO tools (tool_id, tool_name) VALUES
    (1, 'Git'),
    (2, 'Docker'),
    (3, 'Kubernetes'),
    (4, 'Jenkins'),
    (5, 'GitHub Actions'),
    (6, 'Terraform'),
    (7, 'Ansible'),
    (8, 'Prometheus'),
    (9, 'HTML'),
    (10, 'CSS'),
    (11, 'JavaScript'),
    (12, 'TypeScript'),
    (13, 'React'),
    (14, 'Vue.js'),
    (15, 'Vite'),
    (16, 'Node.js'),
    (17, 'Python'),
    (18, 'Java'),
    (19, 'Spring Boot'),
    (20, 'PostgreSQL'),
    (21, 'React Native'),
    (22, 'Flutter'),
    (23, 'Dart'),
    (24, 'Kotlin'),
    (25, 'Swift'),
    (26, 'Amazon Web Services'),
    (27, 'Microsoft Azure'),
    (28, 'Google Cloud'),
    (29, 'Selenium'),
    (30, 'Cypress'),
    (31, 'Playwright'),
    (32, 'Apache JMeter');

INSERT INTO devops (tool_id) VALUES
    (1), (2), (3), (4), (5), (6), (7), (8);

INSERT INTO frontend (tool_id) VALUES
    (1), (9), (10), (11), (12), (13), (14), (15);

INSERT INTO backend (tool_id) VALUES
    (1), (11), (12), (16), (17), (18), (19), (20);

INSERT INTO mobile (tool_id) VALUES
    (1), (11), (12), (21), (22), (23), (24), (25);

INSERT INTO cloudops (tool_id) VALUES
    (1), (2), (3), (6), (8), (26), (27), (28);

INSERT INTO quality_assurance (tool_id) VALUES
    (1), (11), (12), (17), (29), (30), (31), (32);
