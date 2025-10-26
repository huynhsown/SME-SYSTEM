CREATE KEYSPACE IF NOT EXISTS sme_reaction_keyspace
    WITH replication = {
        'class': 'SimpleStrategy',
        'replication_factor': 1
    };

USE sme_reaction_keyspace;

CREATE TABLE sme_reactions (
    target_id     UUID,
    target_type   TEXT,
    user_id       UUID,
    reaction_type TEXT,
    created_at    TIMESTAMP,
    PRIMARY KEY ((target_id, target_type), user_id)
);

CREATE TABLE sme_reaction_counts (
    target_id     UUID,
    target_type   TEXT,
    reaction_type TEXT,
    count         INT,
    PRIMARY KEY ((target_id, target_type), reaction_type)
);
