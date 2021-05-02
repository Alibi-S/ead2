CREATE TABLE Comment (
    comment_id serial,
    comment_content varchar(255),
    post_id int,
    comment_username varchar(255)
);