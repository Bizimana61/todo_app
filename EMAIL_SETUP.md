# Email Setup for Password Reset

## Gmail Setup (Recommended for Development)

### Step 1: Create a Gmail App Password

1. Go to your Google Account: https://myaccount.google.com/
2. Select **Security** from the left menu
3. Under "How you sign in to Google", select **2-Step Verification** (you must enable this first)
4. At the bottom, select **App passwords**
5. Select app: **Mail**
6. Select device: **Other (Custom name)**
7. Enter name: **TaskManager**
8. Click **Generate**
9. Copy the 16-character password (no spaces)

### Step 2: Set Environment Variables

Create a `.env` file in the root of your project:

```bash
# .env
GMAIL_USERNAME=your.email@gmail.com
GMAIL_APP_PASSWORD=your-16-char-app-password
```

### Step 3: Install dotenv gem

Add to your Gemfile:

```ruby
gem 'dotenv-rails', groups: [:development, :test]
```

Then run:

```bash
bundle install
```

### Step 4: Restart Rails Server

```bash
rails s
```

### Step 5: Test Password Reset

1. Go to http://localhost:3000/password_resets/new
2. Enter your email
3. Check your inbox (and spam folder)
4. Email should arrive within 5-30 seconds

---

## Alternative: Letter Opener (View Emails in Browser)

For development without actually sending emails:

### Step 1: Add to Gemfile

```ruby
gem 'letter_opener', group: :development
```

### Step 2: Bundle Install

```bash
bundle install
```

### Step 3: Configure (config/environments/development.rb)

```ruby
config.action_mailer.delivery_method = :letter_opener
config.action_mailer.perform_deliveries = true
```

### Step 4: Test

When you request a password reset, the email will open in your browser automatically!

---

## Production Setup (Heroku)

For production, use a service like:

### Option 1: SendGrid (Free tier: 100 emails/day)

1. Add SendGrid addon:
   ```bash
   heroku addons:create sendgrid:starter
   ```

2. Configure in `config/environments/production.rb`:
   ```ruby
   config.action_mailer.delivery_method = :smtp
   config.action_mailer.smtp_settings = {
     address: 'smtp.sendgrid.net',
     port: 587,
     domain: 'heroku.com',
     user_name: ENV['SENDGRID_USERNAME'],
     password: ENV['SENDGRID_PASSWORD'],
     authentication: 'plain',
     enable_starttls_auto: true
   }
   ```

### Option 2: Mailgun (Free tier: 5,000 emails/month)

1. Sign up at https://www.mailgun.com/
2. Get your SMTP credentials
3. Set Heroku config vars:
   ```bash
   heroku config:set MAILGUN_SMTP_LOGIN=your-login
   heroku config:set MAILGUN_SMTP_PASSWORD=your-password
   ```

---

## Troubleshooting

### Email not arriving?

1. **Check spam folder** - Reset emails often go to spam
2. **Check Gmail app password** - Make sure you copied it correctly
3. **Check Rails logs** - Look for SMTP errors
4. **Check firewall** - Port 587 must be open
5. **Wait 1-2 minutes** - Sometimes there's a delay

### Gmail blocking sign-in?

- Make sure 2-Step Verification is enabled
- Use App Password, not your regular password
- Check "Less secure app access" is OFF (use App Password instead)

### Still not working?

Use Letter Opener for development (see alternative above) - it's easier for testing!

---

## Email Delivery Times

- **Development (Gmail)**: 5-30 seconds
- **Production (SendGrid/Mailgun)**: Instant to 30 seconds
- **During high load**: Up to 5 minutes

---

## Security Notes

- ✅ Never commit `.env` file to Git (add to `.gitignore`)
- ✅ Use environment variables for all credentials
- ✅ Use App Passwords for Gmail, never your main password
- ✅ Rotate credentials regularly
- ✅ Use different credentials for development and production
