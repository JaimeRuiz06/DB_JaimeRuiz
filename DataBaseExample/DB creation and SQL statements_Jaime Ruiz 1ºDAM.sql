CREATE DATABASE IF NOT EXISTS gaming_platformDB;
USE gaming_platformDB;

-- Table: users
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    nick VARCHAR(255) NOT NULL,
    login VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    birthdate DATE
);

-- Table: games
CREATE TABLE IF NOT EXISTS games (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    rules TEXT
);

-- Table: avatars
CREATE TABLE IF NOT EXISTS avatars (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    appearance TEXT,
    level INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE
);

-- Table: matches
CREATE TABLE IF NOT EXISTS matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    game_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    password VARCHAR(255),
    created_at DATE NOT NULL,
    status VARCHAR(255),
    creator_avatar_id INT,
    FOREIGN KEY (game_id) REFERENCES games(id) ON DELETE CASCADE,
    FOREIGN KEY (creator_avatar_id) REFERENCES avatars(id) ON DELETE CASCADE
);

-- Table: match_participants
CREATE TABLE IF NOT EXISTS match_participants (
    match_id INT NOT NULL,
    avatar_id INT NOT NULL,
    PRIMARY KEY (match_id, avatar_id),
    FOREIGN KEY (match_id) REFERENCES matches(id) ON DELETE CASCADE,
    FOREIGN KEY (avatar_id) REFERENCES avatars(id) ON DELETE CASCADE
);

-- Table: confrontations
CREATE TABLE IF NOT EXISTS confrontations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT NOT NULL,
    avatar1_id INT NOT NULL,
    avatar2_id INT NOT NULL,
    result VARCHAR(255),
    FOREIGN KEY (match_id) REFERENCES matches(id) ON DELETE CASCADE,
    FOREIGN KEY (avatar1_id) REFERENCES avatars(id) ON DELETE CASCADE,
    FOREIGN KEY (avatar2_id) REFERENCES avatars(id) ON DELETE CASCADE
);
