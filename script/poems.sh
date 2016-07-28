cat <<EOF
<html>
  <head>
    <title>Owen's Garden</title>
    <style>
      ul { display: inline-block; margin-right: 20px; float: left; }
      .poem { display: none; }
      .poem:target { display: inline-block; }
    </style>
  </head>
  <body>
    <h1>Owen's Garden</h1>
    <h2>Poems and Proems</h2>
    <ul>
EOF

(for f in poems/*; do
  echo "      <li><a href='#$(basename $f)'>$(head -n 1 "$f")</a></li>"
done) # | sort -t'>' -k3

cat <<EOF
    </ul>
EOF

for f in poems/*; do
  awk '
    BEGIN {
      print "    <div id='$(basename $f)' class=poem>"
    }

    NR == 1 {
      printf "      <h3>%s</h3>\n", $0
      printf "      <p>\n"
    }

    NR >= 3 {
      printf "        %s<br>\n", $0
    }

    END {
      print "      </p>"
      print "    </div>"
    }
  ' $f
done

cat <<EOF
  </body>
</html>
EOF
