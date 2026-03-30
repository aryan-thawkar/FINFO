# Faculty Information System

A modern, full-stack web application for managing faculty profiles, academic data, research publications, and professional development records with role-based access control.

## 🎯 Project Overview

The Faculty Information System is a comprehensive platform designed to digitize and manage faculty information efficiently. It replaces traditional paper-based audit systems with a modern, secure, and user-friendly web application.

### Key Features

- ✨ **Modern UI** - Beautiful, responsive design with smooth animations
- 🔒 **Secure** - OTP authentication, JWT tokens, CSRF protection, optimistic locking
- 👥 **Role-Based Access** - Six user roles with appropriate permissions
- 📊 **Complete Management** - Profile, academic, research, and professional data
- 🔄 **Concurrent Users** - Handles multiple simultaneous users safely
- 📱 **Responsive** - Works on desktop, tablet, and mobile devices
- 📈 **Reports** - Generate comprehensive faculty reports

## 🏗️ Architecture

```
FINFO/
├── backend/          # Node.js + Express + MySQL
│   ├── API endpoints
│   ├── Authentication system
│   ├── Database schema
│   └── Controllers & Services
│
└── frontend/         # React + Tailwind CSS
    ├── Modern UI components
    ├── Role-based dashboards
    ├── Form management
    └── State management
```

## 🚀 Quick Start

### Prerequisites

- **Node.js 18+** and npm
- **MySQL 8+**
- **Git** (optional)

### Setup Backend (5 minutes)

```powershell
# Navigate to backend
cd c:\Users\aryan\Desktop\FINFO\backend

# Install dependencies
npm install

# Configure database
# Edit .env file with your MySQL credentials

# Setup database
npm run db:setup

# Start server
npm start
```

Backend will run on: `http://localhost:5000`

### Setup Frontend (5 minutes)

```powershell
# Navigate to frontend
cd c:\Users\aryan\Desktop\FINFO\frontend

# Install dependencies
npm install

# Start development server
npm run dev
```

Frontend will run on: `http://localhost:3000`

**OR use the automated setup script:**

```powershell
cd frontend
.\setup.ps1
```

### 🎉 You're Ready!

Open `http://localhost:3000` and login with your email!

## 📁 Project Structure

### Backend

```
backend/
├── controllers/      # Request handlers
├── middleware/       # Auth, rate limiting, roles
├── routes/          # API route definitions
├── services/        # Business logic
├── config/          # Database config
├── database/        # SQL schema
└── utils/           # Helper functions
```

### Frontend

```
frontend/
├── src/
│   ├── components/  # Reusable UI components
│   ├── context/     # Global state management
│   ├── pages/       # Application pages/views
│   ├── utils/       # Utilities and helpers
│   └── App.jsx      # Main application
├── public/          # Static assets
└── index.html       # Entry HTML
```

## 👥 User Roles

| Role | Permissions |
|------|-------------|
| **General** | Create and manage own profile |
| **Faculty** | Full profile management + research data |
| **HR** | User management, role assignment, department management |
| **Admin** | Full system access |
| **HOD** | View department faculty profiles |
| **Management** | Read-only access to submitted profiles |

## 📊 Features by Module

### Profile Management
- Personal information
- Contact details
- Emergency contacts
- Professional details
- Profile submission

### Academic Module
- Educational qualifications
- Teaching experience
- Courses taught
- Academic achievements

### Research Module
- Publications (with DOI integration)
- Research projects
- Patents
- Citations

### Professional Module
- FDP/Training/MOOCs
- Awards & Recognition
- Professional memberships
- Industry collaborations

### Admin Module
- User management
- Department management
- Role assignment
- Profile oversight

## 🔒 Security Features

### Authentication & Authorization
- ✅ OTP-based passwordless login
- ✅ JWT token management
- ✅ Role-based access control
- ✅ Session timeout (30 min inactivity)
- ✅ Auto-logout

### Data Protection
- ✅ CSRF protection
- ✅ XSS prevention
- ✅ SQL injection prevention
- ✅ Input validation (client + server)
- ✅ Secure password hashing (not used, OTP instead)

### Concurrent User Handling
- ✅ Optimistic locking with version numbers
- ✅ Conflict detection and resolution
- ✅ Auto-refresh on conflicts
- ✅ Transaction-based updates

