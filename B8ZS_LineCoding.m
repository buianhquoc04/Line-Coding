clc; clear; close all;

% Dữ liệu đầu vào
input_bits = input('Nhap chuoi bit vao: ');

% Mã hóa B8ZS
encoded_signal = b8zs_encode(input_bits);

% Vẽ tín hiệu
figure;
stairs(0:length(encoded_signal)-1, encoded_signal, 'LineWidth', 2);
ylim([-2 2]);
xlim([0 length(encoded_signal)]);
yticks([-1 0 1]);
grid on;
xlabel('Bit Index');
ylabel('Voltage Level');
title('B8ZS Line Coding');

% Hàm mã hóa B8ZS
function encoded = b8zs_encode(bits)
    prev_polarity = -1; % Dấu của bit '1' cuối cùng
    encoded = zeros(1, length(bits)); % Khởi tạo tín hiệu đầu ra
    
    i = 1;
    while i <= length(bits)
        if bits(i) == 1
            % AMI: Bit '1' có dấu luân phiên
            prev_polarity = -prev_polarity;
            encoded(i) = prev_polarity;
        elseif i <= length(bits) - 7 && all(bits(i:i+7) == 0)
            % Phát hiện 8 bit '0' liên tiếp (00000000) → thay thế bằng 000VB0VB
            V = prev_polarity;     % V
            
            encoded(i) =  0;
            encoded(i+1) = 0;
            encoded(i+2) = 0;
            encoded(i+3) = V;   % Violation
            encoded(i+4) = -V;   % Bipolar
            encoded(i+5) = 0;
            encoded(i+6) = -V;   % Violation
            encoded(i+7) = V;   % Bipolar
            prev_polarity= -encoded(i+7);

            % Sau khi thay thế, bit '1' tiếp theo vẫn phải đảo dấu
            prev_polarity = -prev_polarity;

            % Bỏ qua 7 bit tiếp theo vì đã thay thế
            i = i + 7;
        else
            % Nếu số lượng bit '0' ít hơn 8, giữ nguyên mức 0V
            encoded(i) = 0;
        end
        i = i + 1;
    end
end
