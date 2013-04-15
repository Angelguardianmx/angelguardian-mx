# Servers
role :web,  '192.168.50.4'
role :app,  '192.168.50.4'
role :db,   '192.168.50.4', :primary => true
