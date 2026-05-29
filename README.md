# Smart Campus Management System

**Your Gateway to a Smarter Campus**

A full-stack university campus operations platform built as a Software Engineering capstone project. The system centralizes resource booking, facility maintenance, events, transportation, housing, employment, and administrative workflows behind role-specific dashboards and a REST API backed by MySQL.

---

## Overview

Universities manage a large volume of shared resources—classrooms, labs, shuttles, dorms, parking, and support tickets—often across disconnected tools. The **Smart Campus Management System** addresses this by providing a single web application where students, faculty, maintenance staff, and administrators interact with the same data through tailored interfaces.

The platform enforces **role-based access control**, validates bookings to prevent scheduling conflicts, routes issue reports to maintenance teams with optional photo evidence, and supports approval workflows for users, events, and employment applications. A Node.js/Express backend exposes a structured REST API; a vanilla JavaScript frontend consumes it via JWT-authenticated requests. Persistent state lives in a normalized **MySQL** schema with foreign-key integrity, connection pooling, and transactional helpers.

The project is developed by **TEK Team** (*"where Technology Empowers Knowledge"*) for Lebanese American University–style campus operations (e.g., `@lau.edu.lb` contact references in the UI).

---

## Key Features

### Students

- **Resource booking** — Reserve classrooms, labs, sports halls, library seats, and computers with real-time availability checks and conflict prevention
- **Waitlist** — Join a waitlist when a resource is unavailable; notifications when slots open after cancellations
- **Issue reporting** — Submit maintenance, IT, environmental, or general issues with descriptions, priority, and image attachments (up to 5 MB)
- **Event tickets** — Browse approved campus events and reserve tickets with capacity tracking
- **Transportation** — View shuttle/bus routes, schedules, and reserve seats by date and time
- **Parking** — Browse and reserve semester-based parking spaces
- **Housing** — View available dorm units and book by building, gender policy, and semester
- **Student employment** — Browse on-campus job postings and submit applications
- **Tutoring** — View and reserve faculty-organized tutoring sessions
- **Announcements & notifications** — Read faculty announcements; receive in-app notifications for bookings, issues, and system events
- **Profile management** — Update account details via authenticated profile endpoints
- **Booking history** — View and cancel active bookings across services from the student dashboard

### Faculty

- **Teaching resource booking** — Request and manage bookings with faculty-priority handling
- **Booking override** — Cancel a conflicting student booking and reassign the slot for academic use, with automated student notification and high-priority announcement
- **Announcements** — Create, edit, and delete department announcements broadcast to students
- **Events** — Create seminars, workshops, and academic events (subject to admin approval workflow)
- **Tutoring sessions** — Create and manage tutoring sessions with capacity and scheduling fields
- **Classroom change requests** — Request temporary classroom relocations linked to facility issues
- **Issue reporting** — Report urgent classroom or facility problems during teaching hours
- **Availability views** — Inspect resource calendars and existing bookings before scheduling

### Maintenance Staff

- **Issue management** — View all reported issues, self-assign tickets, update status, and log activity notes on an audit trail
- **Facility status** — Mark resources as active, under maintenance, or closed (blocks new bookings)
- **Cleaning tasks** — View assigned cleaning schedules, complete checklist items, and mark tasks done
- **Preventive maintenance** — View and update scheduled preventive maintenance tasks; generate daily operational summaries
- **Sub-role support** — Maintenance accounts support `it_support` and `cleaning` sub-roles at registration
- **New issue submission** — Report issues directly from the maintenance dashboard when discovered on-site

### Administrators

- **User lifecycle** — Approve or reject pending registrations; activate, suspend, or change user roles
- **Booking oversight** — Review pending booking requests; approve or reject reservations
- **Resource CRUD** — Create, update, and delete bookable campus resources
- **Event moderation** — Approve or reject faculty-submitted events before they appear to students
- **Employment workflow** — Approve or reject student job applications
- **Classroom change approval** — Review and approve/reject faculty classroom relocation requests
- **Issue reassignment** — Assign issues to specific maintenance staff
- **System configuration** — Manage keys such as max booking duration, advance booking window, and maintenance mode
- **Transportation administration** — Create, update, and delete routes and schedules
- **Broadcast notifications** — Send system-wide in-app notifications
- **Security monitoring** — View access logs and detect suspicious failed-login patterns
- **Activity logs** — Audit authenticated API access stored in the database

