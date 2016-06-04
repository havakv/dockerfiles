python << EOF
import os
import sys

#path = "/opt/conda/lib/python3.5/site-packages"
path = "/opt/conda/envs/python2/lib/python2.7/site-packages"

if not path in sys.path:
    sys.path.insert(0, path)
EOF

