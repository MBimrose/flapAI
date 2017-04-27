%averageFlappy.m

alpha1 = csvread('MaxQ\trialScore0.75.csv');
% alpha25 = csvread('0.25trialScore.csv');
% alpha50 = csvread('0.5trialScore.csv');
% alpha75 = csvread('0.75trialScore.csv');
% alpha100 = csvread('1trialScore.csv');

size = length(alpha1);

% trials = zeros(5,size+1);

for i = 2:(size+1)
    trials(1,i) = alpha1(i-1);
%     trials(2,i) = alpha25(i-1);
%     trials(3,i) = alpha50(i-1);
%     trials(4,i) = alpha75(i-1);
%     trials(5,i) = alpha100(i-1);
end

% averageTrials = zeros(5,16);

%for i = 1:5
    for j = 2:16
        v = (j-2)*1000+1;
        w = trials(1,v:v+999);
        averageTrials(j) = mean(w);
    end
%end

disp(averageTrials);

%csvwrite('averageTrials.csv',averageTrials);