---

## System Architecture

### Overall architecture

The system follows a **three-tier, client–server architecture**:

| Layer | Technology | Responsibility |
|-------|------------|----------------|
| Presentation | HTML5, CSS3, vanilla JavaScript | Role-based dashboards, forms, client-side validation |
| Application | Node.js, Express.js | REST API, authentication, business logic, file uploads |
| Data | MySQL (InnoDB) | Relational persistence, referential integrity, transactions |

```
┌─────────────────────────────────────────────────────────────┐
│                    Browser (Client)                          │
│  index.html · login/signup · dashboard-{role}.html          │
│  auth.js · config.js · utils.js                             │
└──────────────────────────┬──────────────────────────────────┘
                           │ HTTPS / HTTP
                           │ Authorization: Bearer <JWT>
                           ▼
┌─────────────────────────────────────────────────────────────┐
│              Express Server (server.js)                      │
│  Routes → Controllers → Models → MySQL (mysql2 pool)          │
│  Middleware: auth, CORS, access logging, multer uploads      │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────────────┐
│                    MySQL Database                            │
│              smartcampus (25+ tables)                        │
└─────────────────────────────────────────────────────────────┘
```

### MVC pattern

The backend implements a clear **Model–View–Controller** separation:

- **Models** (`backend/models/`) — Data access and domain queries (`User`, `Booking`, `Event`, `Issue`, `Notification`, `Waitlist`, `Transportation`, `NursingAppointment`)
- **Controllers** (`backend/controllers/`) — Request handling, validation, orchestration, and notification side effects
- **Routes** (`backend/routes/`) — HTTP endpoint definitions with middleware chains
- **View** — Served as static HTML/CSS/JS from `frontend/public/` (no server-side templating engine)

### Client–server communication

- All API calls use `fetch` through a shared `apiRequest()` helper in `frontend/public/js/auth.js`
- The API base URL is resolved dynamically in `frontend/public/js/config.js`:
  - Local: `http://localhost:3001/api`
  - Same-origin production: `/api`
  - Split deployment (Vercel frontend + Railway backend): configurable Railway URL
- JSON request/response bodies; JWT sent in the `Authorization: Bearer` header
- Tokens and user metadata stored in `localStorage`

### Backend architecture

- **Entry point:** `backend/server.js` — middleware stack, route registration, static asset serving, scheduled reminder job
- **Database layer:** `backend/config/db.js` — connection pool, parameterized queries, transaction helper
- **Helpers:** `backend/utils/dbHelpers.js`, `backend/utils/emailService.js`
- **Uploads:** Multer stores issue images in `backend/uploads/`, served at `/api/uploads/`
- **Background service:** `ReminderController` runs every 5 minutes via `setInterval` to send one-hour booking reminders

### Database architecture

- MySQL 8.x with **InnoDB** engine and `utf8mb4` collation
- Tables ordered by dependency level in `codes/database/schema.sql` (departments → users → resources → bookings/issues → junction tables)
- Production snapshot available in `SmartCampusDatabase.sql` (Railway-hosted dump)
- Connection via individual env vars (`DB_HOST`, `DB_USER`, etc.) or Railway `MYSQL_URL`

### Authentication flow

```
1. POST /api/auth/signup
   → Password validated (length, uppercase, number, special char)
   → bcrypt hash stored; user status = "pending"
   → Admins notified; no JWT issued until approval

2. Admin POST /api/admin/users/:id/approve
   → User status → "active"

3. POST /api/auth/login
   → Credentials verified with bcrypt.compare
   → JWT issued (24h expiry) with user_id, email, role

4. Protected routes
   → authenticateToken middleware verifies JWT
   → requireRole('admin' | 'faculty' | ...) enforces RBAC
```

---

## Technology Stack

### Frontend

| Technology | Usage |
|------------|-------|
| HTML5 | Page structure, role-specific dashboards |
| CSS3 | Responsive layout, component styling (`frontend/public/css/style.css`) |
| Vanilla JavaScript (ES6+) | API integration, form handling, dashboard logic |
| `fetch` API | HTTP client for REST calls |
| `localStorage` | JWT and session user persistence |

