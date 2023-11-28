#!/bin/bash

# check to make sure we have an argument
# if not message/exit
# Check if root user (whoami)
# if root user then
#  iterate over the list of groups
#   check if group exists (getent group wordpress)
#    if not, 
#       create group (groupadd)
#       message/notify user (echo)
#    if does exist, do nothing
#   check if folder exists (-d "directory")
#    if not, then 
#      create directory (mkdir)
#      message/notify user     
#    else do nothing
#   
#  apply ownership to dir. (chown root:$group)
#  apply permissions to directory (chmod u+rwx,g+rwx,o-rwx)
#  
#  add helpdesk group to permissions (setfacl --modify g:$group:rx 

# if not root user, then message/exit


#echo "enter an argument"
groups=('Sales'
'HumanResources'
'TechnicalOperations'
'Helpdesk'
'Research')

rootdir=$1
if [ -z "$rootdir"  ]; then
  echo 
  echo "Creates a department folder structure at the specified location."
  echo "  Usage: $0 <root folder>"
  echo 
  exit 1
fi

user=`whoami`
if [ "$user" != "root" ]; then
  echo "Root Required."
  exit 1
fi

for group in ${groups[*]}; do
  echo "processing group: $group..."
  getent group $group

done
