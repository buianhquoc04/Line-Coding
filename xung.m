
function varargout = xung(varargin)
% XUNG MATLAB code for xung.fig
%      XUNG, by itself, creates a new XUNG or raises the existing
%      singleton*.
%
%      H = XUNG returns the handle to a new XUNG or the handle to
%      the existing singleton*.
%
%      XUNG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in XUNG.M with the given input arguments.
%
%      XUNG('Property','Value',...) creates a new XUNG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before xung_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to xung_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help xung

% Last Modified by GUIDE v2.5 18-Mar-2025 14:34:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @xung_OpeningFcn, ...
                   'gui_OutputFcn',  @xung_OutputFcn, ...
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


% --- Executes just before xung is made visible.
function xung_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to xung (see VARARGIN)

% Choose default command line output for xung
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes xung wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = xung_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
a=round(rand(1,1));
b=round(rand(1,1));
c=round(rand(1,1));
d=round(rand(1,1));
e=round(rand(1,1));
f=round(rand(1,1));
g=round(rand(1,1));
h=round(rand(1,1));
i0=round(rand(1,1));
j0=round(rand(1,1));
ran=[a,b,c,d,e,f,g,h,i0,j0];
a = str2num (get(handles.bit1,'String'));
b = str2num (get(handles.bit2,'String'));
c = str2num (get(handles.bit3,'String'));
d = str2num (get(handles.bit4,'String'));
e = str2num (get(handles.bit5,'String'));
f = str2num (get(handles.bit6,'String'));
g = str2num (get(handles.bit7,'String'));
h = str2num (get(handles.bit8,'String'));
i0 = str2num (get(handles.bit9,'String'));
j0= str2num (get(handles.bit10,'String'));
 
