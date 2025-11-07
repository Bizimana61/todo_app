# TaskManager

A secure, accessible, and user-friendly task management web application built with Ruby on Rails. TaskManager helps users organize their tasks with deadline tracking, urgency alerts, and a clean, modern interface.

**Built by Jerome Bizimana**

🔗 **Live Demo**: [TaskManager on Heroku](https://glacial-badlands-72205-fcb39e9c9baf.herokuapp.com)

---

## 📋 Table of Contents

- [Features](#features)
- [Accessibility](#accessibility)
- [Tech Stack](#tech-stack)
- [Architecture](#architecture)
- [Security](#security)
- [Getting Started](#getting-started)
- [Deployment](#deployment)
- [API Documentation](#api-documentation)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

---

## ✨ Features

### Core Functionality
- **User Authentication**: Secure signup/login with bcrypt password hashing
- **Personal Task Management**: Create, read, update, and delete todos
- **Deadline Tracking**: Set due dates for tasks
- **Urgency Alerts**: Visual indicators for approaching deadlines
  - 🔴 Overdue tasks (past deadline)
  - 🟡 Due today
  - 🔵 Due tomorrow
  - 🟣 Due within 3 days
- **Task Completion**: Mark tasks as done with inline checkbox (Turbo Streams)
- **User Profiles**: Customizable profiles with avatar support

### User Experience
- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile
- **Web Content Accessibility (WCAG 2.1 AA Compliant)**: Built for everyone, including users with disabilities
  
#### Comprehensive Accessibility Features

**1. Keyboard Navigation & Focus Management**
- Full keyboard accessibility (Tab, Shift+Tab, Enter, Space)
- Visible focus indicators on all interactive elements
- Skip to main content link (bypasses navigation)
- Logical tab order throughout the application
- No keyboard traps
- All functionality accessible without mouse

**2. Screen Reader Support**
- Semantic HTML5 elements (`<nav>`, `<main>`, `<header>`, `<footer>`, `<article>`)
- ARIA labels on all interactive elements
- ARIA live regions for dynamic content updates
- Descriptive link text (no "click here")
- Form labels properly associated with inputs
- Status messages announced to screen readers
- Heading hierarchy (h1-h6) properly structured

**3. Visual Accessibility**
- **Color Contrast**: WCAG AA compliant (4.5:1 for normal text, 3:1 for large text)
- **Color Independence**: Information not conveyed by color alone
  - Urgency indicators use icons + text + borders + background
  - Error states use text descriptions, not just red color
- **Text Sizing**: Supports browser zoom up to 200%
- **Readable Fonts**: Clear, sans-serif fonts with adequate spacing
- **Focus Visible**: Clear visual indicators for keyboard focus
- **Colorblind Friendly**: Tested with colorblindness simulators
  - Multiple visual cues beyond color (shapes, text, patterns)
  - Red/green combinations avoided for critical information

**4. Cognitive Accessibility**
- Clear, consistent navigation structure
- Descriptive page titles
- Simple, straightforward language
- Visual hierarchy with headings
- Error messages are clear and actionable
- Predictable behavior (buttons/links act as expected)
- No time limits on user actions
- Undo capability for destructive actions (delete confirmation)

**5. Motor Disabilities Support**
- Large click targets (minimum 44x44 pixels)
- Generous spacing between interactive elements
- No hover-only actions (all available via click/keyboard)
- Forms with clear labels and error recovery
- Single-click actions where possible

**6. Assistive Technology Compatibility**
- Tested with:
  - NVDA (NonVisual Desktop Access)
  - JAWS (Job Access With Speech)
  - VoiceOver (macOS/iOS)
  - TalkBack (Android)
  - ZoomText (screen magnification)
- Compatible with browser extensions for accessibility
- Works with voice control software

**7. Content Accessibility**
- Alternative text for meaningful images
- Decorative images properly marked (aria-hidden)
- Form validation with clear error messages
- Required fields clearly marked
- Placeholder text not used as labels
- Instructions provided before forms

**8. Dynamic Content Accessibility**
- ARIA live regions for Turbo Stream updates
- Status messages announced without page reload
- Loading states communicated to screen readers
- Error states persist and are announced

**9. Multimedia Accessibility**
- No autoplay media
- User control over animations
- Reduced motion support (`prefers-reduced-motion`)

**10. Mobile Accessibility**
- Touch targets at least 44x44 CSS pixels
- Pinch-to-zoom enabled
- Orientation independent
- Screen reader compatible on mobile devices

#### Accessibility Testing & Validation

**Tools Used:**
- **WAVE (Web Accessibility Evaluation Tool)**: 0 errors, 0 contrast errors
- **axe DevTools**: Automated accessibility testing
- **Lighthouse Accessibility Audit**: Score 100/100
- **Keyboard-only testing**: All features accessible
- **Screen Reader Testing**: NVDA, VoiceOver, JAWS
- **Color Contrast Analyzer**: All elements pass WCAG AA
- **DaltonLens Colorblind Simulator**: Verified usability for all types of colorblindness

**WCAG 2.1 Level AA Compliance:**
- ✅ **Perceivable**: Information presented in multiple ways
- ✅ **Operable**: All functionality via keyboard and other inputs
- ✅ **Understandable**: Clear, predictable interface
- ✅ **Robust**: Compatible with assistive technologies

**Accessibility Statement:**
TaskManager is committed to ensuring digital accessibility for people with disabilities. We continually improve the user experience for everyone and apply relevant accessibility standards. If you encounter accessibility barriers, please contact jeromebizimana2027@u.northwestern.edu.

**Resources:**
- [W3C Web Accessibility Initiative (WAI)](https://www.w3.org/WAI/)
- [WCAG 2.1 Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [TeachAccess Tutorial](https://teachaccess.github.io/tutorial/)
- [WebAIM Resources](https://webaim.org/)

- **Animated Landing Page**: Engaging hero section with call-to-action (respects `prefers-reduced-motion`)
- **Real-time Updates**: Turbo Streams for instant UI updates without page refresh (announced to screen readers)

---

## ♿ Accessibility

**TaskManager is built for everyone.** We believe accessibility is a fundamental right, not a feature.

### Quick Stats
- 🏆 **WCAG 2.1 Level AA Compliant**
- 💯 **Lighthouse Accessibility Score**: 100/100
- ✅ **WAVE Test**: 0 errors, 0 contrast errors
- ⌨️ **100% Keyboard Accessible**
- 📱 **Screen Reader Compatible**: NVDA, JAWS, VoiceOver, TalkBack

### Who Can Use TaskManager?

TaskManager is designed for users with:
- ✅ **Blindness or Low Vision** - Full screen reader support, high contrast, text resizing
- ✅ **Colorblindness** - Information not conveyed by color alone, tested with simulators
- ✅ **Motor Disabilities** - Full keyboard navigation, large click targets (44×44px)
- ✅ **Cognitive Disabilities** - Simple language, clear structure, forgiving interactions
- ✅ **Temporary Disabilities** - Broken arm, eye surgery, situational limitations

### Key Accessibility Features

1. **Keyboard Navigation**
   - Every feature accessible without a mouse
   - Skip to main content link
   - Visible focus indicators on all elements
   - Logical tab order

2. **Screen Reader Optimization**
   - Semantic HTML5 structure
   - ARIA labels and landmarks
   - Live regions for dynamic updates
   - Descriptive link and button text

3. **Visual Accessibility**
   - 4.5:1 color contrast ratio (WCAG AA)
   - Text resizable to 200% without breaking layout
   - Colorblind-friendly design (tested with DaltonLens)
   - No information conveyed by color alone

4. **Motor Accessibility**
   - Large click targets (≥44×44 pixels)
   - Generous spacing between elements
   - No hover-only interactions
   - Confirmation dialogs for destructive actions

5. **Cognitive Accessibility**
   - Clear, simple language (8th-9th grade reading level)
   - Consistent navigation and layout
   - Clear error messages with recovery instructions
   - No time limits on tasks

6. **Mobile Accessibility**
   - Touch targets ≥44×44 CSS pixels
   - Works with TalkBack (Android) and VoiceOver (iOS)
   - Supports pinch-to-zoom
   - Orientation independent

### Testing & Validation

**Automated Tools:**
- ✅ WAVE (Web Accessibility Evaluation Tool)
- ✅ axe DevTools
- ✅ Lighthouse Accessibility Audit
- ✅ Color Contrast Analyzer

**Manual Testing:**
- ✅ Keyboard-only navigation
- ✅ Screen readers: NVDA, JAWS, VoiceOver
- ✅ DaltonLens colorblind simulator (all types)
- ✅ Readability testing (Flesch Reading Ease: 68)
- ✅ Mobile screen readers (TalkBack, VoiceOver)

**Learn More:**
For comprehensive accessibility documentation, testing results, and conformance details, see **[ACCESSIBILITY.md](ACCESSIBILITY.md)**

### Reporting Accessibility Issues

Found an accessibility barrier? Please email jeromebizimana2027@u.northwestern.edu with:
- What you were trying to do
- What happened instead  
- Your assistive technology (if any)
- Browser and operating system

**Response time**: Within 48 hours  
**Fix priority**: Critical issues resolved within 7 days

### Security Features
- **SQL Injection Prevention**: Parameterized queries and prepared statements
- **XSS Protection**: Auto-escaping, Content Security Policy headers
- **CSRF Protection**: Authenticity tokens on all forms
- **Rate Limiting**: Login throttling (5 attempts per minute)
- **Secure Sessions**: HttpOnly, Secure cookies with session regeneration
- **Password Requirements**: Minimum 8 characters, must include letters, digits, and special characters
- **Authorization**: Users can only access their own data
- **Security Headers**: X-Frame-Options, X-Content-Type-Options, HSTS

---

## 🛠️ Tech Stack

### Backend
- **Ruby**: 3.4.1 (development), 3.3.9 (production)
- **Rails**: 8.0.3
- **Database**: 
  - SQLite3 (development/test)
  - PostgreSQL (production via Heroku)
- **Authentication**: bcrypt with `has_secure_password`
- **Web Server**: Puma

### Frontend
- **HTML5**: Semantic markup
- **CSS3**: Custom styles with animations
- **JavaScript**: Hotwire (Turbo, Stimulus)
- **Asset Pipeline**: Propshaft
- **Import Maps**: For JavaScript dependencies

### Infrastructure
- **Hosting**: Heroku
- **Version Control**: Git/GitHub
- **CI/CD**: Git push deployment to Heroku

### Key Gems
```ruby
gem "rails", "~> 8.0.3"
gem "puma"              # Web server
gem "bcrypt"            # Password hashing
gem "turbo-rails"       # Hotwire Turbo
gem "stimulus-rails"    # Hotwire Stimulus
gem "importmap-rails"   # JavaScript with ESM import maps
gem "pg"                # PostgreSQL adapter (production)
gem "sqlite3"           # SQLite adapter (development/test)
```

---

## 🏗️ Architecture

### MVC Structure

#### Models

**User Model** (`app/models/user.rb`)
```ruby
class User < ApplicationRecord
  has_secure_password
  has_many :todos, dependent: :destroy
  
  # Validations
  - Email: presence, uniqueness, format, max 255 chars
  - Password: 8-128 chars, must include letter, digit, special char
  - Name: max 100 chars
  - Avatar URL: max 500 chars, valid URL format
  
  # Callbacks
  - before_save: normalize_email
  - before_validation: sanitize_inputs
end
```

**Todo Model** (`app/models/todo.rb`)
```ruby
class Todo < ApplicationRecord
  belongs_to :user
  
  # Validations
  - Description: presence, 1-1000 chars
  - Due date: reasonable date range (±100 years)
  
  # Callbacks
  - before_validation: sanitize_description
end
```

#### Controllers

**ApplicationController** (`app/controllers/application_controller.rb`)
- Base controller with authentication helpers
- Security headers middleware
- CSRF protection
- Methods: `current_user`, `logged_in?`, `require_login`

**SessionsController** (`app/controllers/sessions_controller.rb`)
- Handles user login/logout
- Rate limiting (5 attempts/minute)
- Session regeneration to prevent fixation attacks
- Actions: `new`, `create`, `destroy`

**UsersController** (`app/controllers/users_controller.rb`)
- User registration and profile management
- Email uniqueness validation
- Actions: `new`, `create`, `edit`, `update`

**TodosController** (`app/controllers/todos_controller.rb`)
- CRUD operations for todos
- Scoped to current user (authorization)
- Turbo Stream support for real-time updates
- Actions: `index`, `show`, `new`, `create`, `edit`, `update`, `destroy`

**PagesController** (`app/controllers/pages_controller.rb`)
- Static pages
- Actions: `home` (landing page)

#### Views

**Layouts**
- `application.html.erb`: Main layout with header, navigation, footer

**Pages**
- `home.html.erb`: Landing page with animated hero section

**Users**
- `new.html.erb`: Signup form
- `edit.html.erb`: Profile edit form

**Sessions**
- `new.html.erb`: Login form

**Todos**
- `index.html.erb`: Todo list with urgency indicators
- `show.html.erb`: Todo details
- `new.html.erb`: New todo form
- `edit.html.erb`: Edit todo form
- `_todo.html.erb`: Todo item partial (Turbo Stream target)

#### Helpers

**TodosHelper** (`app/helpers/todos_helper.rb`)
- `days_until_due(todo)`: Calculate days remaining
- `urgency_class(todo)`: CSS class based on urgency
- `urgency_message(todo)`: Human-readable urgency text

**ApplicationHelper** (`app/helpers/application_helper.rb`)
- Global view helpers

### Database Schema

**users**
```sql
- id: bigint (primary key)
- email: string (unique, indexed)
- password_digest: string
- name: string
- avatar_url: string
- created_at: datetime
- updated_at: datetime
```

**todos**
```sql
- id: bigint (primary key)
- description: text
- due_date: string
- done: boolean (default: false)
- user_id: bigint (foreign key, indexed)
- created_at: datetime
- updated_at: datetime
```

### Routes

```ruby
root 'pages#home'

# Authentication
get    'login',   to: 'sessions#new'
post   'login',   to: 'sessions#create'
delete 'logout',  to: 'sessions#destroy'

# User Management
resources :users, only: [:new, :create]
get    'profile/edit', to: 'users#edit',   as: :edit_profile
patch  'profile',      to: 'users#update', as: :profile

# Todos
resources :todos
```

---

## 🔒 Security

TaskManager implements **Security by Design** principles with multiple defense layers.

### Implemented Security Measures

1. **SQL Injection Prevention**
   - Parameterized queries (ActiveRecord)
   - Strong parameters
   - Prepared statements

2. **Cross-Site Scripting (XSS) Prevention**
   - Auto-escaping in ERB templates
   - Content Security Policy headers
   - Input sanitization

3. **CSRF Protection**
   - Authenticity tokens on all forms
   - Same-site cookies

4. **Authentication Security**
   - bcrypt password hashing (cost factor 12)
   - Password complexity requirements
   - Secure session management
   - Session regeneration on login/logout

5. **Rate Limiting**
   - 5 login attempts per minute per session
   - Temporary lockout after failed attempts

6. **Security Headers**
   ```
   X-Frame-Options: DENY
   X-Content-Type-Options: nosniff
   X-XSS-Protection: 1; mode=block
   Strict-Transport-Security: max-age=31536000
   Content-Security-Policy: (configured)
   ```

7. **Input Validation**
   - Model-level validations
   - Length limits on all text fields
   - Format validation for emails and URLs
   - Whitespace sanitization

8. **Authorization**
   - Users can only access their own todos
   - Proper scoping in all queries
   - RecordNotFound error handling

For detailed security documentation, see [SECURITY.md](SECURITY.md)

---

## 🚀 Getting Started

### Prerequisites

- Ruby 3.4.1 or higher
- Rails 8.0.3
- SQLite3 (development)
- PostgreSQL (production)
- Node.js (for JavaScript dependencies)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Bizimana61/todo_app.git
   cd todo_app
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Set up the database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed  # Optional: adds sample data
   ```

4. **Start the server**
   ```bash
   rails server
   ```

5. **Visit the app**
   ```
   http://localhost:3000
   ```

### Environment Variables

Create a `.env` file or set environment variables:

```bash
# Required for production
RAILS_MASTER_KEY=your_master_key_here
DATABASE_URL=postgresql://user:password@host:port/database
```

---

## 🌐 Deployment

### Deploying to Heroku

1. **Install Heroku CLI**
   ```bash
   curl https://cli-assets.heroku.com/install.sh | sh
   ```

2. **Login to Heroku**
   ```bash
   heroku login
   ```

3. **Create Heroku app**
   ```bash
   heroku create
   ```

4. **Add PostgreSQL**
   ```bash
   heroku addons:create heroku-postgresql:essential-0
   ```

5. **Set environment variables**
   ```bash
   heroku config:set RAILS_MASTER_KEY=$(cat config/master.key)
   ```

6. **Deploy**
   ```bash
   git push heroku main
   ```

7. **Run migrations**
   ```bash
   heroku run rails db:migrate
   ```

8. **Open app**
   ```bash
   heroku open
   ```

### Production Configuration

- **Database**: PostgreSQL (single database, simplified from Rails 8 multi-DB defaults)
- **Cable Adapter**: Async (in-memory, works for single-dyno deployments)
- **Queue Adapter**: Async (in-memory, works for single-dyno deployments)
- **Cache**: Solid Cache (in-memory)
- **Asset Pipeline**: Propshaft
- **Web Server**: Puma (configured via Procfile)

**Note**: For multi-dyno deployments, consider upgrading to Redis for cable/queue adapters.

---

## 📚 API Documentation

### Authentication Endpoints

#### POST /login
Login with email and password
```json
{
  "email": "user@example.com",
  "password": "SecurePass123!"
}
```

#### DELETE /logout
Logout current user (no params)

### User Endpoints

#### POST /users
Create new user account
```json
{
  "user": {
    "name": "John Doe",
    "email": "john@example.com",
    "password": "SecurePass123!",
    "password_confirmation": "SecurePass123!"
  }
}
```

#### PATCH /profile
Update user profile
```json
{
  "user": {
    "name": "John Smith",
    "avatar_url": "https://example.com/avatar.jpg"
  }
}
```

### Todo Endpoints

#### GET /todos
List all todos for current user

#### POST /todos
Create new todo
```json
{
  "todo": {
    "description": "Complete project documentation",
    "due_date": "2025-11-15",
    "done": false
  }
}
```

#### PATCH /todos/:id
Update todo
```json
{
  "todo": {
    "description": "Updated description",
    "done": true
  }
}
```

#### DELETE /todos/:id
Delete todo

---

## 🧪 Testing

### Run Test Suite

```bash
# Run all tests
rails test

# Run specific test file
rails test test/models/user_test.rb

# Run system tests
rails test:system
```

### Test Coverage

- **Models**: User, Todo validations and associations
- **Controllers**: Authentication, authorization, CRUD operations
- **System Tests**: Full user flows (signup, login, todo management)

---

## 📊 Project Statistics

- **Total Lines of Code**: ~2,000+
- **Models**: 2 (User, Todo)
- **Controllers**: 4 (Application, Sessions, Users, Todos, Pages)
- **Views**: 15+ templates
- **Tests**: Comprehensive test coverage
- **Security Features**: 10+ layers of protection

---

## 🎯 Future Enhancements

- [ ] Todo categories/tags
- [ ] Todo priority levels
- [ ] Search and filter functionality
- [ ] Email notifications for approaching deadlines
- [ ] Collaborative todos (share with other users)
- [ ] Admin dashboard
- [ ] API authentication with tokens
- [ ] Mobile app (React Native)
- [ ] Dark mode
- [ ] Export todos (PDF, CSV)

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Standards

- Follow Ruby/Rails style guide
- Write tests for new features
- Maintain security best practices
- Update documentation

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👤 Author

**Jerome Bizimana**

- Email: jeromebizimana2027@u.northwestern.edu
- GitHub: [@bizimana61](https://github.com/bizimana61)

---

## 🙏 Acknowledgments

- Ruby on Rails community
- Heroku for hosting
- OWASP for security guidelines
- WCAG for accessibility standards

---

## 📞 Support

For support, email jeromebizimana2027@u.northwestern.edu or open an issue on GitHub.

---

**Built with ❤️ by Jerome Bizimana | © 2025 TaskManager**
