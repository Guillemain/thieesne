# Initialiser les compteurs du nombre d'images et de bonnes estimations
total = 0
correct = 0

# On utilise à nouveau un DataLoader pour créer des batches de données de test
testloader = torch.utils.data.DataLoader(testset, batch_size=16, shuffle=False, num_workers=2)

# Estimation des classes pour des groupes de 16 images (taille du mini-batch)
for data in testloader:
    
    # Récupérer 16 images
    images, labels = data
    
    # Vectoriser les images 
    # Passer les images dans le réseau
    outputs = net(images)
    
    # Récupérer les indices des maxima d'énergies
    _, predicted = torch.max(outputs, 1)
    
    # Incrémenter les compteurs
    total += labels.size(0)
    correct += (predicted == labels).sum().item()

# Afficher la précision de l'estimation sur tout l'ensemble de test
print("Resultat : ")
print(correct / total)