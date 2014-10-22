#!/bin/bash

export GIT_WORK_TREE=/var/www/html/yoursite.tld
export GIT_DIR=/var/git/yoursite.git

git --work-tree=$GIT_WORK_TREE --git-dir=$GIT_DIR checkout -f

while read oldrev newrev refname
do
    branch=$(git rev-parse --symbolic --abbrev-ref $refname)
    if [ "master" == "$branch" ]; then
        echo "updating vendors..."
        rm -rf $GIT_WORK_TREE/vendor
        cd $GIT_WORK_TREE
        export SYMFONY_ENV=prod
        composer install --optimize-autoloader
    else
        git merge $refname
        echo "skipping vendors..."
        cd $GIT_WORK_TREE
        export SYMFONY_ENV=prod
    fi
done


echo "Setting Symfony production settings..."
php app/console cache:clear --env=prod --no-debug
php app/console assetic:dump --env=prod --no-debug