No React, Vue, or Angular — intentional simplicity for a capstone SPA served as static files.

### Backend

| Technology | Version | Usage |
|------------|---------|-------|
| Node.js | ≥ 18 | Runtime |
| Express.js | ^4.18 | HTTP server, routing, middleware |
| mysql2 | ^3.15 | Promise-based MySQL driver with connection pooling |
| jsonwebtoken | ^9.0 | JWT creation and verification |
| bcryptjs | ^2.4 | Password hashing (10 salt rounds) |
| multer | ^1.4 | Multipart file uploads for issue photos |
| dotenv | ^16.4 | Environment variable loading |
| uuid | ^9.0 | Unique identifier generation |
| body-parser | ^1.20 | JSON and URL-encoded request bodies |
| nodemon | ^3.0 | Development auto-reload (devDependency) |

### Database

| Technology | Usage |
|------------|-------|
| MySQL 8.x | Primary data store |
| InnoDB | Foreign keys, ACID transactions |
| SQL schema scripts | `codes/database/schema.sql`, seed data in `inserts.sql` / `insertFinal.sql` |

### Authentication & Security

| Practice | Implementation |
|----------|----------------|
| **JWT** | Signed tokens (`expiresIn: '24h'`) with `user_id`, `email`, `role`; `JWT_SECRET` required in production |
| **Password hashing** | `bcryptjs` with cost factor 10; hashes never returned in API responses |
| **Password policy** | Minimum 8 characters, uppercase, digit, special character enforced server- and client-side |
| **Authorization** | `requireRole()` middleware restricts endpoints by role (`admin`, `faculty`, `maintenance`, etc.) |
| **RBAC** | Four primary roles plus maintenance `subrole` (`it_support`, `cleaning`) |
| **Account approval** | New signups remain `pending` until admin approval; login blocked until `active` |
| **CORS** | Configurable `ALLOWED_ORIGINS` (comma-separated or `*`) |
| **File upload validation** | Image types only (jpeg, png, gif, webp); 5 MB size limit |
| **Access logging** | Authenticated requests and failed logins written to `accesslogs` table |
| **Suspicious activity** | Admin endpoint aggregates repeated failed login attempts |
| **Production guards** | Server exits if `JWT_SECRET` or `DB_PASSWORD` missing when `NODE_ENV=production` |
| **Error sanitization** | Generic error messages returned in production API responses |

### Deployment

| Platform | Configuration | Role |
|----------|---------------|------|
| **Vercel** | `codes/vercel.json`, `codes/backend/vercel.json` — `@vercel/node` builder targeting `server.js` | Host frontend static assets and/or full-stack Node server |
| **Railway** | `codes/railway.json`, `codes/backend/railway.json` — Nixpacks build, `npm start` | Host Node.js API and MySQL database |
| **Split deployment** | Documented in `codes/VERCEL_RAILWAY_SETUP.md` | Frontend on Vercel, API on Railway with CORS + `config.js` Railway URL |

Environment variables for production are documented in `codes/DEPLOYMENT.md`.

---

## Database Design

### Main entities

| Entity | Purpose |
|--------|---------|
| `users` | Accounts with role, subrole, department, university ID, status |
| `departments` | Academic departments for users, courses, and jobs |
| `resources` | Bookable campus assets (type, building, room, capacity, status) |
| `bookingRequests` / `bookings` | Reservation workflow and confirmed bookings |
| `waitlist` | Queue when resources are unavailable |
| `issueReports` / `issueActivities` | Maintenance tickets and audit trail |
| `events` / `eventTickets` | Campus events and student reservations |
| `transportationRoutes` / `transportationRouteSchedule` / `transportationReservations` | Shuttle operations |
| `dormUnits` / `availableDorms` | Housing inventory and catalog |
| `parkingSpaces` | Parking lot reservations |
| `studentEmployment` / `employmentApplications` / `availableJobs` | On-campus jobs |
| `tutoringSessions` | Faculty-led tutoring |
| `announcements` | Faculty broadcasts |
| `notifications` | Per-user in-app (and simulated email) messages |
| `cleaningTasks` / `cleaningTaskChecklist` | Janitorial work orders |
| `preventiveMaintenance` | Scheduled facility upkeep |
| `classroomChangeRequests` | Faculty relocation requests |
| `accessLogs` | Security audit trail |
| `systemConfig` | Key–value admin settings |
| `courses` | Course catalog linked to departments |
| `nursingAppointments` | Health center scheduling (schema; API implemented) |
| `lostFound` | Lost-and-found items (schema; API implemented) |

