DELETE FROM "entry_tags";
DELETE FROM "dream_tags";
DELETE FROM "dream_entries";
DELETE FROM "users";


INSERT INTO users (username, email, password_hash, bio, privacy_default, role, created_at, updated_at)
VALUES
('alice', 'alice@example.com', 'hashed_password_1', 'Loves hiking and nature.', 'public', 'USER', NOW(), NOW()),
('bob', 'bob@example.com', 'hashed_password_2', 'Backend developer.', 'private', 'ADMIN', NOW(), NOW()),
('carol', 'carol@example.com', 'hashed_password_3', 'Bookworm and writer.', 'friends_only', 'USER', NOW(), NOW()),
('dave', 'dave@example.com', 'hashed_password_4', 'Coffee addict.', 'public', 'USER', NOW(), NOW()),
('eve', 'eve@example.com', 'hashed_password_5', 'Cybersecurity enthusiast.', 'private', 'USER', NOW(), NOW()),
('frank', 'frank@example.com', 'hashed_password_6', 'Travel blogger.', NULL, 'USER', NOW(), NOW()),
('grace', 'grace@example.com', 'hashed_password_7', NULL, 'friends_only', 'USER', NOW(), NOW()),
('heidi', 'heidi@example.com', 'hashed_password_8', 'Gamer and streamer.', 'public', 'USER', NOW(), NOW()),
('ivan', 'ivan@example.com', 'hashed_password_9', 'DevOps engineer.', NULL, 'ADMIN', NOW(), NOW()),
('judy', 'judy@example.com', 'hashed_password_10', 'Designer and artist.', 'private', 'USER', NOW(), NOW());


INSERT INTO dream_entries (user_id, title, content, privacy_setting, emotion_score, is_lucid, created_at, updated_at)
VALUES
(1, 'Flying Over the City', 'I was soaring through a futuristic city, touching skyscrapers as I flew.', '{"visibility": "friends_only"}', 8, TRUE, NOW(), NOW()),
(1, 'Chased by Shadows', 'Dark figures chased me through a forest. I felt fear but also thrill.', '{"visibility": "private"}', 3, FALSE, NOW(), NOW()),
(1, 'Ocean of Stars', 'I swam through an ocean where stars floated like jellyfish.', '{"visibility": "public"}', 9, TRUE, NOW(), NOW()),
(1, 'Lost in School', 'Back in my high school, couldn’t find my classroom. Felt embarrassed.', '{"visibility": "private"}', 2, FALSE, NOW(), NOW()),
(1, 'Talking Cat', 'A large tabby cat spoke to me in riddles and guided me through a maze.', '{"visibility": "friends_only"}', 6, TRUE, NOW(), NOW()),
(1, 'Endless Staircase', 'I kept climbing stairs that never ended, always arriving at the same door.', '{"visibility": "private"}', 4, FALSE, NOW(), NOW()),
(1, 'Rain of Fire', 'Fireballs fell from the sky while I took shelter in a glass dome.', '{"visibility": "public"}', 7, FALSE, NOW(), NOW()),
(1, 'Meeting My Future Self', 'I talked to an older version of myself who warned me about a decision.', '{"visibility": "friends_only"}', 5, TRUE, NOW(), NOW()),
(1, 'Underwater City', 'Exploring ruins deep in the ocean with glowing fish and giant statues.', '{"visibility": "public"}', 8, TRUE, NOW(), NOW()),
(1, 'Time Loop', 'Every time I woke up, the same dream began again. Couldn’t escape.', '{"visibility": "private"}', 3, FALSE, NOW(), NOW());



INSERT INTO dream_tags (name, description) VALUES
('#flying', 'Dreams involving flying or levitation'),
('#nightmare', 'Frightening or disturbing dreams'),
('#lucid', 'Dreams where the dreamer is aware they are dreaming'),
('#symbolic', 'Dreams rich with metaphors or symbols'),
('#repeating', 'Dreams that repeat in theme or content');


-- Dream 1: Flying dream
INSERT INTO entry_tags (entry_id, tag_id) VALUES
(1, 1), -- #flying
(1, 3); -- #lucid

-- Dream 2: Nightmare
INSERT INTO entry_tags (entry_id, tag_id) VALUES
(2, 2); -- #nightmare

-- Dream 3: Symbolic and Lucid
INSERT INTO entry_tags (entry_id, tag_id) VALUES
(3, 4), -- #symbolic
(3, 3); -- #lucid

-- Dream 4: Nightmare and Repeating
INSERT INTO entry_tags (entry_id, tag_id) VALUES
(4, 2), -- #nightmare
(4, 5); -- #repeating

-- Dream 5: Symbolic
INSERT INTO entry_tags (entry_id, tag_id) VALUES
(5, 4); -- #symbolic

-- Dream 6: Repeating
INSERT INTO entry_tags (entry_id, tag_id) VALUES
(6, 5); -- #repeating

-- Dream 7: Nightmare
INSERT INTO entry_tags (entry_id, tag_id) VALUES
(7, 2); -- #nightmare

-- Dream 8: Lucid
INSERT INTO entry_tags (entry_id, tag_id) VALUES
(8, 3); -- #lucid

-- Dream 9: Flying and Symbolic
INSERT INTO entry_tags (entry_id, tag_id) VALUES
(9, 1), -- #flying
(9, 4); -- #symbolic

-- Dream 10: Repeating and Nightmare
INSERT INTO entry_tags (entry_id, tag_id) VALUES
(10, 5), -- #repeating
(10, 2); -- #nightmare


INSERT INTO friendships (user1_id, user2_id, status) VALUES
(1, 2, 'accepted'),
(1, 3, 'accepted'),
(1, 4, 'pending'),
(2, 5, 'accepted'),
(3, 6, 'accepted'),
(3, 7, 'blocked'),
(4, 5, 'accepted'),
(5, 6, 'accepted'),
(6, 7, 'pending'),
(8, 1, 'accepted'),
(9, 2, 'accepted'),
(10, 1, 'blocked');


INSERT INTO comments (entry_id, user_id, content, created_at, updated_at) VALUES
(1, 2, 'This is so vivid! I had a similar flying dream.', now(), now()),
(1, 3, 'Lucid dreams are the best!', now(), now()),
(2, 4, 'That sounds terrifying. Hope you’re okay!', now(), now()),
(3, 5, 'Interesting symbols—maybe they mean something?', now(), now()),
(4, 6, 'I get repeating dreams like this too.', now(), now());


INSERT INTO reactions (entry_id, user_id, content, created_at, updated_at) VALUES
(1, 4, '❤️', now(), now()),
(1, 5, '😮', now(), now()),
(2, 6, '😱', now(), now()),
(3, 7, '💭', now(), now()),
(4, 8, '🔁', now(), now()),
(5, 9, '👍', now(), now());



