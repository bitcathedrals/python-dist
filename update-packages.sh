#! /bin/bash



for subdir in $(find remote -type d -depth 1 -print)
do
    project=`basename ${subdir}`
    echo "project is $project"

    cat >${project}.html <<HEAD
<!DOCTYPE html>
<html>
  <body>
HEAD

    for file in $(find ${subdir} -type f -depth 1 -print)
    do
      sha256=`sha256sum ${file} | tr -s ' ' | cut -d ' ' -f 1`
      name=`basename ${file}`

      echo >>${project}.html "<a href=\"/${project}/${name}#sha256=${sha256}\">${name}</a>"
    done


    cat >>${project}.html <<TAIL
  </body>
</html>
TAIL

    aws s3 cp ${project}.html "s3://bitcathedrals.com/simple/${project}/index.html" --profile root
done


