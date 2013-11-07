dirlist=`find . -maxdepth 1 -type d ! -iname ".*" -print | egrep -v ^./[0-9]{4}-[0-9]{2}`
IFS=$'\n'       # make newlines the only separator
set -f          # disable globbing
for dir in $dirlist
do
        echo $dir
        date_dir=`stat $dir  |grep Modify |  awk '{ print $2}'| cut -f1,2 -d'-'`
        [[ -d $date_dir ]] || mkdir -p $date_dir
        if [[ -d $date_dir ]]
        then
                echo 'move '$dir' to '$date_dir
                mv -f $dir $date_dir
        else
                echo  $date_dir 'creat failed'
        fi
done
