USE faculty_information_system;

CREATE TABLE educational_qualifications (
  id INT AUTO_INCREMENT PRIMARY KEY,
  profile_id INT NOT NULL,
  degree VARCHAR(100),
  university VARCHAR(150),
  year_of_passing INT,
  percentage DECIMAL(5,2),
  FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE research_publications (
  id INT AUTO_INCREMENT PRIMARY KEY,
  profile_id INT NOT NULL,
  title TEXT,
  authors TEXT,
  journal_name VARCHAR(255),
  publication_year INT,
  doi VARCHAR(255),
  publisher VARCHAR(255),
  type VARCHAR(100),
  FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);
