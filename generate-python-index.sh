#! /bin/bash

PACKAGES_DIR=`pwd`

cat >index.html <<TOP
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Michael Mattie's Python Package Index</title>
    </head>
      <h1>Michael Mattie's Python Package Index</h1>

      <p>
        Here is a Pipenv example file showing how to use my repository. Note that I don't
        think that asterik package versions will work with my repository as it is a s3 bucket.
        You will need to specify a specific version.
      </p>

      <pre style="margin-left: 2em;">
[[source]]
url = "https://pypi.org/simple"
verify_ssl = true
name = "pypi"

[[source]]
url = "http://bitcathedrals.com/python/"
verify_ssl = false
name = "bitcathedrals"

[dev-packages]

[packages]
numpy = "*"
json_decorator-0.0.5 = {index = "bitcathedrals"}
      </pre>

      <h2>Packages</h2>

        <ul>
TOP

(cd remote && ls * | sort | xargs -I %  echo "<li><a href="http://bitcathedrals.com/python/%">%</li>" >>${PACKAGES_DIR}/index.html)

cat >>index.html <<BOTTOM
      </ul>
    </body>
</html>
BOTTOM
