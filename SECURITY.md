# Security Policy - TaskManager

## Security by Design Principles Implemented

This application follows Security by Design principles with multiple layers of defense.

### 1. SQL Injection Prevention ✅

**Implementation:**
- **Parameterized Queries**: All database queries use ActiveRecord's built-in parameterization
- **Strong Parameters**: Controllers use `permit()` to whitelist allowed parameters
- **No Raw SQL**: Avoided `where()` with string interpolation; used parameterized queries
- **Prepared Statements**: ActiveRecord uses prepared statements by default

**Example:**
```ruby
# SECURE: Uses parameterized query
User.find_by("lower(email) = ?", params[:email].to_s.downcase.strip)

# VULNERABLE (NOT USED): Direct string interpolation
# User.where("email = '#{params[:email]}'")  # ❌ NEVER DO THIS
```

### 2. Cross-Site Scripting (XSS) Prevention ✅

**Implementation:**
- **Auto-Escaping**: ERB templates automatically escape all user input by default
- **Content Security Policy**: Strict CSP headers prevent inline script execution
- **Input Sanitization**: All user inputs are stripped and validated before storage
- **Safe Rendering**: Uses Rails helpers that auto-escape (e.g., `<%= ... %>` not `<%== ... %>`)

**Protections:**
- `X-XSS-Protection: 1; mode=block`
- `Content-Security-Policy` with script-src restrictions
- HTML entities automatically escaped in views

### 3. Cross-Site Request Forgery (CSRF) Protection ✅

**Implementation:**
- **CSRF Tokens**: All forms include authenticity tokens
- **Verify Authenticity**: `protect_from_forgery with: :exception` in ApplicationController
- **Same-Site Cookies**: Session cookies use `same_site: :lax`

### 4. Authentication & Authorization ✅

**Implementation:**
- **Secure Password Storage**: bcrypt with `has_secure_password`
- **Password Complexity**: Enforced minimum 8 chars, letters, digits, special characters
- **Session Management**: Secure, HttpOnly session cookies
- **Authorization Checks**: Users can only access their own todos
- **Session Regeneration**: Prevents session fixation attacks

**Security Features:**
```ruby
# Password never stored in plain text
has_secure_password  # Uses bcrypt hashing

# Strong password validation
PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[A-Za-z])(?=.*[@#%$&*\^]).*\z/

# Users scoped to their own data
@todo = current_user.todos.find(params[:id])
```

### 5. Rate Limiting ✅

**Implementation:**
- **Login Throttling**: Maximum 5 login attempts per session per minute
- **Brute Force Prevention**: Temporary lockout after failed attempts
- **User Enumeration Prevention**: Generic error messages

### 6. Security Headers ✅

**Headers Set:**
```
X-Frame-Options: DENY                    # Prevents clickjacking
X-Content-Type-Options: nosniff          # Prevents MIME sniffing
X-XSS-Protection: 1; mode=block          # Legacy XSS protection
Strict-Transport-Security: max-age=...   # Forces HTTPS (production)
Content-Security-Policy: ...             # Restricts resource loading
```

### 7. Input Validation & Sanitization ✅

**Model-Level Validations:**
- Email: format validation, length limits, uniqueness
- Passwords: complexity requirements, length limits
- Todos: description length limits (1-1000 chars)
- URLs: format validation for avatar URLs
- Dates: reasonable date range validation

**Sanitization:**
```ruby
before_validation :sanitize_inputs
before_save :normalize_email

# Strips whitespace, normalizes case
self.email = email.downcase.strip
self.description = description.strip
```

### 8. Information Disclosure Prevention ✅

**Measures:**
- **Generic Error Messages**: No specific details leaked in authentication errors
- **Filtered Logs**: Passwords, tokens, and sensitive data filtered from logs
- **Custom Headers**: `X-Powered-By` doesn't reveal tech stack details
- **404 vs 403**: Consistent error handling to prevent resource enumeration

### 9. Secure Session Management ✅

**Configuration:**
- **HttpOnly Cookies**: Prevent JavaScript access
- **Secure Flag**: HTTPS-only in production
- **Session Regeneration**: New session ID on login/logout
- **Complete Logout**: `reset_session` clears all session data

### 10. Database Security ✅

**Measures:**
- **Encrypted Credentials**: `credentials.yml.enc` for sensitive config
- **Database User Scoping**: Each user sees only their own data
- **Dependent Destroy**: Cascade deletion prevents orphaned records
- **Index on Email**: Unique index prevents duplicate accounts

## Security Testing Checklist

- [x] SQL Injection: Tested with malicious input in forms
- [x] XSS: User input properly escaped in all views
- [x] CSRF: Forms include authenticity tokens
- [x] Authentication: Password requirements enforced
- [x] Authorization: Users cannot access others' todos
- [x] Session Security: Sessions properly managed
- [x] Rate Limiting: Login throttling implemented
- [x] Input Validation: All inputs validated at model level
- [x] Security Headers: All recommended headers set
- [x] Sensitive Data: Passwords/tokens filtered from logs

## Reporting Security Issues

If you discover a security vulnerability, please email: jeromebizimana2027@u.northwestern.edu

**Do not** create a public GitHub issue for security vulnerabilities.

## Security Updates

- Rails framework: Keep updated to latest stable version
- Dependencies: Regular `bundle update` for security patches
- Review: Periodic security audits with `bundle audit`

## Compliance

This application follows:
- OWASP Top 10 security guidelines
- Rails Security Guide best practices
- NIST secure coding standards

---

**Last Updated**: November 7, 2025
**Security Review**: Jerome Bizimana
