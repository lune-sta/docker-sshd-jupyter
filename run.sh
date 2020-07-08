#/bin/bash

/usr/sbin/sshd
jupyter notebook --ip=0.0.0.0 --allow-root --no-browser --NotebookApp.token="jupyter"
