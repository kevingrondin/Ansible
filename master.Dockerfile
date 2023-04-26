FROM geerlingguy/docker-debian11-ansible

RUN apt-get update && apt-get install -y sshpass vim python net-tools telnet curl