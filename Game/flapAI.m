function varargout = flapAI(varargin)
% FLAPAI MATLAB code for flapAI.fig
%      FLAPAI, by itself, creates a new FLAPAI or raises the existing
%      singleton*.
%
%      H = FLAPAI returns the handle to a new FLAPAI or the handle to
%      the existing singleton*.
%
%      FLAPAI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FLAPAI.M with the given input arguments.
%
%      FLAPAI('Property','Value',...) creates a new FLAPAI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before flapAI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to flapAI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help flapAI

% Last Modified by GUIDE v2.5 26-Apr-2017 10:53:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @flapAI_OpeningFcn, ...
                   'gui_OutputFcn',  @flapAI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before flapAI is made visible.
function flapAI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to flapAI (see VARARGIN)

% Choose default command line output for flapAI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes flapAI wait for user response (see UIRESUME)
% uiwait(handles.runButton);

plotFlappy(handles);
graphQ(handles,'QBlank.csv');

% --- Outputs from this function are returned to the command line.
function varargout = flapAI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in alphaValue.
function alphaValue_Callback(hObject, eventdata, handles)
% hObject    handle to alphaValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns alphaValue contents as cell array
%        contents{get(hObject,'Value')} returns selected item from alphaValue

%update plot
plotFlappy(handles);


% --- Executes during object creation, after setting all properties.
function alphaValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alphaValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function trialSlider_Callback(hObject, eventdata, handles)
% hObject    handle to trialSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.trialSlider.Value = round(handles.trialSlider.Value,-2);
handles.trialText.String = num2str(round(handles.trialSlider.Value,-2));
plotFlappy(handles);

% --- Executes during object creation, after setting all properties.
function trialSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trialSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function trialText_Callback(hObject, eventdata, handles)
% hObject    handle to trialText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of trialText as text
%        str2double(get(hObject,'String')) returns contents of trialText as a double
roundTrialText = round(str2double(handles.trialText.String),-2);
if roundTrialText > 150000
    roundTrialText = 150000;
elseif roundTrialText < 0
    roundTrialText = 0;
end
handles.trialText.String = num2str(roundTrialText);
handles.trialSlider.Value = str2double(handles.trialText.String);
plotFlappy(handles);


% --- Executes during object creation, after setting all properties.
function trialText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trialText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in runButton.
function runButton_Callback(hObject, eventdata, handles)
% hObject    handle to runButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch handles.alphaValue.Value
    case 1
        alphaInput = ('1');
    case 2
        alphaInput = ('0.75');
    case 3
        alphaInput = ('0.5');
    case 4
        alphaInput = ('0.25');
    case 5
        alphaInput = ('0.1');
end

trialNum = round(handles.trialSlider.Value,-2);
plotFlappy(handles);

for i = 1:trialNum/100
    MatrixName = ([alphaInput 'Q' num2str(i*100) '.csv']);
    graphQ(handles,MatrixName);
    drawnow
end

flappybirdDisplay(alphaInput,trialNum,false);

% --- Executes on button press in bestRunButton.
function bestRunButton_Callback(hObject, eventdata, handles)
% hObject    handle to bestRunButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

graphQ(handles,'0.75Q18200.csv');
flappybirdDisplay('0.75',18200,true);
