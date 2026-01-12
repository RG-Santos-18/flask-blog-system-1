BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "posts" (
	"id"	INTEGER,
	"created"	TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	"title"	TEXT NOT NULL,
	"content"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "posts" ("id","created","title","content") VALUES (1,'2026-01-12 11:04:01','First Post','This is the content of my first blog post.');
INSERT INTO "posts" ("id","created","title","content") VALUES (2,'2026-01-12 11:04:01','Second Post','Here is another exciting piece of content for my blog.');
COMMIT;
