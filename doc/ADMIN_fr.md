En activant zsh pour tous les utilisateurs, cela modifie les paramètres du serveur ldap.
Cela nécessite donc un redémarrage du serveur pour que cela prenne effet.

Pour modifier les plugins chargés par antigen, vous pouvez modifier le fichier **/etc/antigenrc** pour une modification globale à tous les utilisateurs.
Ou créer le fichier **.antigenrc** dans le répertoire de l'utilisateur (**/home/&lt;user&gt;**) à partir du fichier **/etc/antigenrc**