# Inclure torch
import torch
# Inclure torchvision
import torchvision
# Inclure torchvision.transforms abrégé transforms
import torchvision.transforms as transforms
import numpy as np
from matplotlib import pyplot as plt
# Déclaration de 'transform' pour convertir en tenseur et normaliser
transform = transforms.Compose(
    [transforms.ToTensor(), # Conversion en tenseur
     transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))]) # Normalisation

# Base de données d'entraînement
trainset = torchvision.datasets.CIFAR10(root='~/../../mnt/n7fs/ens/tp_carlier/data', train=True, download=True, transform=transform)
# Version hors réseau N7 : A UTILISER SUR VOTRE MACHINE PERSONNELLE (va télécharger les données)
# trainset = torchvision.datasets.CIFAR10(root='./data', train=True, download=True, transform=transform)

# Base de données de test
testset = torchvision.datasets.CIFAR10(root='~/../../mnt/n7fs/ens/tp_carlier/data', train=False, download=True, transform=transform)
# Version hors réseau N7 : A UTILISER SUR VOTRE MACHINE PERSONNELLE (va télécharger les données)
# testset = torchvision.datasets.CIFAR10(root='./data', train=False, download=True, transform=transform)

def show_image(im):
    
    # Remettre en forme de l'image entre 0 et 1 avec la bonne taille
    im_npy = im.numpy().transpose(1, 2, 0) * 0.5 + 0.5
    # Affecter le nom de classe de l'image comme titre 
    # Afficher l'image en niveaux de gris
    plt.imshow(im_npy[:,:,0], cmap='gray') 
    # Masquer les axes
    plt.axis('off')

# show_image(trainset[45][0])
# plt.show()
