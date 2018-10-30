%% Initialize workspace
clear;
clc;
clf;

%% Load in data
data = csvread('CFPTotalNew.csv');

myYL = data(:, 1);
myXL = data(:, 2);
myStadL = data(:, 3);
myRank = data(:, 4);
myOutState = data(:, 5);
realIDs = data(:, 6);

myY = zscore(myYL) .* 1.1;
myX = zscore(myXL) .* 1.7;
myStad = zscore(myStadL) ./ 10;
myRank = zscore(data(:, 4)) ./ 2 ;
myOutState = zscore(myOutState) * 0.1;

%% Set parameters for k-means
numClusters = 5;
convergenceCrit = 0.0002;
maxIter = 50;
centerIDs = [1 2 3 4 5];

%% Run kMeans Test
deltaCost = 100;
oldfinalCost = 0;
iterCount = 0;

%Set cluster centers
clusterCenter(1, 1) = mean(myX(1:14));
clusterCenter(1, 2) = mean(myY(1:14));
clusterCenter(1, 3) = mean(myStad(1:14));
clusterCenter(1, 4) = mean(myRank(1:14));
clusterCenter(1, 5) = mean(myOutState(1:14));

clusterCenter(2, 1) = mean(myX(15:28));
clusterCenter(2, 2) = mean(myY(15:28));
clusterCenter(2, 3) = mean(myStad(15:28));
clusterCenter(2, 4) = mean(myRank(15:28));
clusterCenter(2, 5) = mean(myOutState(15:28));

clusterCenter(3, 1) = mean(myX(29:37));
clusterCenter(3, 2) = mean(myY(29:37));
clusterCenter(3, 3) = mean(myStad(29:37));
clusterCenter(3, 4) = mean(myRank(29:37));
clusterCenter(3, 5) = mean(myOutState(29:37));

clusterCenter(4, 1) = mean(myX(38:49));
clusterCenter(4, 2) = mean(myY(38:49));
clusterCenter(4, 3) = mean(myStad(38:49));
clusterCenter(4, 4) = mean(myRank(38:49));
clusterCenter(4, 5) = mean(myOutState(38:49));

clusterCenter(5, 1) = mean(myX(50:64));
clusterCenter(5, 2) = mean(myY(50:64));
clusterCenter(5, 3) = mean(myStad(50:64));
clusterCenter(5, 4) = mean(myRank(50:64));
clusterCenter(5, 5) = mean(myOutState(50:64));

%Create cost function
myCost = @(x2, y2, x1, y1, sS, sSC, rank, rankCen) 1.0 * sqrt((x2 - x1).^2) + .1 * sqrt((y2 - y1).^2) + 0.1 * sqrt((sS - sSC).^2)  + 0.1 * sqrt((rank - rankCen).^2);
myID = kmeans([myX myY myStad myRank myOutState], [], 'Start', clusterCenter);  
myID = myID';
    
plot(4,-5, 'r.', 4, -5, 'bx', 4, -5, 'c+', 4, -5, 'mp', 4, -5, 'g*')
ylim([-3 3])
legend({'ACC', 'Big 10', 'Big 12', 'Pac 12', 'SEC'}, 'Position', [0.18 0.18 0.1 0.1], 'AutoUpdate', 'off')
hold on


for k = 1:length(myX)
    if(myID(k) == 1)
        plot(myX(k), myY(k), 'r.')
    elseif(myID(k) == 2)
        plot(myX(k), myY(k), 'bx')
    elseif(myID(k) == 3)
        plot(myX(k), myY(k), 'c+')
    elseif(myID(k) == 4)
        plot(myX(k), myY(k), 'mp')
    else
        plot(myX(k), myY(k), 'g*')
    end
end
ACC = myID(1:14);
Big10 = myID(15:28);
Big12 = myID(29:38);
Pac12 = (myID(39:50));
SEC = (myID(51:64));






%% Error
myCount = 0;
for k = 1:64
    if(myID(k) == realIDs(k))
        myCount = myCount + 1;
    end
end

percentCorrect = myCount / k

set(gca, 'Xdir', 'reverse')
title('Final Clustering')
xlabel('Longitude')
ylabel('Latitude')
% 

 saveas(gcf, 'EndFig.png')



