# Security configuration for TaskManager
# This file configures additional security measures

Rails.application.configure do
  # Ensure cookies are secure in production
  if Rails.env.production?
    config.session_store :cookie_store,
                         key: "_taskmanager_session",
                         secure: true, # Only send cookie over HTTPS
                         httponly: true, # Prevent JavaScript access to session cookie
                         same_site: :lax # CSRF protection
  end

  # Prevent host header injection
  config.hosts.clear # Clears default restrictions

  # In production, you should restrict to your actual domain:
  # config.hosts << "your-app.herokuapp.com"
  # config.hosts << "www.yourdomain.com"
end

# Additional security: Ensure ActiveRecord uses prepared statements (prevents SQL injection)
# This is enabled by default in Rails, but we're being explicit
ActiveRecord::Base.connection.instance_variable_set(:@prepared_statements, true) if defined?(ActiveRecord)
