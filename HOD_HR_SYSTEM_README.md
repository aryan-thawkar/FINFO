# HOD and HR Management System - Setup & API Documentation

## Overview
This system adds Department HOD (Head of Department) and HR management capabilities to the Faculty Information System. 

### Key Features:
- **12 Departments** with HOD assignments
- **HOD Login**: View and manage faculty in their department
- **HR Login**: Manage all users, convert general users to faculty, assign departments
- **Role-based Access Control**: general, faculty, hod, hr, admin

---

## Database Setup

### Step 1: Run the Migration
Execute the SQL migration script to create departments and necessary tables:

```bash
mysql -u your_username -p faculty_information_system < backend/migrations/setup_departments_and_roles.sql
```

Or run it directly in MySQL Workbench/phpMyAdmin:
- Open: `backend/migrations/setup_departments_and_roles.sql`
- Execute all statements

### Step 2: Create Initial HOD and HR Users

After running the migration, create HOD and HR users in MySQL:

```sql
USE faculty_information_system;

-- Create HR user
INSERT INTO users (email, role, is_active) 
VALUES ('hr@college.edu', 'hr', TRUE);

-- Create HOD users for each department
-- First Year
INSERT INTO users (email, role, department_id, is_active) 
VALUES ('hod.fy@college.edu', 'hod', 1, TRUE);

-- CSE-DS
INSERT INTO users (email, role, department_id, is_active) 
VALUES ('hod.cseds@college.edu', 'hod', 2, TRUE);

-- AI
INSERT INTO users (email, role, department_id, is_active) 
VALUES ('hod.ai@college.edu', 'hod', 3, TRUE);

-- Cyber Security
INSERT INTO users (email, role, department_id, is_active) 
VALUES ('hod.cyber@college.edu', 'hod', 4, TRUE);

-- CSBS
INSERT INTO users (email, role, department_id, is_active) 
VALUES ('hod.csbs@college.edu', 'hod', 5, TRUE);

-- CE
INSERT INTO users (email, role, department_id, is_active) 
VALUES ('hod.ce@college.edu', 'hod', 6, TRUE);

-- IT
INSERT INTO users (email, role, department_id, is_active) 
VALUES ('hod.it@college.edu', 'hod', 7, TRUE);

-- EE
INSERT INTO users (email, role, department_id, is_active) 
VALUES ('hod.ee@college.edu', 'hod', 8, TRUE);

-- ETC
INSERT INTO users (email, role, department_id, is_active) 
VALUES ('hod.etc@college.edu', 'hod', 9, TRUE);

-- ME
INSERT INTO users (email, role, department_id, is_active) 
VALUES ('hod.me@college.edu', 'hod', 10, TRUE);

-- Civil
INSERT INTO users (email, role, department_id, is_active) 
VALUES ('hod.civil@college.edu', 'hod', 11, TRUE);

-- IIOT
INSERT INTO users (email, role, department_id, is_active) 
VALUES ('hod.iiot@college.edu', 'hod', 12, TRUE);

-- Robotics & AI
INSERT INTO users (email, role, department_id, is_active) 
VALUES ('hod.rai@college.edu', 'hod', 13, TRUE);

-- Update departments table with HOD assignments
UPDATE departments SET hod_user_id = (SELECT id FROM users WHERE email = 'hod.fy@college.edu') WHERE code = 'FY';
UPDATE departments SET hod_user_id = (SELECT id FROM users WHERE email = 'hod.cseds@college.edu') WHERE code = 'CSE-DS';
UPDATE departments SET hod_user_id = (SELECT id FROM users WHERE email = 'hod.ai@college.edu') WHERE code = 'AI';
UPDATE departments SET hod_user_id = (SELECT id FROM users WHERE email = 'hod.cyber@college.edu') WHERE code = 'CS';
UPDATE departments SET hod_user_id = (SELECT id FROM users WHERE email = 'hod.csbs@college.edu') WHERE code = 'CSBS';
UPDATE departments SET hod_user_id = (SELECT id FROM users WHERE email = 'hod.ce@college.edu') WHERE code = 'CE';
UPDATE departments SET hod_user_id = (SELECT id FROM users WHERE email = 'hod.it@college.edu') WHERE code = 'IT';
UPDATE departments SET hod_user_id = (SELECT id FROM users WHERE email = 'hod.ee@college.edu') WHERE code = 'EE';
UPDATE departments SET hod_user_id = (SELECT id FROM users WHERE email = 'hod.etc@college.edu') WHERE code = 'ETC';
UPDATE departments SET hod_user_id = (SELECT id FROM users WHERE email = 'hod.me@college.edu') WHERE code = 'ME';
UPDATE departments SET hod_user_id = (SELECT id FROM users WHERE email = 'hod.civil@college.edu') WHERE code = 'CIVIL';
UPDATE departments SET hod_user_id = (SELECT id FROM users WHERE email = 'hod.iiot@college.edu') WHERE code = 'IIOT';
UPDATE departments SET hod_user_id = (SELECT id FROM users WHERE email = 'hod.rai@college.edu') WHERE code = 'RAI';
```

