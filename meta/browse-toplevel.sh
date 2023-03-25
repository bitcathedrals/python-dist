#! /bin/bash

cat >packages.html <<HEAD
<!DOCTYPE html>
<html>
  <body>
HEAD

cat >packages-browse.html <<HEAD
<!DOCTYPE html>
<html>
  <body>
    <h1>python.codermattie.net Python Package Repository</h1>

    <p>
      repository URL = http://python.codermattie.net/simple , with trusted-host = python.codermattie.net
    </p>

    <ul>
HEAD

for project in $(ls remote)
do
  repo_path=`basename "${project}"`

  echo "<a href=\"/${repo_path}/\">${repo_path}</a>" >>packages.html

  echo "<li><a href=\"http://python.codermattie.net/simple/${repo_path}/browse.html\">${repo_path}</a></li>" >>packages-browse.html done

cat >>packages.html <<TAIL
  </body>
</html>
TAIL

cat >>packages-browse.html <<TAIL
    </ul>
  </body>
</html>
TAIL

  aws s3 cp packages.html s3://python.codermattie.net/simple/index.html --profile root
  aws s3 cp packages-browse.html s3://python.codermattie.net/simple/browse.html --profile root
done
