function varargout = gui(varargin)
% GUI M-file for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 24-Apr-2016 16:25:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browseb.
function browseb_Callback(hObject, eventdata, handles)
global file
global sound
[filename filepath] = uigetfile({'*.wav'},'Select a Speech');

fullpath = strcat(filepath,filename);
file = fullpath;  
set(handles.pathf,'String', fullpath )
sound = wavread(file);
%p = plot(sound);
%set(handles.axis1,'plot',p);
axes(handles.axes1)
plot(sound)
% hObject    handle to browseb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function frequencyf_Callback(hObject, eventdata, handles)
% hObject    handle to frequencyf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of frequencyf as text
%        str2double(get(hObject,'String')) returns contents of frequencyf as a double


% --- Executes during object creation, after setting all properties.
function frequencyf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frequencyf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in playb.
function playb_Callback(hObject, eventdata, handles)
global file

fr = str2num(get(handles.frequencyf,'String'));
sound =wavread(file);
wavplay(sound,fr);
% hObject    handle to playb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function overlapf_Callback(hObject, eventdata, handles)
% hObject    handle to overlapf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of overlapf as text
%        str2double(get(hObject,'String')) returns contents of overlapf as a double


% --- Executes during object creation, after setting all properties.
function overlapf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to overlapf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function framesizef_Callback(hObject, eventdata, handles)
% hObject    handle to framesizef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of framesizef as text
%        str2double(get(hObject,'String')) returns contents of framesizef as a double


% --- Executes during object creation, after setting all properties.
function framesizef_CreateFcn(hObject, eventdata, handles)
% hObject    handle to framesizef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
global win

%cont = cellstr(get(handles.popupmenu1,'String'));
choice = get(handles.popupmenu1,'String');%cont{get(handles.popupmenu1,'String')};
if(strcmp(choice,'(1).Rectangular'))
    win = 1; 
elseif(strcmp(choice,'(2).Hamming'))
    win = 2;
elseif(strcmp(choice,'(3).Hanning'))
    win = 3;
end
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in frammingb.
function frammingb_Callback(hObject, eventdata, handles)
global win
global file
global fram_mat
global over_lap
global frame_size

choice = get(handles.popupmenu1,'String');%cont{get(handles.popupmenu1,'String')};
if(strcmp(choice,'(1).Rectangular'))
    win = 1
elseif(strcmp(choice,'(2).Hamming'))
    win = 2
elseif(strcmp(choice,'(3).Hanning'))
    win = 3
end
over_lap = str2num(get(handles.overlapf,'String'))
frame_size = str2num(get(handles.framesizef,'String'))

fram_mat = framming_data(file,frame_size,over_lap,win)
%axes(handles.axes1)
%plot(fram_mat)


% hObject    handle to frammingb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in energyb.
function energyb_Callback(hObject, eventdata, handles)
global fram_mat
global en
en = energy(fram_mat)
plot(en)
% hObject    handle to energyb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in zerocrossingb.
function zerocrossingb_Callback(hObject, eventdata, handles)
global fram_mat
global zc
zc = zero_crosing(fram_mat)
axes(handles.axes1)
plot(zc)
% hObject    handle to zerocrossingb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function clipf_Callback(hObject, eventdata, handles)
% hObject    handle to clipf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of clipf as text
%        str2double(get(hObject,'String')) returns contents of clipf as a double


% --- Executes during object creation, after setting all properties.
function clipf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to clipf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in clipb.
function clipb_Callback(hObject, eventdata, handles)
global fram_mat
ClipRate = str2num(get(handles.clipf,'String'));
aut_corr(fram_mat,ClipRate)
% hObject    handle to clipb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in specb.
function specb_Callback(hObject, eventdata, handles)
global wi
global frame_size
global over_lap
global file
global choice
%label = get(handles.popupmenu2,'String');

%if (strcmp(label,'Narrow Band'))
 %   choice = 1 
%elseif(strcmp(label,'Wide Band'))
 %   choice = 2 
%end
%axes(handles.axes1)
new_d(file,1)
% hObject    handle to specb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
global choice
label = get(handles.popupmenu2,'String');

if (strcmp(label,'Narrow Band'))
    choice = 1 ;
elseif(strcmp(label,'Wide Band'))
    choice = 2 ;
end

% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)

% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
global file
new_d(file,2)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in endpointb.
function endpointb_Callback(hObject, eventdata, handles)
global file
global frame_size
global over_lap
boundry(file,frame_size,over_lap)
% hObject    handle to endpointb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