---

## Database Structure

### Departments Table
```sql
CREATE TABLE departments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  code VARCHAR(20) NOT NULL UNIQUE,
  hod_user_id INT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (hod_user_id) REFERENCES users(id)
);
```

### Users Table (Updated)
```sql
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  role VARCHAR(50) NOT NULL,           -- 'general', 'faculty', 'hod', 'hr', 'admin'
  department_id INT NULL,               -- Link to departments table
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (department_id) REFERENCES departments(id)
);
```

### Department List
| ID | Code    | Name                                      |
|----|---------|-------------------------------------------|
| 1  | FY      | First Year                                |
| 2  | CSE-DS  | Computer Science & Engineering - Data Science |
| 3  | AI      | Artificial Intelligence                   |
| 4  | CS      | Cyber Security                            |
| 5  | CSBS    | Computer Science & Business Systems       |
| 6  | CE      | Computer Engineering                      |
| 7  | IT      | Information Technology                    |
| 8  | EE      | Electrical Engineering                    |
| 9  | ETC     | Electronics & Telecommunication           |
| 10 | ME      | Mechanical Engineering                    |
| 11 | CIVIL   | Civil Engineering                         |
| 12 | IIOT    | Industrial IoT                            |
| 13 | RAI     | Robotics & AI                             |

---

## API Endpoints

### Authentication (Existing)
All users (general, faculty, hod, hr) login using OTP authentication:

```
POST /auth/send-otp
POST /auth/verify-otp
```

---

## HOD Endpoints
**Base URL**: `/hod`  
**Authentication**: Required (JWT Token)  
**Authorization**: HOD role only

### 1. Get Department Information
```
GET /hod/department
```

**Response:**
```json
{
  "success": true,
  "department": {
    "id": 2,
    "name": "Computer Science & Engineering - Data Science",
    "code": "CSE-DS",
    "hod_user_id": 5,
    "hod_email": "hod.cseds@college.edu",
    "created_at": "2024-01-01T00:00:00.000Z",
    "updated_at": "2024-01-01T00:00:00.000Z"
  }
}
```

### 2. Get All Department Faculty
```
GET /hod/faculty
```

**Response:**
```json
{
  "success": true,
  "department_id": 2,
  "faculty_count": 15,
  "faculty": [
    {
      "user_id": 10,
      "email": "faculty1@college.edu",
      "is_active": true,
      "department_name": "Computer Science & Engineering - Data Science",
      "department_code": "CSE-DS",
      "full_name": "Dr. John Doe",
      "current_designation": "Assistant Professor",
      "date_of_joining": "2020-07-15",
      "profile_id": 8,
      "profile_submitted": true,
      "last_updated_at": "2024-03-01T10:30:00.000Z"
    }
  ]
}
```

### 3. Get Faculty Detailed Profile
```
GET /hod/faculty/:userId
```

**Parameters:**
- `userId` (path): User ID of the faculty member