%-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
handles.bits=[a,b,c,d,e,f,g,h,i0,j0];
cod=get(handles.popupmenu1,'Value');
switch cod
    case 1
        hold off;
        h=handles.bits;
        n=1;
        h(11)=1;
        while n<=10;
            t=n-1:0.001:n;
        if h(n) == 0
            if h(n+1)==0  
                y=(t>n);
            else
                y=(t==n);
            end
            d=plot(t,y);title('Code UNIPOLAR NRZ');grid on
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        else
            if h(n+1)==0
                y=(t<n)-0*(t==n);
            else
                y=(t<n)+1*(t==n);
            end
            d=plot(t,y);title('Code UNIPOLAR NRZ');grid on;
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        end
        n=n+1;
        end
    case 2
        hold off;
        h =handles.bits;
        n=1;
        h(11)=1;
        while n<=10;
            t=n-1:0.001:n;
        if h(n) == 0
            if h(n+1)==0  
                y=-(t<n)-(t==n);
            else
                y=-(t<n)+(t==n);
            end
            d=plot(t,y);title('Code POLAR NRZ');grid on
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        else
            if h(n+1)==0
                y=(t<n)-1*(t==n);
            else
                y=(t<n)+1*(t==n);
            end
            d=plot(t,y);title('Code POLAR NRZ');grid on;
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        end
        n=n+1;
        end
        
    case 3
        hold off;
        h =handles.bits;
        n=1;
        h(11)=1;
        while n<=10;
            t=n-1:0.001:n;
        %Graficación de los CEROS (0)
            if h(n) == 0
                if h(n+1)==0  
                    y=(t>n);
                else
                    y=(t==n);
                end
            d=plot(t,y);title('Code UNIPOLAR RZ');grid on
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        %Graficación de los UNOS (1)
            else
            if h(n+1)==0
                y=(t<n-0.5);
            else
                y=(t<n-0.5)+1*(t==n);
            end
            d=plot(t,y);title('Code UNIPOLAR RZ');grid on;
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
            end
        n=n+1;
         
        end
        
    case 4
        hold off;
        h =handles.bits;
        n=1;
        h(11)=1;
        while n<=10;
            t=n-1:0.001:n;
        if h(n) == 0
            if h(n+1)==0  
                y=-(t<n-0.5)-(t==n);
            else
                y=-(t<n-0.5)+(t==n);
            end
            d=plot(t,y);title('Code POLAR RZ');grid on
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        else
            if h(n+1)==0
                y=(t<n-0.5)-1*(t==n);
            else
                 y=(t<n-0.5)+1*(t==n);
            end
            d=plot(t,y);title('Code POLAR RZ');grid on;
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        end
        n=n+1;
        end
 
    case 5
        hold off;
        h =handles.bits;
        n=1;
        h(11)=1;
        ami=-1;
        while n<=10;
            t=n-1:0.001:n;
        if h(n) == 0
            if h(n+1)==0  
                y=(t>n);
            else
                if ami==1
                    y=-(t==n);
                else
                    y=(t==n);
                end
            end
            d=plot(t,y);title('Code AMI NRZ');grid on
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        else
            ami=ami*-1;
            if h(n+1)==0
                if ami==1
                    y=(t<n);
                else
                    y=-(t<n);
                end
            else
                if ami==1
                    y=(t<n)-(t==n);
                else
                    y=-(t<n)+(t==n);
                end
            end
            d=plot(t,y);title('Code AMI NRZ');grid on;
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        end
        n=n+1;
        end
 
    case 6
        hold off;
        h =handles.bits;
        n=1;
        h(11)=1;
        ami=-1;
        while n<=10;
            t=n-1:0.001:n;
        if h(n) == 0
            if h(n+1)==0  
                y=(t>n);
            else
                if ami==1
                    y=-(t==n);
                else
                    y=(t==n);
                end
            end
            d=plot(t,y);title('Code AMI RZ');grid on
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        else
            ami=ami*-1;
            if h(n+1)==0
                if ami==1
                    y=(t<n-0.5);
                else
                    y=-(t<n-0.5);
                end
            else
                if ami==1
                    y=(t<n-0.5)-(t==n);
                else
                    y=-(t<n-0.5)+(t==n);
                end
            end
            d=plot(t,y);title('Code AMI RZ');grid on;
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        end
        n=n+1;
        end
 
    case 7
        hold off;
        h =handles.bits;
        h=~h;
        n=1;
        h(11)=1;
        while n<=10;
            t=n-1:0.001:n;
        if h(n) == 0 
            if h(n+1)==0  %00
                y=(t<n)-2*(t<n-0.5)- 1*(t==n);
            else %01
                y=(t<n)-2*(t<n-0.5)+1*(t==n);
            end
            d=plot(t,y);title('Code MANCHESTER');grid on
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        else
            if h(n+1)==0 %10
                y=-(t<n)+2*(t<n-0.5)-1*(t==n);
            else %11
                y=-(t<n)+2*(t<n-0.5)+1*(t==n);
            end
            d=plot(t,y);title('Code MANCHESTER');grid on;
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        end
        n=n+1;
        end
    case 8
    hold off;
    h = handles.bits;  
    n = 1;
    
    h(11) = 1;  % Đảm bảo không lỗi index
    
    % Trạng thái ban đầu (có thể là 1 hoặc -1)
    current_state = 1;
    
    while n <= 10
        t = n-1:0.001:n;  % Trục thời gian cho mỗi bit
        
        if h(n) == 0
            % Bit 0 -> Chuyển trạng thái đầu bit
            current_state = -current_state;
        end
        
        if h(n+1) == 0
            y = current_state * (t < n) - 2 * current_state * (t < n-0.5) - current_state * (t == n);
        else
            y = current_state * (t < n) - 2 * current_state * (t < n-0.5) + current_state * (t == n);
        end
        
        d = plot(t, y);
        title('Differential Manchester Encoding');
        grid on;
        set(d, 'LineWidth', 2.5);
        hold on;
        axis([0 10 -1.5 1.5]);
        
        % Cập nhật trạng thái cho bit tiếp theo
        current_state = -current_state;
        
        n = n + 1;
    end
   case 9
    hold off;
    h = handles.bits;
    n = 1;
    h(11) = 1; % Để tránh lỗi truy cập ngoài mảng
    last_polarity = 1; % Lưu cực tính của bit '1' trước đó
    ones_count = 0; % Đếm số bit '1' giữa các mã V
    
    while n <= 10
        t = n-1:0.001:n;
        
        if h(n) == 1
            % Đảo cực tính của bit '1' (theo AMI)
            last_polarity = -last_polarity;
            y = last_polarity * (t < n);
            ones_count = ones_count + 1; % Đếm số bit 1
        else
            % Kiểm tra chuỗi 4 bit 0 liên tiếp
            if n <= 7 && all(h(n:n+3) == 0)
                if mod(ones_count, 2) == 0
                    % Nếu số bit '1' trước đó là chẵn -> mã hóa thành B00V
                    h(n) = last_polarity;  % B
                    h(n+3) = last_polarity; % V
                else
                    % Nếu số bit '1' trước đó là lẻ -> mã hóa thành 000V
                    h(n+3) = -last_polarity; % V
                end
                % Đánh dấu các bit đã thay đổi
                h(n+1) = 0;
                h(n+2) = 0;
                
                % Cập nhật y cho đoạn mã hóa HDB3
                y = h(n) * (t < n) + h(n+3) * (t == n+3);
                
                % Bỏ qua 3 bit tiếp theo vì đã xử lý
                n = n + 3;
            else
                % Nếu chỉ là một bit 0 thông thường
                y = 0 * (t < n);
            end
        end
        
        % Vẽ tín hiệu
        d = plot(t, y);
        title('Code HDB3'); grid on;
        set(d, 'LineWidth', 2.5);
        hold on;
        axis([0 10 -1.5 1.5]);
        
        n = n + 1;
    end
    
