# docker-sshd-jupyter

Example of a dockerfile with sshd and jupyter notebook.

## How to use

1. Clone
```
git clone git@github.com:lune-sta/docker-sshd-jupyter.git
cd docker-sshd-jupyter
```

2. Add your public key
```
$ vim authorized_keys
# or
$ cat ~/.ssh/authorized_keys  >> ./authorized_keys
```

3. Build a docker image
```
$ sudo docker build -t jupyter .
```

4. Run in the background
```
$ sudo docker run -p 18888:8888 -p 10022:22 -v workdir:/workdir -d jupyter
```

5. Login with ssh
```
$ ssh -p 10022 -i ~/.ssh/id_rsa root@127.0.0.1
```
