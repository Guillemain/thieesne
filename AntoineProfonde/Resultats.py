class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(3, 10, 5)
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(10, 20, 5)
        self.fc1 = nn.Linear(20 * 5 * 5, 300)
        self.fc2 = nn.Linear(300, 150)
        self.fc3 = nn.Linear(150, 50)
        self.fc4 = nn.Linear(50, 10)

    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        x = self.pool(F.relu(self.conv2(x)))
        x = x.view(-1, 20 * 5 * 5)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = F.relu(self.fc3(x))
        x = self.fc4(x)
        return x
##
# optimizer = optim.SGD(net.parameters(), lr=0.01, momentum=0.9)
# trainloader = torch.utils.data.DataLoader(trainset, batch_size=32, shuffle=True, num_workers=2)
# epoch_max = 5
# ##
Précision du réseau sur les 10000 images de test : 64 %
Précision de la classe airplane : 77 %
Précision de la classe automobile : 82 %
Précision de la classe  bird : 41 %
Précision de la classe   cat : 35 %
Précision de la classe  deer : 74 %
Précision de la classe   dog : 49 %
Précision de la classe  frog : 80 %
Précision de la classe horse : 67 %
Précision de la classe  ship : 70 %
Précision de la classe truck : 79 %



# Déclaration de la classe pour le réseau de neurones
class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(3, 7, 5)
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(7, 15, 5)
        #self.fc1 = nn.Linear(15 * 5 * 5, 300)
        self.fc2 = nn.Linear(375, 150)
        self.fc3 = nn.Linear(150, 50)
        self.fc4 = nn.Linear(50, 10)

    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        torch.nn.Dropout(0.2)
        x = self.pool(F.relu(self.conv2(x)))
        torch.nn.Dropout(0.1)
        x = x.view(-1, 15 * 5 * 5)
        #x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        torch.nn.Dropout(0.1)
        x = F.relu(self.fc3(x))
        x = self.fc4(x)
        return x
récision du réseau sur les 10000 images de test : 59 %
Précision de la classe airplane : 61 %
Précision de la classe automobile : 73 %
Précision de la classe  bird : 49 %
Précision de la classe   cat : 30 %
Précision de la classe  deer : 46 %
Précision de la classe   dog : 44 %
Précision de la classe  frog : 66 %
Précision de la classe horse : 68 %
Précision de la classe  ship : 72 %
Précision de la classe truck : 71 %


#################

class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(3, 10, 5)
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(10, 20, 5)
        self.fc1 = nn.Linear(20 * 5 * 5, 300)
        self.fc2 = nn.Linear(300, 150)
        self.fc3 = nn.Linear(150, 50)
        self.fc4 = nn.Linear(50, 10)

    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        x = self.pool(F.relu(self.conv2(x)))
        x = x.view(-1, 20 * 5 * 5)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = F.relu(self.fc3(x))
        x = self.fc4(x)
        return x
optimizer = optim.SGD(net.parameters(), lr=0.01, momentum=0.85)
trainloader = torch.utils.data.DataLoader(trainset, batch_size=16, shuffle=True, num_workers=2)
epoch_max = 7
Précision du réseau sur les 10000 images de test : 62 %
Précision de la classe airplane : 78 %
Précision de la classe automobile : 87 %
Précision de la classe  bird : 44 %
Précision de la classe   cat : 39 %
Précision de la classe  deer : 48 %
Précision de la classe   dog : 53 %
Précision de la classe  frog : 73 %
Précision de la classe horse : 68 %
Précision de la classe  ship : 60 %
Précision de la classe truck : 63 %

#########################
class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(3, 7, 5)
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(7, 12, 5)
        self.conv3 = nn.Conv2d(12, 17, 5)
        self.fc1 = nn.Linear(17 * 6 * 6, 200)
        self.fc2 = nn.Linear(200, 150)
        self.fc3 = nn.Linear(150, 50)
        self.fc4 = nn.Linear(50, 10)

    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        x = (F.relu(self.conv2(x)))
        x = (F.relu(self.conv3(x)))
        x = x.view(-1, 17 * 6 * 6)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = F.relu(self.fc3(x))
        x = self.fc4(x)
        return x
optimizer = optim.SGD(net.parameters(), lr=0.01, momentum=0.85)
trainloader = torch.utils.data.DataLoader(trainset, batch_size=16, shuffle=True, num_workers=2)
epoch_max = 7
Précision du réseau sur les 10000 images de test : 55 %
Précision de la classe airplane : 66 %
Précision de la classe automobile : 67 %
Précision de la classe  bird : 45 %
Précision de la classe   cat : 31 %
Précision de la classe  deer : 34 %
Précision de la classe   dog : 39 %
Précision de la classe  frog : 74 %
Précision de la classe horse : 62 %
Précision de la classe  ship : 75 %
Précision de la classe truck : 60 %

#########
class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(3, 7, 5)
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(7, 12, 5)
        self.fc1 = nn.Linear(12 * 5 * 5, 300)
        self.fc2 = nn.Linear(300, 150)
        self.fc3 = nn.Linear(150, 50)
        self.fc4 = nn.Linear(50, 10)

    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        x = self.pool(F.relu(self.conv2(x)))
        x = x.view(-1, 12 * 5 * 5)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = F.relu(self.fc3(x))
        x = self.fc4(x)
        return x
optimizer = optim.SGD(net.parameters(), lr=0.01, momentum=0.85)
trainloader = torch.utils.data.DataLoader(trainset, batch_size=16, shuffle=True, num_workers=2)
epoch_max = 7
Précision du réseau sur les 10000 images de test : 63 %
Précision de la classe airplane : 68 %
Précision de la classe automobile : 73 %
Précision de la classe  bird : 32 %
Précision de la classe   cat : 40 %
Précision de la classe  deer : 64 %
Précision de la classe   dog : 46 %
Précision de la classe  frog : 71 %
Précision de la classe horse : 74 %
Précision de la classe  ship : 65 %
Précision de la classe truck : 75 %
