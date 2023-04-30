-- İnstagram Clone database : USER AND PHOTOS tables then their relations
-- user  table informations
CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);
-- id will be given by system automatically
INSERT INTO users(username) 
VALUES ('Tobias_Müller'),('JOHN_Fb_1907'),('a.esraguler');
-- see conclusion
select * from instagram_clone.users;
-- instagram actually exist for sharing photos with friends right? let's introduce our photos to system
CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(500) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);
INSERT INTO photos (image_url,user_id) 
VALUES ('https://www.flickr.com/pho/',1),
('https://www.flic',2),
('https://www.flickr.com',3);
select * from photos;

-- comments and likes
CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO  comments (comment_text,user_id,photo_id)
VALUES('You look amazing',2,1),
('du siehst sehr schön aus',3,1),
('güzel görünüyorsun',2,2);

select* from comments;
CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);
select *from likes;
CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);
select *from follows;

CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);
select *from tags;
CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
    );
    select *from photo_tags;
    
INSERT INTO likes(user_id,photo_id) VALUES (1, 1), (1, 2), (1, 3);
INSERT INTO follows(follower_id, followee_id) VALUES (1, 1), (1, 3), (2, 1);
INSERT INTO tags(tag_name) VALUES ('sunset'), ('photography'), ('sunrise');
INSERT INTO photo_tags(photo_id, tag_id) VALUES (1, 3), (3, 2), (2, 3);



