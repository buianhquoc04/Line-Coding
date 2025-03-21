clc; clear; close all;

% Dữ liệu đầu vào
input_bits = [1 0 0 0 0 1 1 0 0 0 0 0];

% Mã hóa HDB3
encoded_signal = hdb3_encode(input_bits);

% Vẽ tín hiệu
figure;
stairs(0:length(encoded_signal)-1, encoded_signal, 'LineWidth', 2);
ylim([-2 2]);
xlim([0 length(encoded_signal)]);
yticks([-1 0 1]);
grid on;
xlabel('Bit Index');
ylabel('Voltage Level');
title('HDB3 Line Coding');

% Hàm mã hóa HDB3
function encoded = hdb3_encode(bits)
    prev_polarity = -1; % Dấu của bit '1' cuối cùng
    count_1s = 0; % Đếm số lượng bit '1' trước đó

    encoded = zeros(1, length(bits)); % Khởi tạo tín hiệu đầu ra
    
    i = 1;
    while i <= length(bits)
        
        if bits(i) == 1 
            % AMI: Bit '1' có dấu luân phiên
            prev_polarity = -prev_polarity;
            encoded(i) = prev_polarity;
            count_1s = count_1s + 1;
            
        elseif i <= length(bits) - 3 && all(bits(i:i+3) == 0)
            % Phát hiện 4 bit '0' liên tiếp (0000)
            if mod(count_1s, 2) == 0
                % Nếu số lượng bit '1' trước đó là chẵn → B00V
                encoded(i) = -prev_polarity;   % B
                encoded(i+1) = 0;
                encoded(i+2) = 0;
                encoded(i+3) = encoded(i); % V
            else
                % Nếu số lượng bit '1' trước đó là lẻ → 000V
                encoded(i) = 0;
                encoded(i+1) = 0;
                encoded(i+2) = 0;
                encoded(i+3) = prev_polarity; % V
            end

            prev_polarity = encoded(i+3); % Lưu trạng thái của V


            % Reset bộ đếm bit '1'
            count_1s = 0;

            % Bỏ qua 3 bit tiếp theo vì đã thay thế
            i = i + 3;
        else
            % Nếu số lượng bit '0' liên tiếp ít hơn 4, giữ nguyên mức 0V
            encoded(i) = 0;
        end
        i = i + 1;
    end
end