### Relationships (selected)

- `users.department_id` → `departments`
- `bookingRequests` → `users`, `resources`; approved rows become `bookings`
- `issueReports.reporter_user_id` → `users`; optional `assigned_user_id`
- `events.created_by` / `organizer_user_id` → `users`
- `employmentApplications` → `users`, `studentEmployment`
- `cleaningTasks` / `preventiveMaintenance` → `resources`, assigned `users`

### Business logic in the database

- **Referential integrity** — `ON DELETE CASCADE` / `SET NULL` policies preserve consistency
- **Status fields** — Drive workflows (`pending`, `active`, `approved`, `in_progress`, `resolved`, etc.)
- **Capacity tracking** — `events.available_tickets`, `transportationRoutes.reserved_seats`
- **Configuration** — `systemConfig` stores runtime policies without code changes

---

## Project Structure

```
Smart Campus Management System/
├── README.md                          # This file
├── SmartCampusDatabase.sql            # Full MySQL dump (schema + seed data snapshot)
│
└── codes/
    ├── backend/                       # Node.js / Express API server
    │   ├── config/
    │   │   └── db.js                  # MySQL connection pool & query helpers
    │   ├── controllers/               # Business logic (20 controllers)
    │   ├── middleware/
    │   │   ├── auth.js                # JWT verification & role guards
    │   │   └── accessLogger.js        # Audit logging
    │   ├── models/                    # Data access layer
    │   ├── routes/                    # Express route definitions (18 route modules)
    │   ├── uploads/                   # User-uploaded issue images
    │   ├── utils/
    │   │   ├── dbHelpers.js           # Shared query helpers
    │   │   └── emailService.js        # Simulated email + notification bridge
    │   ├── server.js                  # Application entry point
    │   ├── package.json
    │   ├── vercel.json                # Vercel serverless config
    │   └── railway.json               # Railway deployment config
    │
    ├── frontend/                      # Static web client (separate Git repo)
    │   └── public/
    │       ├── css/style.css
    │       ├── js/
    │       │   ├── auth.js            # Authentication & API client
    │       │   ├── config.js          # Environment-aware API base URL
    │       │   └── utils.js           # UI helpers
    │       ├── images/
    │       ├── index.html             # Landing page
    │       ├── login.html
    │       ├── signup.html
    │       ├── dashboard-student.html
    │       ├── dashboard-faculty.html
    │       ├── dashboard-maintenance.html
    │       └── dashboard-admin.html
    │
    ├── database/
    │   ├── schema.sql                 # Canonical CREATE TABLE script
    │   ├── inserts.sql                # Sample data
    │   ├── insertFinal.sql            # Extended demo dataset
    │   └── new.sql                    # Incremental migrations
    │
    ├── vercel.json                    # Root Vercel config (monorepo-style)
    ├── railway.json                   # Root Railway config
    │
    └── docs/                          # Project documentation (*.md)
        ├── DEPLOYMENT.md
        ├── QUICKSTART.md
        ├── VERCEL_RAILWAY_SETUP.md
        ├── IMPLEMENTATION_SUMMARY.md
        ├── MIGRATION_SUMMARY.md
        └── ...
```

**Folder notes**

- **`backend/`** — All server-side code; run `npm install` and `npm start` from here
- **`frontend/public/`** — Client assets; served by Express in development and deployable separately to Vercel
- **`database/`** — SQL artifacts for local setup and demos
- **`SmartCampusDatabase.sql`** — Importable full database for quick environment replication

---

## API Overview

Base path: `/api` · Authentication: `Authorization: Bearer <token>` unless noted.

### Authentication (`/api/auth`)

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/signup` | Register (pending approval) |
| POST | `/login` | Authenticate; returns JWT |
| GET | `/profile` | Get current user profile |
| PUT | `/profile` | Update profile |
| POST | `/forgot-password` | Initiate password reset (simulated email) |

### Bookings (`/api/bookings`)

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/request` | Create booking with availability check |
| GET | `/my-bookings`, `/my-requests` | User reservation history |
| POST | `/cancel/:bookingId` | Cancel booking; triggers waitlist check |
| GET | `/resources` | List bookable resources (optional type filter) |
| POST/GET | `/waitlist` | Join or view waitlist |

