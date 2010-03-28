# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_aidhd_session',
  :secret      => 'dd9aff1ca2f1ab6fa5133a21d2155a1a1ac1631372923616c4af97f0133479fbaef056d0c70113f3429f038f2b2435cab8afdf8ba02edc6aa79a05470157f40a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
