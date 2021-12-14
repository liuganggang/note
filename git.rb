# authorized_keys

cd ~/.ssh
touch authorized_keys

git checkout QT-713
git pull
git checkout development
git pull
git checkout QT-713
git merge development
git push --set-upstream  origin QT-713
git checkout testing
git merge QT-713


# git flow

git flow init

gco develop

git flow feature start 100@LG

git flow feature finish 100@LG


git flow release start 0.1.0































