**Response:**
```json
{
  "success": true,
  "profile": {
    "user_id": 10,
    "email": "faculty1@college.edu",
    "is_active": true,
    "department_name": "Computer Science & Engineering - Data Science",
    "department_code": "CSE-DS",
    "profile_id": 8,
    "is_submitted": true,
    "full_name": "Dr. John Doe",
    "parent_name": "Mr. Parent Name",
    "current_designation": "Assistant Professor",
    "date_of_joining": "2020-07-15",
    "date_of_birth": "1985-03-20",
    "gender": "Male",
    "category": "General"
  }
}
```

### 4. Get Department Statistics
```
GET /hod/statistics
```

**Response:**
```json
{
  "success": true,
  "department_id": 2,
  "statistics": {
    "total_faculty": 15,
    "profiles_submitted": 12,
    "profiles_pending": 3
  }
}
```

---

## HR Endpoints
**Base URL**: `/hr`  
**Authentication**: Required (JWT Token)  
**Authorization**: HR or Admin role

### 1. Get All Users
```
GET /hr/users?role=faculty&department_id=2&is_active=true
```

**Query Parameters:**
- `role` (optional): Filter by role (general, faculty, hod, hr, admin)
- `department_id` (optional): Filter by department
- `is_active` (optional): Filter by active status (true/false)

**Response:**
```json
{
  "success": true,
  "count": 50,
  "users": [
    {
      "id": 10,
      "email": "user@college.edu",
      "role": "faculty",
      "department_id": 2,
      "is_active": true,
      "created_at": "2024-01-01T00:00:00.000Z",
      "department_name": "Computer Science & Engineering - Data Science",
      "department_code": "CSE-DS",
      "profile_id": 8,
      "is_submitted": true,
      "full_name": "Dr. John Doe",
      "current_designation": "Assistant Professor"
    }
  ]
}
```

### 2. Convert General User to Faculty
```
PUT /hr/users/:userId/convert-to-faculty
```

**Request Body:**
```json
{
  "department_id": 2
}
```

**Response:**
```json
{
  "success": true,
  "message": "User successfully converted to faculty",
  "user_id": 10,
  "department_id": 2
}
```

### 3. Update User Department
```
PUT /hr/users/:userId/department
```

**Request Body:**
```json
{
  "department_id": 3
}
```
*Note: Use `null` to remove department assignment*

**Response:**
```json
{
  "success": true,
  "message": "User department updated successfully",
  "user_id": 10,
  "department_id": 3
}
```

### 4. Update User Role
```
PUT /hr/users/:userId/role
```

**Request Body:**
```json
{
  "role": "faculty"
}
```
*Allowed roles: general, faculty, hod, hr, admin*

**Response:**
```json
{
  "success": true,
  "message": "User role updated successfully",
  "user_id": 10,
  "role": "faculty"
}
```

### 5. Toggle User Active Status
```
PUT /hr/users/:userId/status
```

**Request Body:**
```json
{
  "is_active": false
}
```

**Response:**
```json
{
  "success": true,
  "message": "User deactivated successfully",
  "user_id": 10,
  "is_active": false
}
```

### 6. Get All Departments
```
GET /hr/departments
```

**Response:**
```json
{
  "success": true,
  "count": 13,
  "departments": [
    {
      "id": 2,
      "name": "Computer Science & Engineering - Data Science",
      "code": "CSE-DS",
      "hod_user_id": 5,
      "hod_email": "hod.cseds@college.edu",
      "faculty_count": 15,
      "created_at": "2024-01-01T00:00:00.000Z",
      "updated_at": "2024-01-01T00:00:00.000Z"
    }
  ]
}
```

### 7. Assign HOD to Department
```
PUT /hr/departments/:departmentId/hod
```

**Request Body:**
```json
{
  "hod_user_id": 5
}
```
*Note: User must have 'hod' role. Use `null` to remove HOD assignment*

**Response:**
```json
{
  "success": true,
  "message": "HOD assigned successfully",
  "department_id": 2,
  "hod_user_id": 5
}
```

### 8. Get System Statistics
```
GET /hr/statistics
```

