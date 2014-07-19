SITE="blog"

sudo chown -R deploy:www-data ~/.rbenv
sudo adduser deploy www-data
sudo chown -R deploy:www-data /var/www/blog
sudo chmod -R g+rw /var/www

## NGINX
sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/sites-available/default
sudo ln -s /var/www/$SITE/current/config/nginx.conf /etc/nginx/sites-enabled/$SITE
sudo ln -s /var/www/$SITE/current/config/nginx.conf /etc/nginx/sites-available/$SITE
sudo service nginx restart

cd /var/www/$SITE/
bundle && bundle exec unicorn