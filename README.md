# README


# TestRuby
Configurations :

 1- base de données :
 
    /config/database.rb 
   
    ==> paramétres de connexion  à la base de données
     
 2- faire la migration :  
 
    rails db:miragte

Tests de fonctionalités :

 1- en utilisant le navigateur :

    Ajout : http://localhost:3000/users/new 
    Affichage : http://localhost:3000/test/user_id 

 2- en utilisant un client pour tester les Api :

    POST : http://localhost:3000/api/v1/webservice
    GET : http://localhost:3000/api/v1/test/user_id