end

% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
a=round(rand(1,1));
b=round(rand(1,1));
c=round(rand(1,1));
d=round(rand(1,1));
e=round(rand(1,1));
f=round(rand(1,1));
g=round(rand(1,1));
h=round(rand(1,1));
i0=round(rand(1,1));
j0=round(rand(1,1));
ran=[a,b,c,d,e,f,g,h,i0,j0];
set(handles.bit1,'String',ran(1));
set(handles.bit2,'String',ran(2));
set(handles.bit3,'String',ran(3));
set(handles.bit4,'String',ran(4));
set(handles.bit5,'String',ran(5));
set(handles.bit6,'String',ran(6));
set(handles.bit7,'String',ran(7));
set(handles.bit8,'String',ran(8));
set(handles.bit9,'String',ran(9));
set(handles.bit10,'String',ran(10));
 
%-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
handles.bits=[a,b,c,d,e,f,g,h,i0,j0];
cod=get(handles.pushbutton1,'Value');
switch cod
    case 1
        
        hold off;
        h=handles.bits;
        n=1;
        h(11)=1;
        tic;
        
        while n<=10;
            t=n-1:0.001:n;
        if h(n) == 0
            if h(n+1)==0  
                y=(t>n);
            else
                y=(t==n);
            end
            d=plot(t,y);title('Code UNIPOLAR NRZ');grid on
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        else
            if h(n+1)==0
                y=(t<n)-0*(t==n);
            else
                y=(t<n)+1*(t==n);
            end
            d=plot(t,y);title('Code UNIPOLAR NRZ');grid on;
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        end
        n=n+1;
        end
    case 2
        hold off;
        h =handles.bits;
        n=1;
        h(11)=1;
        while n<=10;
            t=n-1:0.001:n;
        if h(n) == 0
            if h(n+1)==0  
                y=-(t<n)-(t==n);
            else
                y=-(t<n)+(t==n);
            end
            d=plot(t,y);title('Code POLAR NRZ');grid on
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        else
            if h(n+1)==0
                y=(t<n)-1*(t==n);
            else
                y=(t<n)+1*(t==n);
            end
            d=plot(t,y);title('Code POLAR NRZ');grid on;
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        end
        n=n+1;
        end
        
    case 3
        hold off;
        h =handles.bits;
        n=1;
        h(11)=1;
        while n<=10;
            t=n-1:0.001:n;
        %Graficación de los CEROS (0)
            if h(n) == 0
                if h(n+1)==0  
                    y=(t>n);
                else
                    y=(t==n);
                end
            d=plot(t,y);title('Code UNIPOLAR RZ');grid on
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        %Graficación de los UNOS (1)
            else
            if h(n+1)==0
                y=(t<n-0.5);
            else
                y=(t<n-0.5)+1*(t==n);
            end
            d=plot(t,y);title('Code UNIPOLAR RZ');grid on;
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
            end
        n=n+1;
         
        end
        
    case 4
        hold off;
        h =handles.bits;
        n=1;
        h(11)=1;
        while n<=10;
            t=n-1:0.001:n;
        if h(n) == 0
            if h(n+1)==0  
                y=-(t<n-0.5)-(t==n);
            else
                y=-(t<n-0.5)+(t==n);
            end
            d=plot(t,y);title('Code POLAR RZ');grid on
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        else
            if h(n+1)==0
                y=(t<n-0.5)-1*(t==n);
            else
                 y=(t<n-0.5)+1*(t==n);
            end
            d=plot(t,y);title('Code POLAR RZ');grid on;
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        end
        n=n+1;
        end
 
    case 5
        hold off;
        h =handles.bits;
        n=1;
        h(11)=1;
        ami=-1;
        while n<=10;
            t=n-1:0.001:n;
        if h(n) == 0
            if h(n+1)==0  
                y=(t>n);
            else
                if ami==1
                    y=-(t==n);
                else
                    y=(t==n);
                end
            end
            d=plot(t,y);title('Code AMI NRZ');grid on
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        else
            ami=ami*-1;
            if h(n+1)==0
                if ami==1
                    y=(t<n);
                else
                    y=-(t<n);
                end
            else
                if ami==1
                    y=(t<n)-(t==n);
                else
                    y=-(t<n)+(t==n);
                end
            end
            d=plot(t,y);title('Code AMI NRZ');grid on;
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        end
        n=n+1;
        end
 
    case 6
        hold off;
        h =handles.bits;
        n=1;
        h(11)=1;
        ami=-1;
        while n<=10;
            t=n-1:0.001:n;
        if h(n) == 0
            if h(n+1)==0  
                y=(t>n);
            else
                if ami==1
                    y=-(t==n);
                else
                    y=(t==n);
                end
            end
            d=plot(t,y);title('Code AMI RZ');grid on
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        else
            ami=ami*-1;
            if h(n+1)==0
                if ami==1
                    y=(t<n-0.5);
                else
                    y=-(t<n-0.5);
                end
            else
                if ami==1
                    y=(t<n-0.5)-(t==n);
                else
                    y=-(t<n-0.5)+(t==n);
                end
            end
            d=plot(t,y);title('Code AMI RZ');grid on;
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        end
        n=n+1;
        end
 
    case 7
        hold off;
        h =handles.bits;
        h=~h;
        n=1;
        h(11)=1;
        while n<=10;
            t=n-1:0.001:n;
        if h(n) == 0 
            if h(n+1)==0  %00
                y=(t<n)-2*(t<n-0.5)- 1*(t==n);
            else %01
                y=(t<n)-2*(t<n-0.5)+1*(t==n);
            end
            d=plot(t,y);title('Code MANCHESTER');grid on
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        else
            if h(n+1)==0 %10
                y=-(t<n)+2*(t<n-0.5)-1*(t==n);
            else %11
                y=-(t<n)+2*(t<n-0.5)+1*(t==n);
            end
            d=plot(t,y);title('Code MANCHESTER');grid on;
            set(d,'LineWidth',2.5);
            hold on;
            axis([0 10 -1.5 1.5]);
        end
        n=n+1;
        end
        
    case 8
    hold off;
    h = handles.bits;  
    n = 1;
    h(11) = 1;  % Đảm bảo không lỗi index
    
    % Trạng thái ban đầu (có thể là 1 hoặc -1)
    current_state = 1;
    
    while n <= 10
        t = n-1:0.001:n;  % Trục thời gian cho mỗi bit
        
        if h(n) == 0
            % Bit 0 -> Chuyển trạng thái đầu bit
            current_state = -current_state;
        end
        
         if h(n+1) == 0
            y = current_state * (t < n) - 2 * current_state * (t < n-0.5) - current_state * (t == n);
        else
            y = current_state * (t < n) - 2 * current_state * (t < n-0.5) + current_state * (t == n);
        end
        
        d = plot(t, y);
        title('Differential Manchester Encoding');
        grid on;
        set(d, 'LineWidth', 2.5);
        hold on;
        axis([0 10 -1.5 1.5]);
        
        % Cập nhật trạng thái cho bit tiếp theo
        current_state = -current_state;
        
        n = n + 1;
    end
    
    
