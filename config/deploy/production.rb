# frozen_string_literal: true

set :deploy_to, '/srv/ha4db/app'
set :sshkit_backend, SSHKit::Backend::Local
server 'localhost'
