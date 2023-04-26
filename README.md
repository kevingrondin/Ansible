# Ansible

* server.Dockerfile: Dockerfile pour chaque serveur (web, db, lb ...)
* docker-compose.yml: Fichier de configuration pour docker-compose
* master.Dockerfile: Container ou on va entrer nos ligne de commande pour lancer ansible

* ansible/condig/ansible.cfg: Fichier de configuration d'ansible ( ici on a enlever le host_key_checking pour ne pas avoir a accepter la clé ssh du serveur )
* ansible/hosts: Notre Inventaire ( liste des serveurs ) avec groupes et variables

## Premier lancement

````shell
docker-compose up -d --scale web=5
````

On attache ensuite un shell à notre container master

````shell
docker exec -it devops-master bash
````

On lance ensuite la commande ansible pour vérifier que tout fonctionne

````shell
# On peut remplacer all par un groupe ou un serveur, ou plusieur groupe ou serveur avec une virgule comme séparateur
ansible all -m ping
````

## Exemple avec les modules

````shell
ansible all -m apt -a "name=nginx state=latest"
````

## Creer deux role

````shell
ansible-galaxy init web
````

```shell
ansible-galaxy init mysql
```

## Lancer un playbook

````shell
ansible-playbook lamp.yml
````