### API Security
- ✅ Rate limiting (5 OTP/hour, 100 req/15min)
- ✅ Request validation
- ✅ Error handling
- ✅ Audit logging

## 🛠️ Technology Stack

### Backend
- **Node.js** - JavaScript runtime
- **Express.js 5** - Web framework
- **MySQL 8** - Relational database
- **JWT** - Authentication
- **Nodemailer** - Email OTP
- **Express Rate Limit** - Rate limiting

### Frontend
- **React 18** - UI framework
- **Vite** - Build tool
- **React Router** - Navigation
- **Tailwind CSS** - Styling
- **Framer Motion** - Animations
- **Axios** - HTTP client
- **React Icons** - Icons
- **date-fns** - Date formatting

## 📚 Documentation

### Backend
- [Backend README](backend/README.md) - API documentation
- [API Tests](backend/API_TESTS.md) - API testing guide
- [Installation](backend/INSTALLATION.md) - Setup instructions
- [Quick Start](backend/QUICKSTART.md) - Quick start guide

### Frontend
- [Frontend README](frontend/README.md) - Complete documentation
- [Quick Start](frontend/QUICKSTART.md) - 5-minute setup
- [Security Guide](frontend/SECURITY.md) - Security features
- [Components](frontend/COMPONENTS.md) - Component guide
- [Project Summary](frontend/PROJECT_SUMMARY.md) - Overview

## 🔧 Configuration

### Backend (.env)
```env
PORT=5000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=faculty_info_system
JWT_SECRET=your_secret_key
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your_email@gmail.com
EMAIL_PASSWORD=your_app_password
```

### Frontend (.env)
```env
VITE_API_URL=http://localhost:5000/api
VITE_APP_NAME=Faculty Information System
VITE_SESSION_TIMEOUT=3600000
VITE_MAX_FILE_SIZE=5242880
```

## 🧪 Testing

### Backend API Testing
```powershell
cd backend
# See API_TESTS.md for detailed examples
```

### Frontend Testing
```powershell
cd frontend
npm run dev
# Open http://localhost:3000
# Test different user roles and features
```

### Test Different Roles
1. Run department + role setup SQL from backend/migrations/setup_departments_and_roles.sql.
2. Run login seed SQL from backend/migrations/create_hod_hr_users.sql.
3. Use OTP login with these ready accounts:
    - HOD: hod.cseds@college.edu
    - HR: hr@college.edu
    - Admin: admin@college.edu
4. Test role-specific features after OTP verification.

## 📦 Deployment

### Backend Deployment

**Option 1: Traditional Server**
```powershell
npm run build
# Deploy to your Node.js server
```

**Option 2: Cloud (Heroku, AWS, Azure)**
- Set environment variables
- Configure database
- Deploy with platform-specific commands

### Frontend Deployment

**Option 1: Vercel**
```powershell
npm install -g vercel
cd frontend
npm run build
vercel
```

**Option 2: Netlify**
```powershell
cd frontend
npm run build
# Upload dist/ folder to Netlify
```

**Option 3: Traditional Server**
```powershell
npm run build
# Serve dist/ folder with nginx/Apache
```

## 🔄 Development Workflow

### Starting Development
```powershell
# Terminal 1 - Backend
cd backend
npm run dev

# Terminal 2 - Frontend
cd frontend
npm run dev
```

### Making Changes
1. Create feature branch
2. Make changes
3. Test thoroughly
4. Commit with clear message
5. Create pull request

### Database Changes
1. Update `backend/database/schema.sql`
2. Run `npm run db:setup`
3. Update controllers/models
4. Test thoroughly

## 📊 API Endpoints

### Authentication
- `POST /api/auth/send-otp` - Send OTP to email
- `POST /api/auth/verify-otp` - Verify OTP and login

### Profile
- `GET /api/profile` - Get own profile
- `POST /api/profile` - Create/update profile
- `POST /api/profile/submit` - Submit profile
- `GET /api/profile/report` - Get consolidated report

### Academic
- `GET/POST /api/academic/qualifications` - Qualifications
- `GET/POST /api/academic/teaching` - Teaching experience

