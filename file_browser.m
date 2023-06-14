function varargout = file_browser(varargin)
% FILE_BROWSER MATLAB code for file_browser.fig
%      FILE_BROWSER, by itself, creates a new FILE_BROWSER or raises the existing
%      singleton*.
%
%      H = FILE_BROWSER returns the handle to a new FILE_BROWSER or the handle to
%      the existing singleton*.
%
%      FILE_BROWSER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILE_BROWSER.M with the given input arguments.
%
%      FILE_BROWSER('Property','Value',...) creates a new FILE_BROWSER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before file_browser_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to file_browser_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help file_browser

% Last Modified by GUIDE v2.5 14-Jun-2023 09:55:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @file_browser_OpeningFcn, ...
                   'gui_OutputFcn',  @file_browser_OutputFcn, ...
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


% --- Executes just before file_browser is made visible.
function file_browser_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to file_browser (see VARARGIN)

% Choose default command line output for file_browser
handles.output = hObject;
handles.plot = 0;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes file_browser wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = file_browser_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in display.
function display_Callback(hObject, eventdata, handles)
% hObject    handle to display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

disp(isfield(handles, 'folder'));
disp(handles.folder);
if isfield(handles, 'folder') & isfield(handles, 'filename')
    
    disp(strcat([handles.folder, '/',handles.filename]));
    
    if isfile(handles.filename) & handles.folder ~= "Choose a folder" 
        pass
    elseif ~isfile(handles.filename)
        f = errordlg("Please enter a valide file name.");
    elseif handles.folder == "Choose a folder"
        f = errordlg("Please choose a valid folder.");
    end

elseif ~isfield(handles, 'folder')
    f = errordlg(["You didn't choose any folder."; "Try again."]);

elseif ~isfield(handles, 'filename')
    f = errordlg(["You didn't enter any file name."; "Try again"]);
end


if handles.plot
    disp('Plotting');
else
    disp('Not plotting');
end


% --- Executes on button press in plot_radio.
function plot_radio_Callback(hObject, eventdata, handles)
% hObject    handle to plot_radio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of plot_radio
handles.plot = get(hObject, 'Value');
guidata(hObject, handles);


% --- Executes on selection change in folder.
function folder_Callback(hObject, eventdata, handles)
% hObject    handle to folder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns folder contents as cell array
%        contents{get(hObject,'Value')} returns selected item from folder
options = get(hObject, 'String');
handles.folder = options{get(hObject, 'Value')};
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function folder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to folder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function file_name_Callback(hObject, eventdata, handles)
% hObject    handle to file_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_name as text
%        str2double(get(hObject,'String')) returns contents of file_name as a double
text = get(hObject, 'String');
if text == "Enter file name"
    set(hObject, 'String', '');
end
handles.filename = text;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function file_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
