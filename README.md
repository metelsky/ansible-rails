# Vagrant Rails

This will provision a Rails box suitable for production use running Nginx, Unicorn and
Postgres on a cloud Ubuntu server or local Vagrant environment.

It should allow you to have a development environment that is identical to your production environment
## Stack

+ Rails
+ Nginx
+ Unicorn
+ Rbenv
+ Node.js
+ Postgres

## Use

A demo site called "blog" is included as an example which is just a default Rails 4 project.

By default the vagrant box mounts this site at /var/www/blog

For local Vagrant development

```
vagrant up && ./bootstrap.sh
ssh deploy@192.168.33.10
cd /var/www/blog && bundle && bundle exec unicorn
```

The example site should now be running on Unicorn via port 8080 on your local machine.

An example NGINX and Unicorn config can be seen in 

```
blog/config/nginx.conf
blog/config/unicorn.rb
```

## Advanced / Troubleshooting

Set file permissions on /var/www

```
sudo adduser deploy www-data
sudo chown -R www-data:www-data /var/www
sudo chmod -R g+rw /var/www
```

Configure nginx

```
sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/sites-available/default
sudo ln -s /var/www/sitename/current/config/nginx.conf /etc/nginx/sites-enabled/sitename.com
sudo ln -s /var/www/sitename/current/config/nginx.conf /etc/nginx/sites-available/sitename.com
sudo service nginx restart
```

Run the production unicorn config

```
cd /var/www/sitename/current
rbenv exec bundle exec unicorn -c config/unicorn.rb -D -E production
```