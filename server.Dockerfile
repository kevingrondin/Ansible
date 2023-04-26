# Utiliser une image plus récente d'Ubuntu
FROM ubuntu:20.04

# Installer les paquets nécessaires en une seule étape et nettoyer le cache pour réduire la taille de l'image
RUN apt-get update && \
    apt-get install -y openssh-server vim python3 net-tools telnet && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Configurer SSH
RUN mkdir /var/run/sshd && \
    echo 'root:ansible' | chpasswd && \
    sed -i 's/#\?\(PermitRootLogin\s*\).*$/\1 yes/' /etc/ssh/sshd_config && \
    sed -i 's/#\?\(PasswordAuthentication\s*\).*$/\1 yes/' /etc/ssh/sshd_config && \
    sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# Rendre les variables d'environnement visibles
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Exposer le port SSH et définir la commande par défaut
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]