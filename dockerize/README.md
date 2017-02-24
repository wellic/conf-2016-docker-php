- Setup/Init:
    docker-compose config
    docker-compose up

- Workflow:
    - copy your sources 
        git clone git://... src/www/newApp

    - create newApp.conf for nginx and setup
        - cp services/nginx/configs/sites-enabled/existed.conf services/nginx/configs/sites-enabled/newApp.conf
        - edit services/nginx/configs/sites-enabled/newApp.conf:
             servername APP_LOCAL_HOST_NAME;
             root /var/www/newApp;
    - Add dev host to /etc/hosts oh host-machine:
        - sudo vi /etc/hosts
            127.0.0.1 APP_LOCAL_HOST_NAME

- Start/restart after changes:
    - restart web_app containers
        docker-compose up
    - safe restart Nginx (if necessary)
        docker exec -it dev_web_app nginx -s reload
    - safe restart php-fpm (if necessary)
        docker exec -it dev_php sudo pkill -o -SIGUSR2 php-fpm

- Browser:
    http://APP_LOCAL_HOST_NAME:8888/

- View DB:
    mysql --host=app1 --port=33306 --user=root --password=root
