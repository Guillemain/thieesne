# Initialiser 2 listes pour compter les images dans chaque classe

_, predicted = torch.max(outputs, 1)

# Afficher les classes réelles et les classes estimées
# Définition des 10 noms de classes (chiffres)
class_names = ('airplane', 'automobile', 'bird', 'cat', 'deer', 'dog', 'frog', 'horse', 'ship', 'truck')


testloader = torch.utils.data.DataLoader(testset, batch_size=16, shuffle=False, num_workers=2)
class_total = list(0. for i in range(10))
class_correct = list(0. for i in range(10))
# Estimation des classes pour des groupes de 16 images (taille du mini-batch)

# Initialiser les compteurs du nombre d'images et de bonnes estimations
total = 0
correct = 0

# On utilise à nouveau un DataLoader pour créer des batches de données de test
testloader = torch.utils.data.DataLoader(testset, batch_size=20, shuffle=False, num_workers=2)

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
print('Précision du réseau sur les 10000 images de test : %2d %%' % (100.0 * correct / total))

#######################


for data in testloader:   
    images, labels = data
    outputs = net(images)
    _, predicted = torch.max(outputs, 1)
    c = (predicted == labels).squeeze()
    for i in range(4):
        label = labels[i]
        class_correct[label] += c[i].item()
        class_total[label] += 1     
for i in range(10):
    print('Précision de la classe %5s : %2d %%' % (class_names[i], 100 * class_correct[i] / class_total[i]))

