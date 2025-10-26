CREATE KEYSPACE IF NOT EXISTS sme_notification_keyspace
WITH replication = {
    'class': 'SimpleStrategy',
    'replication_factor': 1
};

USE sme_notification_keyspace;

CREATE TABLE IF NOT EXISTS sme_notifications (
    notification_id UUID PRIMARY KEY,
    to_user_id      UUID,
    from_user_id    UUID,
    event_type      TEXT,
    entity_id       UUID,
    message         TEXT,
    created_at      TIMESTAMP,
    read_flag       BOOLEAN
);

CREATE TABLE IF NOT EXISTS sme_notifications_by_user (
    to_user_id      UUID,
    created_at      TIMESTAMP,
    notification_id UUID,
    from_user_id    UUID,
    event_type      TEXT,
    entity_id       UUID,
    message         TEXT,
    read_flag       BOOLEAN,
    PRIMARY KEY (to_user_id, created_at, notification_id)
) WITH CLUSTERING ORDER BY (created_at DESC);

CREATE TABLE IF NOT EXISTS sme_notifications_by_user_and_entity (
    to_user_id      UUID,
    entity_id       UUID,
    created_at      TIMESTAMP,
    notification_id UUID,
    from_user_id    UUID,
    event_type      TEXT,
    message         TEXT,
    read_flag       BOOLEAN,
    PRIMARY KEY ((to_user_id, entity_id), created_at, notification_id)
) WITH CLUSTERING ORDER BY (created_at DESC);