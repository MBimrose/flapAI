function runFlapAIF(handles)

switch handles.gammaValue.Value
    case 1
        gamma = 1.0;
    case 2
        gamma = .8;
    case 3
        gamma = .6;
    case 4
        gamma = .4;
    case 5
        gamma = .2;
end

flappybird(60,5,gamma);