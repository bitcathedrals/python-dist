#! /bin/bash

cat >packages.html <<HEAD
<!DOCTYPE html>
<html>
  <body>
HEAD

for project in $(ls remote)
do
  repo_path=`basename "${project}"`

  echo "<a href=\"/${repo_path}/\">${repo_path}</a>" >>packages.html
done

cat >>packages.html <<TAIL
  </body>
</html>
TAIL

aws s3 cp packages.html s3://bitcathedrals.com/simple/index.html --profile root