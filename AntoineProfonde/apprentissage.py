import torch.optim as optim
# Initialiser le réseau en appelant la classe 'Net'
net = Net()
# Choisir la fonction de coût entropie croisée
criterion = nn.CrossEntropyLoss()
# Choisir pour optimiseur le modèle de descente de gradient stochastique
optimizer = optim.SGD(net.parameters(), lr=0.01, momentum=0.85)
trainloader = torch.utils.data.DataLoader(trainset, batch_size=16, shuffle=True, num_workers=2)
epoch_max = 7
for epoch in range(epoch_max):

    # On ne va afficher le risque empirique que tous les 200 mini-batches
    running_J = 0.0
    
    for i, data in enumerate(trainloader):
        inputs, labels = data
        optimizer.zero_grad()
        outputs = net(inputs)
        J = criterion(outputs, labels)
        J.backward()
        optimizer.step()
        # Incrémenter la valeur de la fonction objectif globale
        running_J += J.item()
        # Afficher les statistiques tous les 200 mini-batches
        if (i+1) % 200 == 0:
            print('[Epoch %d, après %5d mini-batches] > J = %.3f' % (epoch+1, i+1, running_J / 200))
            running_J = 0.0

print('Entraînement terminé')
