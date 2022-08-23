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

   cat >${project}-browse.html <<HEAD
<!DOCTYPE html>
<html>
  <h1>${project}</h1>
  <body>
    <ul>
HEAD

    for file in $(find ${subdir} -type f -depth 1 -print | sort)
    do
      sha256=`sha256sum ${file} | tr -s ' ' | cut -d ' ' -f 1`
      name=`basename ${file}`

      echo >>${project}.html "<a href=\"/simple/${project}/${name}#sha256=${sha256}\">${name}</a>"

      echo >>${project}-browse.html "<li><a href=\"http://python.bitcathedrals.com/simple/${project}/${name}\">${name}</a></li>"
    done

    cat >>${project}.html <<TAIL
  </body>
</html>
TAIL

   cat >>${project}-browse.html <<TAIL
    </ul>
  </body>
</html>
TAIL

    aws s3 cp ${project}.html "s3://python.bitcathedrals.com/simple/${project}/index.html" --profile root
    aws s3 cp ${project}-browse.html "s3://python.bitcathedrals.com/simple/${project}/browse.html" --profile root
done


