-- users
CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(username)
);

-- permissions
CREATE TABLE permissions
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE(name)
);


-- users_permissions
CREATE TABLE users_permissions
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id),
    permission_id INTEGER NOT NULL REFERENCES permissions(id),
    UNIQUE(user_id, permission_id)
);

-- phone_numbers
CREATE TABLE phone_numbers
(
    id SERIAL PRIMARY KEY,
    "number" VARCHAR(20) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE("number")
);

-- DATA

-- easypay has all the permission
-- dumb has only check permission
-- both have password 1234

INSERT INTO users (username, password) VALUES ('easypay', '$2a$10$RkPPOOI837gFVjjrDWpTv.qJUd8ytpiVZiD85B776cqflHmu4TeAe');
INSERT INTO users (username, password) VALUES ('dumb', '$2a$10$RkPPOOI837gFVjjrDWpTv.qJUd8ytpiVZiD85B776cqflHmu4TeAe');

INSERT INTO permissions (name) VALUES ('phones/add');
INSERT INTO permissions (name) VALUES ('phones/remove');
INSERT INTO permissions (name) VALUES ('phones/check');

INSERT INTO users_permissions (user_id, permission_id) VALUES (1, 1);
INSERT INTO users_permissions (user_id, permission_id) VALUES (1, 2);
INSERT INTO users_permissions (user_id, permission_id) VALUES (1, 3);
INSERT INTO users_permissions (user_id, permission_id) VALUES (2, 3);

INSERT INTO phone_numbers ("number") VALUES ('+79118392014');
INSERT INTO phone_numbers ("number") VALUES ('+340435235466');
