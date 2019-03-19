# @author Guillemain.
import torch.nn as nn
import torch.nn.functional as F
#import sys

# Déclaration de la classe pour le réseau de neurones

class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(3, 10, 3) # 30
        self.pool = nn.MaxPool2d(2, 2) #15
        self.conv2 = nn.Conv2d(10, 20, 2) #14 -> pool -> 7
        self.conv3 = nn.Conv2d(20, 30, 2) # 7 -> 6 -> pool -> 3  
        self.fc1 = nn.Linear(9*30, 100)
        self.fc2 = nn.Linear(100, 70)
        self.fc3 = nn.Linear(70, 30)
        self.fc4 = nn.Linear(30, 10) 

    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        x = self.pool(F.relu(self.conv2(x)))
        x = self.pool(F.relu(self.conv3(x)))
        x = x.view(-1, 9*30)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = F.relu(self.fc3(x))
        x = self.fc4(x)
        return x