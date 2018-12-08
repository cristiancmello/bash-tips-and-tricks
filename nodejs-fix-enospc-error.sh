# https://github.com/facebook/jest/issues/3254
#
#  On Linux (or Mac) we have a max number of system watchers we can place at an IO level (from my understanding).
#

echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
