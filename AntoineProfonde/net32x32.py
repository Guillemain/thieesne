# @author Guillemain.
import torch.nn as nn
import torch.nn.functional as F
#import sys

# Déclaration de la classe pour le réseau de neurones

class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
                            # (Length channel, size outpout, kernel) 
        self.conv1 = nn.Conv2d(3, 10, 3) 
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(10, 6, 3)
        self.conv3 = nn.Conv2d(6, 1, 3)
        self.fc1 = nn.Linear(25*6, 16) 
        self.fc2 = nn.Linear(16, 10)
        self.fc3 = nn.Linear(10, 10) 

    def forward(self, x):
        x = F.relu(self.conv1(x))
        x = self.pool1(x)
        x = F.relu(self.conv2(x))
        x = self.pool2(x)
        x = x.view(-1, 6 * 5 * 5)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = F.relu(self.fc3(x))
        return x