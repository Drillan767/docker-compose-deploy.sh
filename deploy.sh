# usage : './deploy.sh your_project
# Requires your process to be able to log into your VPS via SSH keys and run that command

if [[ $1 == "your_project" ]]; then
    echo "==== Changing directory ===="
    cd /specific/project/directory/of/yours
    echo "==== Pulling newer image... ====="
    docker-compose pull web
    echo "==== Switching images... ===="
    docker-compose up -d --remove-orphans web
    echo "==== Cleaning up... ===="
    docker image prune --force
    echo "=== Executing post installation commands ===="
    docker-compose exec -T web php artisan storage:link
    echo "==== *DONE* ===="
fi
