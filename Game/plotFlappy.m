function plotFlappy(handles)

alpha1 = csvread('0.1trialScore.csv');
alpha25 = csvread('0.25trialScore.csv');
alpha50 = csvread('0.5trialScore.csv');
alpha75 = csvread('0.75trialScore.csv');
alpha100 = csvread('1trialScore.csv');

size = length(alpha1);

trials = zeros(5,size+1);

for i = 2:(size+1)
    trials(1,i) = alpha1(i-1);
    trials(2,i) = alpha25(i-1);
    trials(3,i) = alpha50(i-1);
    trials(4,i) = alpha75(i-1);
    trials(5,i) = alpha100(i-1);
end
x = linspace(0,15000,16);

averageTrials = zeros(5,16);

for i = 1:5
    for j = 2:16
        v = (j-2)*1000+1;
        w = trials(i,v:v+999);
        averageTrials(i,j) = mean(w);
    end
end

trialLine = handles.trialSlider.Value;

switch handles.alphaValue.Value
    case 1
        plot(x,averageTrials(1,:),'r:',x,averageTrials(2,:),'g:',x,averageTrials(3,:),'k:',x,averageTrials(4,:),'m:',x,averageTrials(5,:),'b-')
    case 2
        plot(x,averageTrials(1,:),'r:',x,averageTrials(2,:),'g:',x,averageTrials(3,:),'k:',x,averageTrials(4,:),'m-',x,averageTrials(5,:),'b:')
    case 3
        plot(x,averageTrials(1,:),'r:',x,averageTrials(2,:),'g:',x,averageTrials(3,:),'k-',x,averageTrials(4,:),'m:',x,averageTrials(5,:),'b:')
    case 4
        plot(x,averageTrials(1,:),'r:',x,averageTrials(2,:),'g-',x,averageTrials(3,:),'k:',x,averageTrials(4,:),'m:',x,averageTrials(5,:),'b:')
    case 5
        plot(x,averageTrials(1,:),'r-',x,averageTrials(2,:),'g:',x,averageTrials(3,:),'k:',x,averageTrials(4,:),'m:',x,averageTrials(5,:),'b:')
end

line([trialLine,trialLine],[0,7])

legend('Location','northwest','Alpha 0.1','Alpha 0.25','Alpha 0.5','Alpha 0.75','Alpha 1.0')
xlabel('Trials');
ylabel('Average Performance');
title('Alpha Manipulation');