### Research
- `GET/POST /api/research/publications` - Publications
- `POST /api/research/publications/doi` - Add by DOI
- `GET/POST /api/research/projects` - Research projects
- `GET/POST /api/research/patents` - Patents

### Professional
- `GET/POST /api/professional/fdp` - FDP/Training
- `GET/POST /api/professional/awards` - Awards
- `GET/POST /api/professional/memberships` - Memberships
- `GET/POST /api/professional/collaborations` - Collaborations

### Admin (HR/Admin only)
- `GET /api/admin/users` - All users
- `POST /api/admin/users/:id/convert-to-faculty` - Convert user
- `PUT /api/admin/users/:id/department` - Assign department
- `GET /api/admin/departments` - All departments
- `GET /api/admin/submitted-profiles` - Submitted profiles

See [API_TESTS.md](backend/API_TESTS.md) for detailed examples.

## 🐛 Troubleshooting

### Backend Issues

**Database Connection Error**
- Check MySQL is running
- Verify credentials in .env
- Check database exists

**OTP Not Sending**
- Verify email configuration
- Check Gmail app password
- Review email logs

**Port Already in Use**
- Change PORT in .env
- Kill process on port 5000

### Frontend Issues

**Cannot Connect to API**
- Ensure backend is running
- Check VITE_API_URL in .env
- Verify CORS settings

**Session Expired Quickly**
- Check VITE_SESSION_TIMEOUT
- Verify JWT expiration
- Check browser console

**Build Errors**
- Delete node_modules
- Run `npm install` again
- Check Node.js version

## 🔐 Security Best Practices

### For Deployment

1. **Use HTTPS** - Always in production
2. **Environment Variables** - Never commit .env files
3. **Strong JWT Secret** - Generate random, long secret
4. **Database Security** - Use strong passwords, limit access
5. **Regular Updates** - Keep dependencies updated
6. **Backups** - Regular database backups
7. **Monitoring** - Set up error tracking
8. **Rate Limiting** - Keep enabled in production

### For Users

1. **Don't share OTP** - Keep codes private
2. **Logout when done** - Especially on shared computers
3. **Report issues** - Contact admin for problems
4. **Keep data accurate** - Verify all information

## 📈 Performance

### Backend
- Database indexing on key columns
- Connection pooling
- Rate limiting
- Efficient queries

### Frontend
- Code splitting
- Lazy loading
- Image optimization in production
- Bundle size < 500KB
- Caching strategies

## 🤝 Contributing

### Guidelines
1. Follow existing code structure
2. Write clear commit messages
3. Test thoroughly before committing
4. Update documentation
5. Follow security best practices

### Code Style
- Use ESLint configuration
- Follow React best practices
- Use functional components
- Implement proper error handling

## 📄 License

Copyright © 2026 Faculty Information System. All rights reserved.

## 👏 Acknowledgments

Built with modern technologies:
- React, Express, MySQL
- Tailwind CSS, Framer Motion
- React Icons, Axios
- JWT, Nodemailer
- And many other amazing libraries

## 🆘 Support

### Documentation
- See README files in backend/ and frontend/
- Check API_TESTS.md for API examples
- Review QUICKSTART guides

### Common Issues
- Backend not starting → Check database connection
- Frontend errors → Check API_URL in .env
- Login issues → Verify email configuration
- Permission denied → Check user role

### Getting Help
1. Check documentation
2. Review error messages
3. Check browser/server console
4. Verify configuration files
5. Contact system administrator

## 🎉 Success!

You now have a complete, modern, secure faculty information system!

### What You Can Do

**Faculty/General Users:**
- ✅ Create and manage profiles
- ✅ Add academic qualifications
- ✅ Add publications and research
- ✅ Track professional development
- ✅ Generate comprehensive reports

**HR/Admin:**
- ✅ Manage users and roles
- ✅ Organize departments
- ✅ Oversee faculty profiles
- ✅ Generate analytics

**Management:**
- ✅ View submitted profiles
- ✅ Access consolidated reports
- ✅ Monitor faculty activities

### Next Steps

1. ✅ Set up both backend and frontend
2. ✅ Configure email for OTP
3. ✅ Create user accounts
4. ✅ Assign roles as needed
5. ✅ Start using the system!

---

**Happy Faculty Management! 🚀**

*Built with ❤️ using modern web technologies*
#   F I N F O 
 
 