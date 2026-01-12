
DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    title TEXT NOT NULL,
    content TEXT NOT NULL
);

INSERT INTO posts (title, content) VALUES ('First Post', 'This is the content of my first blog post.');
INSERT INTO posts (title, content) VALUES ('Second Post', 'Here is another exciting piece of content for my blog.');