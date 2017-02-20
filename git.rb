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