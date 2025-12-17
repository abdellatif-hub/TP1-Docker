# 🐳 TP Docker — Installation et manipulation d’Ubuntu

> **Objectif :** Réaliser un TP complet sur Docker sous Windows : installation, manipulation d’un conteneur Ubuntu, création d’une image personnalisée avec Dockerfile et gestion de la persistance des données avec les volumes.

---

## 📌 Table des matières

* [Objectifs](#-objectifs)
* [Prérequis](#-prérequis)
* [Organisation du TP](#-organisation-du-tp)
* [Partie 1 — Installation & vérification de Docker](#-partie-1--installation--vérification-de-docker)
* [Partie 2 — Manipulation d’un conteneur Ubuntu](#-partie-2--manipulation-dun-conteneur-ubuntu)
* [Partie 3 — Dockerfile & image personnalisée](#-partie-3--dockerfile--image-personnalisée)
* [Partie 4 — Volumes & persistance des données](#-partie-4--volumes--persistance-des-données)
* [Conclusion](#-conclusion)

---

## 🎯 Objectifs

* Installer et vérifier Docker Desktop sous Windows
* Télécharger et lancer un conteneur Ubuntu
* Exécuter des commandes Linux dans un conteneur
* Créer un Dockerfile simple
* Construire une image Docker personnalisée
* Comprendre la différence entre **image** et **conteneur**
* Utiliser les **volumes Docker** pour la persistance des données

---

## 🧰 Prérequis

* Windows 10 ou 11
* Docker Desktop installé
* WSL2 activé
* Connaissances de base en Linux (apt, ls, cd)

---

## 🗂 Organisation du TP

* **Partie 1** : Installation & vérification Docker
* **Partie 2** : Manipulation d’un conteneur Ubuntu
* **Partie 3** : Dockerfile & création d’image
* **Partie 4** : Volumes & persistance

---

## 🔹 Partie 1 — Installation & vérification de Docker

### 1️⃣ Activation de WSL2

```bash
wsl --install
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

➡️ Redémarrage du système requis.




<img width="2559" height="1116" alt="image" src="https://github.com/user-attachments/assets/b7bbc913-6d9b-4bfe-aff3-a058e09ab185" />



---

### 2️⃣ Vérification de Docker

```bash
docker version
docker info
```

<img width="2559" height="1331" alt="image" src="https://github.com/user-attachments/assets/9ea1193c-2bf2-42a5-95a6-01546248757d" />


---

## 🔹 Partie 2 — Manipulation d’un conteneur Ubuntu

### 3️⃣ Téléchargement de l’image Ubuntu

```bash
docker pull ubuntu:22.04
```

📸 **Capture — docker pull**

```
[ Capture ici ]
```

---

### 4️⃣ Lancement du conteneur Ubuntu

```bash
docker run -it --name tp-ubuntu ubuntu:22.04 /bin/bash
```

---

### 5️⃣ Installation des outils Linux

```bash
apt update && apt install -y vim net-tools
```

📸 **Capture — Installation outils**

```
[ Capture ici ]
```

---

### 6️⃣ Adresse IP du conteneur

```bash
ifconfig
```

📸 **Capture — Adresse IP**

```
[ Capture ici ]
```

---

### 7️⃣ Gestion du conteneur

```bash
docker ps
docker ps -a
```

📌 **Différence :**

* `docker ps` : conteneurs en cours d’exécution
* `docker ps -a` : tous les conteneurs (actifs + arrêtés)

---

### 8️⃣ Test de persistance sans volume

```bash
echo "Bonjour Docker" > /root/msg.txt
```

📸 **Capture — Fichier créé**

```
[ Capture ici ]
```

---

## 🔹 Partie 3 — Dockerfile & image personnalisée

### 9️⃣ Création du Dockerfile

```dockerfile
FROM ubuntu:22.04
RUN apt update && apt install -y apache2
RUN echo "Site Docker TP" > /var/www/html/index.html
CMD ["apache2ctl", "-D", "FOREGROUND"]
```

📸 **Capture — Dockerfile**

```
[ Capture ici ]
```

---

### 🔟 Construction de l’image

```bash
docker build -t tp-apache .
```

---

### 1️⃣1️⃣ Lancement du conteneur Apache

```bash
docker run -d -p 8080:80 --name web tp-apache
```

📸 **Capture — Navigateur localhost:8080**

```
[ Capture ici ]
```

---

## 🔹 Partie 4 — Volumes & persistance des données

### 1️⃣2️⃣ Création d’un volume

```bash
docker volume create tpdata
```

---

### 1️⃣3️⃣ Conteneur avec volume

```bash
docker run -it --name voltest -v tpdata:/data ubuntu:22.04 /bin/bash
echo "Données persistantes" > /data/test.txt
```

📸 **Capture — Données dans le volume**

```
[ Capture ici ]
```

---

### 1️⃣4️⃣ Suppression et test de persistance

```bash
docker rm -f voltest
docker run -it --name voltest2 -v tpdata:/data ubuntu:22.04 /bin/bash
cat /data/test.txt
```

📌 **Résultat :** Les données sont conservées grâce au volume Docker.

---

## ✅ Conclusion

Ce TP a permis de comprendre les bases essentielles de Docker :

* Manipulation des conteneurs
* Création d’images personnalisées
* Gestion de la persistance des données

Docker facilite le déploiement, la portabilité et la gestion des applications.