end

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
photinhieu;
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
close;
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function bit1_Callback(hObject, eventdata, handles)
% hObject    handle to bit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bit1 as text
%        str2double(get(hObject,'String')) returns contents of bit1 as a double


% --- Executes during object creation, after setting all properties.
function bit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bit2_Callback(hObject, eventdata, handles)
% hObject    handle to bit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bit2 as text
%        str2double(get(hObject,'String')) returns contents of bit2 as a double


% --- Executes during object creation, after setting all properties.
function bit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bit3_Callback(hObject, eventdata, handles)
% hObject    handle to bit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bit3 as text
%        str2double(get(hObject,'String')) returns contents of bit3 as a double


% --- Executes during object creation, after setting all properties.
function bit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bit4_Callback(hObject, eventdata, handles)
% hObject    handle to bit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bit4 as text
%        str2double(get(hObject,'String')) returns contents of bit4 as a double


% --- Executes during object creation, after setting all properties.
function bit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bit5_Callback(hObject, eventdata, handles)
% hObject    handle to bit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bit5 as text
%        str2double(get(hObject,'String')) returns contents of bit5 as a double


% --- Executes during object creation, after setting all properties.
function bit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bit6_Callback(hObject, eventdata, handles)
% hObject    handle to bit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bit6 as text
%        str2double(get(hObject,'String')) returns contents of bit6 as a double


% --- Executes during object creation, after setting all properties.
function bit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bit7_Callback(hObject, eventdata, handles)
% hObject    handle to bit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bit7 as text
%        str2double(get(hObject,'String')) returns contents of bit7 as a double


% --- Executes during object creation, after setting all properties.
function bit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bit8_Callback(hObject, eventdata, handles)
% hObject    handle to bit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bit8 as text
%        str2double(get(hObject,'String')) returns contents of bit8 as a double


% --- Executes during object creation, after setting all properties.
function bit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bit9_Callback(hObject, eventdata, handles)
% hObject    handle to bit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bit9 as text
%        str2double(get(hObject,'String')) returns contents of bit9 as a double


% --- Executes during object creation, after setting all properties.
function bit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bit10_Callback(hObject, eventdata, handles)
% hObject    handle to bit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bit10 as text
%        str2double(get(hObject,'String')) returns contents of bit10 as a double


% --- Executes during object creation, after setting all properties.
function bit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
