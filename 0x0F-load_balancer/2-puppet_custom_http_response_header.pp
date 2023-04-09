# Install Nginx
class { 'nginx': }

# Define custom HTTP header response
nginx::config { 'custom-http-header':
  content => [
    'add_header X-Served-By $hostname;',
  ],
}

