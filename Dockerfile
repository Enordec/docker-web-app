# Utilisez une image Nginx officielle en tant qu'image de base
FROM nginx:latest

# Créez un répertoire pour le jeu
WORKDIR /usr/share/nginx/html/game

# Ajoutez du code de jeu (exemple simple)
RUN echo "\
<html>\
<head>\
    <title>Mini Jeu</title>\
    <script>\
        function changeColor() {\
            var colors = ['red', 'green', 'blue', 'yellow', 'purple'];\
            var randomColor = colors[Math.floor(Math.random() * colors.length)];\
            document.body.style.backgroundColor = randomColor;\
        }\
    </script>\
</head>\
<body>\
    <h1>Bienvenue dans le mini-jeu!</h1>\
    <button onclick='changeColor()'>Changer la couleur</button>\
</body>\
</html>" > index.html

# Copiez la configuration Nginx personnalisée
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exposez le port 80 pour accéder au serveur web
EXPOSE 80
