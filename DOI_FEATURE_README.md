# DOI Fetching Feature for Research Publications

## Overview
This feature allows faculty members to add research publications by entering a DOI (Digital Object Identifier). The system automatically fetches metadata from the DOI and categorizes publications as:
- 📰 Journal Articles
- 🎤 Conference Papers
- 📚 Book Chapters
- 📄 Other Publications

## Database Migration

**IMPORTANT:** Before using this feature, you must update your database schema.

### Run the SQL Migration

**⚠️ WARNING: This will delete all existing research publications data! Export your data first if you want to keep it.**

1. Open your MySQL client or command line
2. Select your database:
   ```sql
   USE your_database_name;
   ```
3. Run this single command to recreate the table:

```sql
DROP TABLE IF EXISTS research_publications;

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
```

**Note:** The full SQL script is also available at `backend/migrations/add_research_publications_fields.sql`

## How to Use

### For Faculty Members:

1. **Navigate to Research Tab** in your Profile page
2. **Enter DOI** in the input field. You can enter:
   - Full URL: `https://doi.org/10.1016/j.example.2023.1234`
   - Short form: `10.1016/j.example.2023.1234`
3. **Click "Fetch DOI"** button
4. **Review the fetched information** which includes:
   - Title
   - Authors
   - Journal/Conference/Book name
   - Publication year
   - Publisher
   - ISSN (for journals)
   - DOI link
5. **Click "Save to Profile"** to add it to your publications

### Publication Types:

The system automatically identifies and displays publications as:

#### Journal Article (📰)
- Shows: Journal name, ISSN, year, publisher, DOI link

#### Conference Paper (🎤)
- Shows: Conference name, year, publisher, DOI link

#### Book Chapter (📚)
- Shows: Book name, year, publisher, DOI link

## Features Implemented

### Backend:
- ✅ DOI cleaning (removes https:// prefix if present)
- ✅ Automatic type detection (journal, conference, book-chapter)
- ✅ Extended metadata extraction (ISSN, URL)
- ✅ Error handling for invalid DOIs
- ✅ GET endpoint to fetch saved publications
- ✅ DELETE endpoint to remove publications
- ✅ Full report integration

### Frontend:
- ✅ DOI input with flexible format support
- ✅ Real-time metadata preview
- ✅ Type-specific display layout
- ✅ Color-coded publication categories
- ✅ Saved publications list
- ✅ Delete functionality
- ✅ Full report display with categorization

## API Endpoints

```
POST   /profile/fetch-doi           - Fetch DOI metadata
POST   /profile/research             - Add research publication
GET    /profile/research             - Get all research publications
DELETE /profile/research/:id         - Delete a research publication
```

## Example DOIs to Test

```
Journal Article:
10.1016/j.compeleceng.2022.107754

Conference Paper:
10.1109/CVPR.2020.00001

Book Chapter:
10.1007/978-3-642-33709-3_1
```

## Troubleshooting

### DOI fetch fails:
- Verify the DOI is correct
- Check internet connection
- DOI service might be temporarily unavailable

### Database errors:
- Ensure you've run the migration script
- Check database connection
- Verify column types match the schema
