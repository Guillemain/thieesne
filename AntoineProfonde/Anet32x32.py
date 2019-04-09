# @author Guillemain.
import torch.nn as nn
import torch.nn.functional as F
#import sys

# Déclaration de la classe pour le réseau de neurones
class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(3, 10, 7)
        self.pool = nn.MaxPool2d(4, 4)
        self.fc1 = nn.Linear(20 * 5 * 5, 300)
        self.fc2 = nn.Linear(300, 150)
        self.fc3 = nn.Linear(150, 50)
        self.fc4 = nn.Linear(50, 10)

    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        x = x.view(-1, 10 * 13 * 13)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = F.relu(self.fc3(x))
        x = self.fc4(x)
        return x
