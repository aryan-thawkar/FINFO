CREATE TABLE personal_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT UNIQUE,
    full_name VARCHAR(255),
    parent_name VARCHAR(255),
    department VARCHAR(255),
    current_designation VARCHAR(255),
    date_of_joining DATE,
    date_of_birth DATE,
    gender ENUM('Male','Female','Other'),
    marital_status VARCHAR(50),
    category VARCHAR(50),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE educational_qualifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    qualification_type VARCHAR(100),  -- PhD, MTech, BE, etc.
    year_of_passing INT,
    university VARCHAR(255),
    division VARCHAR(100),
    percentage VARCHAR(50),
    specialization VARCHAR(255),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE teaching_experience (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    college_name VARCHAR(255),
    designation VARCHAR(255),
    date_of_entry DATE,
    date_of_exit DATE,
    years_experience DECIMAL(5,2),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE subjects_taught (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    program_name VARCHAR(255),
    semester VARCHAR(100),
    subject_name VARCHAR(255),
    subject_category VARCHAR(100),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE innovation_projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    level VARCHAR(100),
    project_name VARCHAR(255),
    mentor_role VARCHAR(100),
    rank_awarded VARCHAR(50),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE experimental_setups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    setup_name VARCHAR(255),
    laboratory_name VARCHAR(255),
    expenses DECIMAL(10,2),
    semester VARCHAR(100),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE student_feedback (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    subject_name VARCHAR(255),
    semester VARCHAR(100),
    feedback_score VARCHAR(50),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE patents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    patent_name VARCHAR(255),
    filing_no VARCHAR(255),
    date_published DATE,
    grant_no VARCHAR(255),
    grant_date DATE,
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE journal_roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    role_type VARCHAR(100),
    journal_name VARCHAR(255),
    level VARCHAR(100),
    letter_details VARCHAR(255),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE external_funding (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    agency_name VARCHAR(255),
    agency_type VARCHAR(100),
    amount DECIMAL(12,2),
    year INT,
    letter_details VARCHAR(255),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE consultancy_revenue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    industry_name VARCHAR(255),
    consultancy_type VARCHAR(100),
    amount DECIMAL(12,2),
    year INT,
    letter_details VARCHAR(255),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE phd_scholars (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    scholar_name VARCHAR(255),
    status VARCHAR(100),
    notification_details VARCHAR(255),
    thesis_title VARCHAR(255),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE session_roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    role_type VARCHAR(100),
    conference_name VARCHAR(255),
    mode VARCHAR(50),
    location VARCHAR(100),
    letter_details VARCHAR(255),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE session_roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    role_type VARCHAR(100),
    conference_name VARCHAR(255),
    mode VARCHAR(50),
    location VARCHAR(100),
    letter_details VARCHAR(255),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE resource_person_roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    institute_name VARCHAR(255),
    nirf_rank VARCHAR(100),
    talk_title VARCHAR(255),
    mode ENUM('Online','Offline'),
    year INT,
    letter_details VARCHAR(255),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE fdp_organized (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    title VARCHAR(255),
    mode ENUM('Online','Offline'),
    sponsorship_type VARCHAR(100),
    duration_details VARCHAR(255),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE fdp_attended (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    title VARCHAR(255),
    institute_name VARCHAR(255),
    nirf_rank VARCHAR(100),
    mode ENUM('Online','Offline'),
    duration_details VARCHAR(255),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE mooc_content (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    content_title VARCHAR(255),
    credits INT,
    semester VARCHAR(100),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE swayam_certifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    agency_name VARCHAR(255),
    course_title VARCHAR(255),
    grade VARCHAR(100),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE awards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    level VARCHAR(100),
    organization_type VARCHAR(100),
    award_name VARCHAR(255),
    letter_details VARCHAR(255),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE professional_memberships (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    society_name VARCHAR(255),
    membership_type VARCHAR(100),   -- Yearly / Life
    membership_number VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

CREATE TABLE industry_connect (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profile_id INT,
    industry_name VARCHAR(255),
    outcome_expected TEXT,
    outcome_achieved TEXT,
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);

















