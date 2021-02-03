# frozen_string_literal: true

set :deploy_to, '/srv/ha4db/app'
server 'localhost', roles: %w{web app db}
