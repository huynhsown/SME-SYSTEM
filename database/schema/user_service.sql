create table "User"
(
    email       text                                   not null,
    password    text                                   not null,
    "createdAt" timestamp(3) default CURRENT_TIMESTAMP not null,
    "updatedAt" timestamp(3)                           not null,
    phone       text,
    "avtUrl"    text,
    id          serial
        primary key,
    "firstName" text                                   not null,
    "lastName"  text                                   not null,
    "userId"    text                                   not null,
    username    text                                   not null
);

alter table "User"
    owner to db_owner;

create unique index "User_email_key"
    on "User" (email);

create unique index "User_phone_key"
    on "User" (phone);

create unique index "User_userId_key"
    on "User" ("userId");

create unique index "User_username_key"
    on "User" (username);