### Issues (`/api/issues`)

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/` | Report issue (multipart image optional) |
| GET | `/my-issues`, `/all` | User issues or staff-wide list |
| PUT | `/:issueId/status` | Update ticket status |
| GET/POST | `/:issueId/activities` | Audit trail |

### Events (`/api/events`)

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST/GET/PUT/DELETE | `/` | CRUD for events |
| GET | `/pending` | Admin approval queue |
| POST | `/approve/:eventId`, `/reject/:eventId` | Moderation |
| POST | `/:eventId/reserve` | Reserve ticket |
| GET | `/my/tickets` | Student ticket history |

### Transportation (`/api/transportation`)

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/routes` | List routes and schedules |
| POST | `/reserve` | Book a seat |
| GET | `/my/reservations` | User reservations |
| POST/PUT/DELETE | `/admin/routes/*` | Admin route management |

### Additional modules

| Prefix | Capabilities |
|--------|--------------|
| `/api/dorms` | Available units, book, cancel, my reservation |
| `/api/parking` | Space availability and reservations |
| `/api/employment` | Job listings, applications, admin approval |
| `/api/tutoring` | Session CRUD and student reservations |
| `/api/notifications` | In-app notifications, mark read |
| `/api/faculty` | Announcements, booking override, courses |
| `/api/faculty/classroom-change` | Relocation requests and admin review |
| `/api/maintenance` | Issues, cleaning tasks, facility status |
| `/api/maintenance/preventive` | Preventive tasks and daily summary |
| `/api/admin` | Users, bookings, issues, logs, broadcast |
| `/api/admin/resources` | Resource CRUD |
| `/api/admin/config` | System configuration |
| `/api/lost-found` | Report and claim items (API; no dashboard UI yet) |
| `/api/nursing` | Appointment slots and booking (API; no dashboard UI yet) |
| `/api/health` | Health check (`GET`, no auth) |

---

## Major Functionalities

### Resource booking with conflict prevention

`Booking.checkAvailability()` queries active bookings for a resource and rejects overlapping time ranges before insert. Unavailable slots offer waitlist enrollment; cancellations invoke `Waitlist.checkAndNotify()` to alert waiting users.

### Faculty booking override

Faculty can supersede a student reservation for academic priority: the student booking is cancelled, a new faculty booking is created for the same slot, and the affected student receives notifications plus a high-priority announcement.

### Maintenance ticketing pipeline

Issues support auto-categorization (IT, environmental, cleaning) and priority inference from keywords. Creation notifies all maintenance staff; high-priority tickets trigger simulated email alerts. Staff update status and append activities for a full audit history.

### Event and employment approval workflows

Faculty-created events and student job applications enter `pending` states until administrators approve or reject them, mirroring real campus governance.

### Notification and reminder system

In-app notifications cover bookings, issues, announcements, and admin broadcasts. A background job every five minutes sends one-hour booking reminders and auto-completes expired bookings.

### Multi-service student dashboard

A single student dashboard integrates bookings, issues, events, transportation, parking, housing, employment, tutoring, and announcements—demonstrating API composition and modular frontend sections.

### Administrative control plane

Admins manage the full user lifecycle, resource inventory, system configuration, transportation network, security logs, and cross-module approval queues from one interface.

---

## Software Engineering Practices

| Practice | How it is applied |
|----------|-------------------|
| **MVC architecture** | Strict separation of routes, controllers, and models |
| **Modularity** | One route file and controller per domain (bookings, events, dorms, etc.) |
| **Separation of concerns** | Frontend handles presentation; backend owns validation and persistence |
| **Parameterized SQL** | All queries use `?` placeholders via mysql2 to mitigate injection |
| **Connection pooling** | Reusable pool with configurable limits for scalability |
| **Transactions** | `transaction()` helper in `db.js` for multi-step atomic operations |
| **Environment-based config** | Secrets and hosts externalized via `.env` |
| **Error handling** | Central Express error middleware; 404 handler for unknown API routes |
| **Validation** | Server-side password, university ID, and upload validation |
| **Auditability** | `accesslogs` and `issueActivities` tables |
| **CORS & deployment docs** | Production-ready configuration guides for Vercel/Railway |

