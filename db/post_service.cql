CREATE KEYSPACE IF NOT EXISTS sme_notification_keyspace
    WITH replication = {
        'class': 'SimpleStrategy',
        'replication_factor': 1
        };
USE sme_post_keyspace;

CREATE TABLE sme_posts
(
    post_id             UUID PRIMARY KEY,
    author_id           UUID,
    type                TEXT,
    root_post_id        UUID,
    content             TEXT,
    visibility          TEXT,
    delete_flag         BOOLEAN,
    created_at          TIMESTAMP,
    updated_at          TIMESTAMP
);

CREATE TABLE sme_posts_by_author (
    author_id           UUID,
    post_id             UUID,
    type                TEXT,
    root_post_id        UUID,
    content             TEXT,
    visibility          TEXT,
    delete_flag         BOOLEAN,
    created_at          TIMESTAMP,
    updated_at          TIMESTAMP,
    PRIMARY KEY ( author_id, created_at, post_id )
) WITH CLUSTERING ORDER BY (created_at DESC );

CREATE TABLE sme_post_media (
    post_id             UUID,
    media_id            UUID,
    media_url           TEXT,
    metadata            MAP<TEXT, TEXT>,
    delete_flag         BOOLEAN,
    created_at          TIMESTAMP,
    updated_at          TIMESTAMP,
    PRIMARY KEY ( post_id, media_id )
);

CREATE TABLE sme_comments (
    comment_id          UUID PRIMARY KEY ,
    post_id             UUID,
    author_id           UUID,
    parent_comment_id   UUID,
    content             TEXT,
    delete_flag         BOOLEAN,
    created_at          TIMESTAMP,
    updated_at          TIMESTAMP
);

CREATE TABLE sme_comments_by_post (
    post_id             UUID,
    author_id           UUID,
    comment_id          UUID,
    content             TEXT,
    parent_comment_id   UUID,
    delete_flag         BOOLEAN,
    created_at          TIMESTAMP,
    updated_at          TIMESTAMP,
    PRIMARY KEY (post_id, created_at, comment_id)
) WITH CLUSTERING ORDER BY (created_at ASC);

CREATE TABLE sme_replies_by_comment (
    parent_comment_id   UUID,
    comment_id          UUID,
    author_id           UUID,
    content             TEXT,
    delete_flag         BOOLEAN,
    created_at          TIMESTAMP,
    updated_at          TIMESTAMP,
    PRIMARY KEY (parent_comment_id, created_at, comment_id)
) WITH CLUSTERING ORDER BY (created_at ASC);


CREATE TABLE sme_comment_media (
    comment_id          UUID,
    media_id            UUID,
    media_url           TEXT,
    metadata            MAP<TEXT, TEXT>,
    delete_flag         BOOLEAN,
    created_at          TIMESTAMP,
    updated_at          TIMESTAMP,
    PRIMARY KEY (comment_id, media_id)
);


CREATE TABLE sme_post_mentions (
    post_id             UUID,
    user_id             UUID,
    start_index         INT,
    end_index           INT,
    PRIMARY KEY (post_id, user_id)
);

CREATE TABLE sme_comment_mentions (
    comment_id          UUID,
    user_id             UUID,
    start_index         INT,
    end_index           INT,
    PRIMARY KEY (comment_id, user_id)
);

CREATE TABLE sme_hashtags (
    tag                 TEXT PRIMARY KEY,
    created_at          TIMESTAMP
);

CREATE TABLE sme_posts_by_hashtag (
    tag                 TEXT,
    created_at          TIMESTAMP,
    post_id             UUID,
    author_id           UUID,
    PRIMARY KEY (tag, created_at, post_id)
) WITH CLUSTERING ORDER BY (created_at DESC);

