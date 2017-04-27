function plotFlappy(handles)

averageTrials = csvread('averageTrials.csv');

x = linspace(0,15000,16);

trialLine = handles.trialSlider.Value;

switch handles.alphaValue.Value
    case 1
        plot(x,averageTrials(1,1:16),'r:',x,averageTrials(2,1:16),'g:',x,averageTrials(3,1:16),'k:',x,averageTrials(4,1:16),'m:',x,averageTrials(5,1:16),'b-')
    case 2
        plot(x,averageTrials(1,1:16),'r:',x,averageTrials(2,1:16),'g:',x,averageTrials(3,1:16),'k:',x,averageTrials(4,1:16),'m-',x,averageTrials(5,1:16),'b:')
    case 3
        plot(x,averageTrials(1,1:16),'r:',x,averageTrials(2,1:16),'g:',x,averageTrials(3,1:16),'k-',x,averageTrials(4,1:16),'m:',x,averageTrials(5,1:16),'b:')
    case 4
        plot(x,averageTrials(1,1:16),'r:',x,averageTrials(2,1:16),'g-',x,averageTrials(3,1:16),'k:',x,averageTrials(4,1:16),'m:',x,averageTrials(5,1:16),'b:')
    case 5
        plot(x,averageTrials(1,1:16),'r-',x,averageTrials(2,1:16),'g:',x,averageTrials(3,1:16),'k:',x,averageTrials(4,1:16),'m:',x,averageTrials(5,1:16),'b:')
end

line([trialLine,trialLine],[0,7])

legend('Location','northwest','Alpha 0.1','Alpha 0.25','Alpha 0.5','Alpha 0.75','Alpha 1.0')
xlabel('Trials');
ylabel('Average Performance');
title('Alpha Manipulation');