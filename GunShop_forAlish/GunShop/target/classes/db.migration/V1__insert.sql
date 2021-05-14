
CREATE TABLE users (
    user_id serial,
    user_login varchar(255),
    user_password varchar(255),
    user_balance float,
);

INSERT INTO users (user_login, user_password, user_balance) VALUES ('Alibi', '1234', 12000.40);
INSERT INTO users (user_login, user_password, user_balance) VALUES ('Admin', '1234', 4343.2);
INSERT INTO users (user_login, user_password, user_balance) VALUES ('NeAdmin', '1234', 1132.21);