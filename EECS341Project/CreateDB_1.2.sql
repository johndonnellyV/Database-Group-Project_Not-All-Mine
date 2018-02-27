CREATE TABLE Subreddit (
    subreddit VARCHAR(24) NOT NULL,
    banner_link VARCHAR(200),
    logo_link VARCHAR(200),
    users_online INTEGER,
    subscribers INTEGER,
    PRIMARY KEY (subreddit)
);
           
CREATE TABLE User (
    username VARCHAR(24) NOT NULL,
    link_karma INTEGER,
    comment_karma INTEGER,
    PRIMARY KEY (username)
);

CREATE TABLE Post (
    post_id VARCHAR(24) NOT NULL,
    title VARCHAR(480),
    post_type VARCHAR(120),
    subreddit VARCHAR(24) NOT NULL,
    username VARCHAR(24) NOT NULL,
    #stacked BOOLEAN,
    gilded BOOLEAN,
    upvotes INTEGER,
    text VARCHAR(10000),
    PRIMARY KEY (post_id),
    FOREIGN KEY (subreddit)
        REFERENCES Subreddit (subreddit),
    FOREIGN KEY (username)
        REFERENCES User (username)
);

CREATE TABLE Comment (
    comment_id VARCHAR(24) NOT NULL,
    post_id VARCHAR(24) NOT NULL,
    username VARCHAR(24) NOT NULL,
    gilded BOOLEAN,
    upvotes INTEGER,
    text VARCHAR(10000),
    PRIMARY KEY (comment_id),
    FOREIGN KEY (post_id)
        REFERENCES Post (post_id),
    FOREIGN KEY (username)
        REFERENCES User (username)
);


CREATE TABLE Trophy (
    name VARCHAR(48) NOT NULL,
    icon VARCHAR(300),
    PRIMARY KEY (name)
);

CREATE TABLE Subscribes (
    subreddit VARCHAR(24) NOT NULL,
    username VARCHAR(24) NOT NULL,
    PRIMARY KEY (username , subreddit),
    FOREIGN KEY (username)
        REFERENCES User (username),
    FOREIGN KEY (subreddit)
        REFERENCES Subreddit (subreddit)
);

CREATE TABLE UserTrophies (
    username VARCHAR(24) NOT NULL,
    trophy_name VARCHAR(48) NOT NULL,
    PRIMARY KEY (username , trophy_name),
    FOREIGN KEY (username)
        REFERENCES User (username),
    FOREIGN KEY (trophy_name)
        REFERENCES Trophy (name)
);


CREATE TABLE Moderator (
    username VARCHAR(24) NOT NULL,
    subreddit VARCHAR(24) NOT NULL,
    PRIMARY KEY (username , subreddit),
    FOREIGN KEY (username)
        REFERENCES User (username),
    FOREIGN KEY (subreddit)
        REFERENCES Subreddit (subreddit)
);

