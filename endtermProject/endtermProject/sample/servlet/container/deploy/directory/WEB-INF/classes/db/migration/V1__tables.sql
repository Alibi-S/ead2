create table users(
    user_id       serial not null,
    user_login    varchar(255),
    user_password varchar(255),
    user_balance  double precision
);

alter table users owner to postgres;

create table products(
    product_id       serial not null,
    product_name     varchar(255),
    product_desc     varchar(255),
    product_quantity integer,
    product_price    double precision
);

alter table products owner to postgres;

create table orders(
    order_id     serial not null,
    user_id      serial not null,
    product_id   serial not null,
    user_login   varchar(255),
    product_name varchar(255)
);

alter table orders owner to postgres;