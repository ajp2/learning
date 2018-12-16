PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  PRIMARY KEY (user_id, question_id),

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  reply_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (reply_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  PRIMARY KEY (user_id, question_id),

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Testing', 'DB1'),
  ('Testing', 'DB2');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('FirstQ', 'Testing123', (SELECT id FROM users WHERE lname = 'DB1')),
  ('SecondQ', 'Testing456', (SELECT id FROM users WHERE lname = 'DB2'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE lname = 'DB1'), (SELECT id FROM questions WHERE title = 'FirstQ')),
  ((SELECT id FROM users WHERE lname = 'DB1'), (SELECT id FROM questions WHERE title = 'SecondQ')),
  ((SELECT id FROM users WHERE lname = 'DB2'), (SELECT id FROM questions WHERE title = 'SecondQ'));

INSERT INTO
  replies (question_id, user_id, body)
VALUES
  ((SElECT id FROM questions WHERE title = 'FirstQ'), (SELECT id FROM users WHERE lname = 'DB1'), 'replying to q'),
  ((SElECT id FROM questions WHERE title = 'FirstQ'), (SELECT id FROM users WHERE lname = 'DB2'), 'another reply to q');
  
INSERT INTO
  replies (question_id, reply_id, user_id, body)
VALUES
  ((SElECT id FROM questions WHERE title = 'FirstQ'),
    (SELECT id FROM replies WHERE body = 'replying to q'),
    (SELECT id FROM users WHERE lname = 'DB2'),
    'replying to first reply');

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE lname = 'DB1'), (SELECT id FROM questions WHERE title = 'FirstQ')),
  ((SELECT id FROM users WHERE lname = 'DB1'), (SELECT id FROM questions WHERE title = 'SecondQ')),
  ((SELECT id FROM users WHERE lname = 'DB2'), (SELECT id FROM questions WHERE title = 'SecondQ'));