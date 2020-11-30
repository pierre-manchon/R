data(swiss) # Chargement des données swiss
nb_lignes_swiss <- nrow(swiss) # Nombre de lignes de la table swiss
nb_colonnes_swiss <- ncol(swiss) # Nombre de colonnes de la table swiss

nb_lignes_swiss # Affiche la valeur
nb_colonnes_swiss # Affiche la valeur

noms <- data(swiss) # 
noms # Affiche la valeur

head(swiss, 10) # Affiche les 10 premières lignes

swiss["Agriculture"] # Affiche toutes les lignes pour cette colonne
swiss["Education"] # Affiche toutes les lignes pour cette colonne

swiss[swiss$Infant.Mortality < 17,] # Affiche toutes les lignes qui ont une valeur de Infant.Mortality inferieure à 17

swiss[swiss$Infant.Mortality < 17, c("Agriculture", "Education")] # Affiche les lignes Agriculture et Education qui ont une valeur de Infant.Mortality inferieure à 17