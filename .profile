#
# Your previous .profile  (if any) is saved as .profile.mpsaved
# Setting the path for MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

test -r /sw/bin/init.sh && . /sw/bin/init.sh

if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
