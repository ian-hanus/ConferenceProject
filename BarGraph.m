%%Initialize workspace
clear;
clc;

%% Import data
data = csvread('CFPTotalNew.csv');

myY = data(:, 1);
myX = data(:, 2);
myStad = data(:, 3);
myRank = data(:, 4);
myOutState = data(:, 5);
realIDs = data(:, 6);


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

c = categorical({'ACC', 'Big 10', 'Big 12', 'Pac 12', 'SEC'});
bar(c, clusterCenter(:, 4))
title('Football Rank')
xlabel('Conference')
ylabel('Average Rank per Conference')

saveas(gcf, 'RankBar.png')

