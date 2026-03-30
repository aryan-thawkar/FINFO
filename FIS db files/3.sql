-- Migration to recreate research_publications table with new fields
-- Run this SQL script in your MySQL database

-- WARNING: This will delete all existing research publications data!
-- If you want to keep your data, export it first.

-- Drop the existing table
DROP TABLE IF EXISTS research_publications;

-- Create the table with all fields including new ones
CREATE TABLE research_publications (
  id INT AUTO_INCREMENT PRIMARY KEY,
  profile_id INT NOT NULL,
  title TEXT NOT NULL,
  authors TEXT,
  journal_name VARCHAR(255),
  publication_year INT,
  doi VARCHAR(255),
  publisher VARCHAR(255),
  type VARCHAR(100) COMMENT 'journal-article, proceedings-article, book-chapter, etc.',
  category VARCHAR(50) DEFAULT 'other' COMMENT 'journal, conference, book-chapter, other',
  issn VARCHAR(100) DEFAULT NULL COMMENT 'ISSN number',
  url TEXT DEFAULT NULL COMMENT 'DOI URL or publication URL',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
