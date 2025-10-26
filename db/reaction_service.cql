CREATE KEYSPACE IF NOT EXISTS sme_reaction_keyspace
    WITH replication = {
        'class': 'SimpleStrategy',
        'replication_factor': 1
        };

USE sme_reaction_keyspace;

CREATE TABLE sme_post_reaction
(
    post_id       UUID,
    user_id       UUID,
    reaction_type TEXT, // "like", "love", "haha", "angry", "sad"
    created_at    TIMESTAMP,
    primary key ( post_id, user_id )
);

CREATE TABLE sme_post_reaction_counts
(
    post_id       UUID,
    reaction_type TEXT,
    count         COUNTER,
    PRIMARY KEY (post_id, reaction_type)
);

CREATE TABLE sme_comment_reactions
(
    comment_id    UUID,
    user_id       UUID,
    reaction_type TEXT,
    created_at    TIMESTAMP,
    PRIMARY KEY (comment_id, user_id)
);

CREATE TABLE sme_comment_reaction_counts
(
    comment_id    UUID,
    reaction_type TEXT,
    count         COUNTER,
    PRIMARY KEY (comment_id, reaction_type)
);

