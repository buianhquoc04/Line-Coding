function varargout = photinhieu(varargin)
% PHOTINHIEU MATLAB code for photinhieu.fig
%      PHOTINHIEU, by itself, creates a new PHOTINHIEU or raises the existing
%      singleton*.
%
%      H = PHOTINHIEU returns the handle to a new PHOTINHIEU or the handle to
%      the existing singleton*.
%
%      PHOTINHIEU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PHOTINHIEU.M with the given input arguments.
%
%      PHOTINHIEU('Property','Value',...) creates a new PHOTINHIEU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before photinhieu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to photinhieu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help photinhieu

% Last Modified by GUIDE v2.5 18-Mar-2025 20:00:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @photinhieu_OpeningFcn, ...
                   'gui_OutputFcn',  @photinhieu_OutputFcn, ...
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


% --- Executes just before photinhieu is made visible.
function photinhieu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to photinhieu (see VARARGIN)

% Choose default command line output for photinhieu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes photinhieu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = photinhieu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
xung;
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Unipolar_NRZ.
function Unipolar_NRZ_Callback(hObject, eventdata, handles)
if (hObject==handles.Unipolar_NRZ)
    hold off;
    A=sqrt(2);
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)/4*(sinc(f*Tb)).^2*(1+(1/Tb)*del);
    g=plot(f,P);
    title('ESPECTRAL DENSITY: UNIPOLAR NRZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    stem(0,(A.^2*Tb)/2,'LineWidth',2.5);hold off;
    axis([0 L 0 1.09*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{'R =';'2R'})
    set(gca,'YTickLabel',{'0.5*Tb';'Tb'})
 
elseif(hObject==handles.Polar_NRZ)
    hold off;
    A=1;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)*(sinc(f*Tb)).^2;
    g=plot(f,P);hold on;xlabel('Frequency');ylabel('Normalized Power');
    title('ESPECTRAL DENSITY: POLAR NRZ')
    axis([0 L 0 1.01*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
elseif(hObject==handles.Unipolar_RZ)
    hold off;
    A=2;
    Tb=1;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)/16*(sinc(f*Tb/2)).^2;
    g=plot(f,P);
    title('ESPECTRAL DENSITY: UNIPOLAR NRZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    stem([0 R],[(A.^2*Tb)/8 P(26)+0.1],'LineWidth',2.5);hold off;
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
elseif(hObject==handles.Polar_RZ)
    hold off;
    A=2;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    P=(A.^2*Tb)/8*(sinc(f*Tb/2)).^2.*(1-cos(2*pi*f*Tb));
    g=plot(f,P);
    title('ESPECTRAL DENSITY: POLAR RZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
else
    hold off;
    A=1;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    P=(A.^2*Tb)*(sinc(f*Tb/2)).^2.*(sin(pi*f*Tb/2)).^2;
    g=plot(f,P);
    title('ESPECTRAL DENSITY: MANCHESTER');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
end

% hObject    handle to Unipolar_NRZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Unipolar_NRZ


% --- Executes on button press in Polar_NRZ.
function Polar_NRZ_Callback(hObject, eventdata, handles)
if (hObject==handles.Unipolar_NRZ)
    hold off;
    A=sqrt(2);
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)/4*(sinc(f*Tb)).^2*(1+(1/Tb)*del);
    g=plot(f,P);
    title('ESPECTRAL DENSITY: UNIPOLAR NRZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    stem(0,(A.^2*Tb)/2,'LineWidth',2.5);hold off;
    axis([0 L 0 1.09*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{'R =';'2R'})
    set(gca,'YTickLabel',{'0.5*Tb';'Tb'})
 
elseif(hObject==handles.Polar_NRZ)
    hold off;
    A=1;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)*(sinc(f*Tb)).^2;
    g=plot(f,P);hold on;xlabel('Frequency');ylabel('Normalized Power');
    title('ESPECTRAL DENSITY: POLAR NRZ')
    axis([0 L 0 1.01*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
elseif(hObject==handles.Unipolar_RZ)
    hold off;
    A=2;
    Tb=1;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)/16*(sinc(f*Tb/2)).^2;
    g=plot(f,P);
    title('ESPECTRAL DENSITY: UNIPOLAR NRZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    stem([0 R],[(A.^2*Tb)/8 P(26)+0.1],'LineWidth',2.5);hold off;
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
elseif(hObject==handles.Polar_RZ)
    hold off;
    A=2;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    P=(A.^2*Tb)/8*(sinc(f*Tb/2)).^2.*(1-cos(2*pi*f*Tb));
    g=plot(f,P);
    title('ESPECTRAL DENSITY: POLAR RZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
else
    hold off;
    A=1;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    P=(A.^2*Tb)*(sinc(f*Tb/2)).^2.*(sin(pi*f*Tb/2)).^2;
    g=plot(f,P);
    title('ESPECTRAL DENSITY: MANCHESTER');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
end

% hObject    handle to Polar_NRZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Polar_NRZ


% --- Executes on button press in Unipolar_RZ.
function Unipolar_RZ_Callback(hObject, eventdata, handles)
if (hObject==handles.Unipolar_NRZ)
    hold off;
    A=sqrt(2);
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)/4*(sinc(f*Tb)).^2*(1+(1/Tb)*del);
    g=plot(f,P);
    title('ESPECTRAL DENSITY: UNIPOLAR NRZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    stem(0,(A.^2*Tb)/2,'LineWidth',2.5);hold off;
    axis([0 L 0 1.09*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{'R =';'2R'})
    set(gca,'YTickLabel',{'0.5*Tb';'Tb'})
 
elseif(hObject==handles.Polar_NRZ)
    hold off;
    A=1;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)*(sinc(f*Tb)).^2;
    g=plot(f,P);hold on;xlabel('Frequency');ylabel('Normalized Power');
    title('ESPECTRAL DENSITY: POLAR NRZ')
    axis([0 L 0 1.01*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
elseif(hObject==handles.Unipolar_RZ)
    hold off;
    A=2;
    Tb=1;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)/16*(sinc(f*Tb/2)).^2;
    g=plot(f,P);
    title('ESPECTRAL DENSITY: UNIPOLAR NRZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    stem([0 R],[(A.^2*Tb)/8 P(26)+0.1],'LineWidth',2.5);hold off;
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
elseif(hObject==handles.Polar_RZ)
    hold off;
    A=2;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    P=(A.^2*Tb)/8*(sinc(f*Tb/2)).^2.*(1-cos(2*pi*f*Tb));
    g=plot(f,P);
    title('ESPECTRAL DENSITY: POLAR RZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
else
    hold off;
    A=1;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    P=(A.^2*Tb)*(sinc(f*Tb/2)).^2.*(sin(pi*f*Tb/2)).^2;
    g=plot(f,P);
    title('ESPECTRAL DENSITY: MANCHESTER');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
end

% hObject    handle to Unipolar_RZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Unipolar_RZ


% --- Executes on button press in Polar_RZ.
function Polar_RZ_Callback(hObject, eventdata, handles)
if (hObject==handles.Unipolar_NRZ)
    hold off;
    A=sqrt(2);
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)/4*(sinc(f*Tb)).^2*(1+(1/Tb)*del);
    g=plot(f,P);
    title('ESPECTRAL DENSITY: UNIPOLAR NRZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    stem(0,(A.^2*Tb)/2,'LineWidth',2.5);hold off;
    axis([0 L 0 1.09*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{'R =';'2R'})
    set(gca,'YTickLabel',{'0.5*Tb';'Tb'})
 
elseif(hObject==handles.Polar_NRZ)
    hold off;
    A=1;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)*(sinc(f*Tb)).^2;
    g=plot(f,P);hold on;xlabel('Frequency');ylabel('Normalized Power');
    title('ESPECTRAL DENSITY: POLAR NRZ')
    axis([0 L 0 1.01*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
elseif(hObject==handles.Unipolar_RZ)
    hold off;
    A=2;
    Tb=1;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)/16*(sinc(f*Tb/2)).^2;
    g=plot(f,P);
    title('ESPECTRAL DENSITY: UNIPOLAR NRZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    stem([0 R],[(A.^2*Tb)/8 P(26)+0.1],'LineWidth',2.5);hold off;
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
elseif(hObject==handles.Polar_RZ)
    hold off;
    A=2;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    P=(A.^2*Tb)/8*(sinc(f*Tb/2)).^2.*(1-cos(2*pi*f*Tb));
    g=plot(f,P);
    title('ESPECTRAL DENSITY: POLAR RZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
else
    hold off;
    A=1;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    P=(A.^2*Tb)*(sinc(f*Tb/2)).^2.*(sin(pi*f*Tb/2)).^2;
    g=plot(f,P);
    title('ESPECTRAL DENSITY: MANCHESTER');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
end

% hObject    handle to Polar_RZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Polar_RZ


% --- Executes on button press in MANCHESTER.
function MANCHESTER_Callback(hObject, eventdata, handles)
if (hObject==handles.Unipolar_NRZ)
    hold off;
    A=sqrt(2);
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)/4*(sinc(f*Tb)).^2*(1+(1/Tb)*del);
    g=plot(f,P);
    title('ESPECTRAL DENSITY: UNIPOLAR NRZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    stem(0,(A.^2*Tb)/2,'LineWidth',2.5);hold off;
    axis([0 L 0 1.09*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{'R =';'2R'})
    set(gca,'YTickLabel',{'0.5*Tb';'Tb'})
 
elseif(hObject==handles.Polar_NRZ)
    hold off;
    A=1;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)*(sinc(f*Tb)).^2;
    g=plot(f,P);hold on;xlabel('Frequency');ylabel('Normalized Power');
    title('ESPECTRAL DENSITY: POLAR NRZ')
    axis([0 L 0 1.01*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
elseif(hObject==handles.Unipolar_RZ)
    hold off;
    A=2;
    Tb=1;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)/16*(sinc(f*Tb/2)).^2;
    g=plot(f,P);
    title('ESPECTRAL DENSITY: UNIPOLAR NRZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    stem([0 R],[(A.^2*Tb)/8 P(26)+0.1],'LineWidth',2.5);hold off;
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
elseif(hObject==handles.Polar_RZ)
    hold off;
    A=2;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    P=(A.^2*Tb)/8*(sinc(f*Tb/2)).^2.*(1-cos(2*pi*f*Tb));
    g=plot(f,P);
    title('ESPECTRAL DENSITY: POLAR RZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
else
    hold off;
    A=1;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    P=(A.^2*Tb)*(sinc(f*Tb/2)).^2.*(sin(pi*f*Tb/2)).^2;
    g=plot(f,P);
    title('ESPECTRAL DENSITY: MANCHESTER');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
end

% hObject    handle to MANCHESTER (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MANCHESTER


% --- Executes on button press in HDB3.
function HDB3_Callback(hObject, eventdata, handles)
if (hObject==handles.Unipolar_NRZ)
    hold off;
    A=sqrt(2);
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)/4*(sinc(f*Tb)).^2*(1+(1/Tb)*del);
    g=plot(f,P);
    title('ESPECTRAL DENSITY: UNIPOLAR NRZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    stem(0,(A.^2*Tb)/2,'LineWidth',2.5);hold off;
    axis([0 L 0 1.09*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{'R =';'2R'})
    set(gca,'YTickLabel',{'0.5*Tb';'Tb'})
 
elseif(hObject==handles.Polar_NRZ)
    hold off;
    A=1;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)*(sinc(f*Tb)).^2;
    g=plot(f,P);hold on;xlabel('Frequency');ylabel('Normalized Power');
    title('ESPECTRAL DENSITY: POLAR NRZ')
    axis([0 L 0 1.01*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
elseif(hObject==handles.Unipolar_RZ)
    hold off;
    A=2;
    Tb=1;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    del=0;
    P=(A.^2*Tb)/16*(sinc(f*Tb/2)).^2;
    g=plot(f,P);
    title('ESPECTRAL DENSITY: UNIPOLAR NRZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    stem([0 R],[(A.^2*Tb)/8 P(26)+0.1],'LineWidth',2.5);hold off;
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
elseif(hObject==handles.Polar_RZ)
    hold off;
    A=2;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    P=(A.^2*Tb)/8*(sinc(f*Tb/2)).^2.*(1-cos(2*pi*f*Tb));
    g=plot(f,P);
    title('ESPECTRAL DENSITY: POLAR RZ');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
 
elseif(hObject==handles.MANCHESTER)
    hold off;
    A=1;
    Tb=1.5;
    R=1/Tb;
    L=2*R;
    f=0:L/50:L;
    P=(A.^2*Tb)*(sinc(f*Tb/2)).^2.*(sin(pi*f*Tb/2)).^2;
    g=plot(f,P);
    title('ESPECTRAL DENSITY: MANCHESTER');
    hold on;xlabel('Frequency');ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);set(g,'LineWidth',2.5);
    set(gca,'XTickMode','manual','XTick',[R,2*R]);grid on;
    set(gca,'YTickMode','manual','YTick',[0.5*Tb,Tb]);
    set(gca,'XTickLabel',{['R'];['2R']})
    set(gca,'YTickLabel',{['0.5*Tb'];['Tb']})
else
     hold off;
    A = 1;
    Tb = 1.5;
    R = 1/Tb;
    L = 2*R;
    f = 0:L/50:L;
    P = (A^2 * Tb / 2) * (sinc(f * Tb / 2)).^2 .* (1 - cos(2 * pi * f * Tb));
    g = plot(f, P);
    title('Power Spectral Density: HDB3');
    xlabel('Frequency (Hz)');
    ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);
    set(g, 'LineWidth', 2.5);
    grid on;
    set(gca, 'XTick', [R, 2*R], 'XTickLabel', {'R', '2R'});
    set(gca, 'YTick', [0.5*Tb, Tb], 'YTickLabel', {'0.5*Tb', 'Tb'});
    hold off;
 
end

% hObject    handle to HDB3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of HDB3


% --- Executes on button press in B8ZS.
function B8ZS_Callback(hObject, eventdata, handles)
hold off;
    A = 1;
    Tb = 1.5;
    R = 1/Tb;
    L = 2*R;
    f = 0:L/50:L;
    P = (A^2 * Tb / 4) * (sinc(f * Tb / 2)).^2 .* (1 - cos(4 * pi * f * Tb));
    g = plot(f, P);
    title('Power Spectral Density: B8ZS');
    xlabel('Frequency (Hz)');
    ylabel('Normalized Power');
    axis([0 L 0 1.1*Tb]);
    set(g, 'LineWidth', 2.5);
    grid on;
    set(gca, 'XTick', [R, 2*R], 'XTickLabel', {'R', '2R'});
    set(gca, 'YTick', [0.5*Tb, Tb], 'YTickLabel', {'0.5*Tb', 'Tb'});
    hold off;
% hObject    handle to B8ZS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of B8ZS


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
close;
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
