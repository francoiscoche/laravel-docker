# laravel-docker
configuration docker for laravel project



The error I get is: UnexpectedValueException The stream or file "/var/www/storage/logs/laravel.log" could not be opened in append mode: failed to open stream: Permission denied

docker exec -it --user=root container-name chmod -R 777 /var/www/storage