**Response:**
```json
{
  "success": true,
  "statistics": {
    "total_active_users": 150,
    "general_users": 20,
    "faculty_users": 120,
    "hod_users": 13,
    "total_departments": 13,
    "submitted_profiles": 100,
    "pending_profiles": 20
  }
}
```

---

## User Roles & Permissions

### General User
- Can login via OTP
- Can view/edit their own profile
- Default role for new users

### Faculty
- All General User permissions
- Assigned to a department
- Can submit detailed faculty profile

### HOD (Head of Department)
- All Faculty permissions
- Can view all faculty in their department
- Can view detailed profiles of department faculty
- Can view department statistics

### HR (Human Resources)
- Can view all users across all departments
- Can convert general users to faculty
- Can assign/update departments for users
- Can change user roles
- Can activate/deactivate users
- Can manage HOD assignments
- Can view system-wide statistics

### Admin
- All HR permissions
- Additional administrative capabilities

---

## Testing the APIs

### 1. Login as HOD
```bash
# Send OTP
curl -X POST http://localhost:5000/auth/send-otp \
  -H "Content-Type: application/json" \
  -d '{"email": "hod.cseds@college.edu"}'

# Verify OTP
curl -X POST http://localhost:5000/auth/verify-otp \
  -H "Content-Type: application/json" \
  -d '{"email": "hod.cseds@college.edu", "otp": "123456"}'

# Response will include token
# Use this token in Authorization header for subsequent requests
```

### 2. Get Department Faculty (as HOD)
```bash
curl -X GET http://localhost:5000/hod/faculty \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

### 3. Convert User to Faculty (as HR)
```bash
# First login as HR
curl -X POST http://localhost:5000/auth/verify-otp \
  -H "Content-Type: application/json" \
  -d '{"email": "hr@college.edu", "otp": "123456"}'

# Convert user to faculty
curl -X PUT http://localhost:5000/hr/users/15/convert-to-faculty \
  -H "Authorization: Bearer YOUR_HR_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"department_id": 2}'
```

---

## Frontend Integration Guide

### Login Flow
1. User enters email
2. Backend sends OTP
3. User enters OTP
4. Backend returns JWT token + role + department_id
5. Frontend stores token and redirects based on role:
   - `general` → Profile Page
   - `faculty` → Profile Page
   - `hod` → HOD Dashboard (Department View)
   - `hr` → HR Dashboard (System-wide View)

### HOD Dashboard Components
- Department Overview Card
- Faculty List Table
- Department Statistics
- Faculty Profile View (Modal/Drawer)

### HR Dashboard Components
- System Statistics Cards
- All Users Table with Filters
- Department Management Section
- User Management Actions (Convert, Update, Assign)

---

## Next Steps

1. **Run the Database Migration**
   ```bash
   mysql -u root -p faculty_information_system < backend/migrations/setup_departments_and_roles.sql
   ```

2. **Create Initial HOD and HR Users** (Use SQL commands provided above)

3. **Test the Endpoints** using Postman or curl

4. **Update Frontend** to include:
   - HOD Dashboard page
   - HR Dashboard page
   - Role-based navigation
   - Department selection components

5. **Security Enhancements** (Optional):
   - Add audit logging for HR actions
   - Add pagination for large user lists
   - Add search functionality
   - Add export functionality (CSV/PDF)

---

## Troubleshooting

### Issue: HOD cannot see faculty
**Solution**: Ensure HOD user has `department_id` set and faculty users have matching `department_id`

### Issue: 403 Forbidden errors
**Solution**: Check JWT token is valid and user has correct role

### Issue: Empty faculty list
**Solution**: 
1. Verify faculty users have `role = 'faculty'`
2. Verify faculty have `department_id` matching HOD's department
3. Verify faculty are `is_active = TRUE`

### Issue: Cannot convert to faculty
**Solution**: Ensure user exists and has `role = 'general'` before converting

---

## Support

For questions or issues, please check:
1. Database structure is correctly set up
2. All migrations have run successfully
3. JWT middleware is working correctly
4. Role middleware is configured properly

Happy coding! 🎉
