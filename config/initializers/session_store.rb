# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_team_session',
  :secret      => '819b5dbc30ebd2039cc1b8476278a553b52b3e02564106bd2cf8dd36fd453f64d123b32c1ef76489087c7d5fad89b5c98f6f2d53baae75e4380695008c5719e2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
