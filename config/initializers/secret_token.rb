# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Journal::Application.config.secret_key_base = 'ca87494262115f66a451559b9818af753b4db5a9ac28031707fe027d6c569d1f65e9049eb8ab406ba02a6b6653c4366c58c45c28400d895b6d4d4d167f23c470'