---

## Screenshots

> Replace placeholder paths with actual screenshot files after capturing from a running instance.

### Login Page

![Login Page](docs/screenshots/login.png)

### Student Dashboard

![Student Dashboard](docs/screenshots/dashboard-student.png)

### Faculty Dashboard

![Faculty Dashboard](docs/screenshots/dashboard-faculty.png)

### Maintenance Dashboard

![Maintenance Dashboard](docs/screenshots/dashboard-maintenance.png)

### Admin Dashboard

![Admin Dashboard](docs/screenshots/dashboard-admin.png)

### Booking System

![Booking System](docs/screenshots/booking.png)

### Issue Reporting System

![Issue Reporting](docs/screenshots/issues.png)

### Event Management System

![Event Management](docs/screenshots/events.png)

---

## Installation

### Prerequisites

- **Node.js** ≥ 18 and **npm** ≥ 9
- **MySQL** 8.x (local, Docker, or cloud such as Railway)

### Database setup

1. Create the database:

```sql
CREATE DATABASE smartcampus CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

2. Apply schema and optional seed data:

```bash
mysql -u root -p smartcampus < codes/database/schema.sql
mysql -u root -p smartcampus < codes/database/inserts.sql
```

Alternatively, import the full snapshot:

```bash
mysql -u root -p smartcampus < SmartCampusDatabase.sql
```

3. Create an active admin user (after schema exists) via signup + manual status update, or insert directly into `users` with a bcrypt-hashed password.

### Environment variables

Create `codes/backend/.env`:

```env
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=smartcampus

JWT_SECRET=your_strong_random_secret

PORT=3001
NODE_ENV=development

# Optional
ALLOWED_ORIGINS=http://localhost:3001,http://localhost:3000
DB_SSL=false
```

For **Railway**, you may use `MYSQL_URL` instead of individual `DB_*` variables.

### Backend setup

```bash
cd codes/backend
npm install
npm run dev    # nodemon — development
# or
npm start      # production
```

Server runs at **http://localhost:3001**.

### Frontend setup

No build step. The backend serves `codes/frontend/public/` automatically. Open:

- Home: http://localhost:3001
- Login: http://localhost:3001/login.html
- Sign up: http://localhost:3001/signup.html

For **split deployment**, deploy `frontend/` to Vercel and set the Railway API URL in `frontend/public/js/config.js` (see `codes/VERCEL_RAILWAY_SETUP.md`).

### Running locally (quick)

```bash
cd codes/backend
npm install
# Ensure .env and MySQL are configured
npm start
```

Verify the API: `GET http://localhost:3001/api/health`

---

## Future Enhancements

- **Real email delivery** — Integrate SMTP or SendGrid/AWS SES (currently simulated via console + in-app notifications)
- **Nursing & lost-and-found UI** — Backend APIs exist; add student/maintenance dashboard sections
- **Multi-factor authentication** — Especially for administrator accounts
- **Real-time updates** — WebSockets or SSE for live booking calendars and issue status
- **Advanced search & filters** — Unified search across resources, events, and jobs by date, building, and type
- **Payment integration** — Paid event tickets or parking fees (Stripe or similar)
- **Mobile-responsive PWA** — Offline-capable installable client
- **Automated database backups** — Scheduled exports for production MySQL on Railway
- **Rate limiting & API versioning** — Harden public endpoints under load
- **Restore AI FAQ chatbot** — Requirements reference a chatbot module; UI hooks were removed from CSS—could be reintroduced with a dedicated controller and FAQ knowledge base

---

## Contributors

**TEK Team** — *"where Technology Empowers Knowledge"*

| Name | |
|------|---|
| Abdallah Elrizz | |
| Assil Halawi | |
| Rami Assi | |
| Lynn Akil | |
| Nour El Itani | |

---

## License

This project was developed as a **Software Engineering course capstone** at university. See course and institutional guidelines for usage and distribution.

---

<p align="center">
  <strong>Smart Campus Management System</strong><br>
  Making campus life smarter.
</p>
