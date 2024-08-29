#!/bin/bash

# Définit l'emplacement local
path="$(pwd)"

# Demande le nom du dossier
read -p "Entrez le nom du dossier : " folder_name

# Chemin complet
full_path="$path/$folder_name"

# Vérifie si le dossier existe
if [ -d "$full_path" ]; then
    echo "Le dossier '$folder_name' existe déjà."
else
    # Crée un dossier si il n'existe pas
    mkdir -p "$full_path"
    if [ $? -eq 0 ]; then
        echo "Dossier '$folder_name' créé avec succès."
    else
        echo "Erreur lors de la création du dossier '$folder_name'."
        exit 1
    fi
fi

# Crée le fichier collection.txt
file="$full_path/collection.txt"
touch "$file"

# Demande le nom du film
read -p "Entrez le nom du film à ajouter : " movie_name

# Ajoute le nom du film dans collection.txt
echo "$movie_name" >> "$file"
if [ $? -eq 0 ]; then
    echo "Le film '$movie_name' a été ajouté à '$file'."
else
    echo "Erreur lors de l'ajout du film '$movie_name'."
    exit 1
fi