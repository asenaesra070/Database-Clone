-- 1. Finding 5 oldest users OR the newest
 SELECT * FROM instagram_clone.users order by created_at DESC LIMIT 5;
 -- as Day !
 SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM instagram_clone.users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

-- we have lots of table and we can see some of them together :JOIN!
-- THERE are users who would lşke to not share post photos
SELECT username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;


-- here we can also find a person (username) who has the highest likes(count of likes)
select * from likes;
select * from photos;

select username,photos.image_url,photos.id,
count(*) AS total
from photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

-- most popular tag
SELECT tags.tag_name, 
       Count(*) AS total 
FROM   photo_tags 
       JOIN tags 
         ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 
-- having: The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
-- count of num_like which...
SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 