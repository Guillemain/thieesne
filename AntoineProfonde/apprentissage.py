import torch.optim as optim
# Initialiser le réseau en appelant la classe 'Net'
net = Net()
# Choisir la fonction de coût entropie croisée
criterion = nn.CrossEntropyLoss()
# Choisir pour optimiseur le modèle de descente de gradient stochastique
# L'optimiseur gère l'hyperparamètre de taux d'apprentissage "lr" (learning rate) et celui de mémoire
optimizer = optim.SGD(net.parameters(), lr=0.01, momentum=0.9)
# Objet qui définit un itérateur sur la base de données, en extrayant des mini-batches dans un ordre aléatoire
trainloader = torch.utils.data.DataLoader(trainset, batch_size=10, shuffle=True, num_workers=2)
# Le nombre d'epochs maximal définit le nombre de passages complets sur la base de données d'entraînement
epoch_max = 20
for epoch in range(epoch_max):

    # On ne va afficher le risque empirique que tous les 200 mini-batches
    running_J = 0.0
    
    for i, data in enumerate(trainloader):
        
        # Récupération les données d'entrée (mini-batch)
        inputs, labels = data
        
        # Vectorisation des images pour les fournir en entrée du réseau
        # Noter que la première dimension de 'images' correspond aux nombres d'images, la seconde au nombre de canaux 
        # par images, et ce sont seulement les 3ème et 4ème qui correspondent aux dimensions spatiales d'une image
        ##inputs = inputs.reshape(inputs.shape[0],inputs.shape[1],1024)      
        # Pb en entrée -> une image pas un vecteur
        # Remise à zéro des gradients
        optimizer.zero_grad()

        # Passe "forward" pour calculer la prédiction du réseau 
        outputs = net(inputs)
        
        # Calculer la fonction objectif J pour un mini-batch (fonction de coût)
        J = criterion(outputs, labels)
        
        # Rétro-propagation du gradient
        J.backward()
        optimizer.step()

        # Incrémenter la valeur de la fonction objectif globale
        running_J += J.item()

        # Afficher les statistiques tous les 200 mini-batches
        if (i+1) % 200 == 0:
            print('[Epoch %d, après %5d mini-batches] > J = %.3f' % (epoch+1, i+1, running_J / 200))
            running_J = 0.0

print('Entraînement terminé')
