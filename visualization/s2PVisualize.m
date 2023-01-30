function s2PVisualize_NEW(s2p, freqs,options)   
    arguments
    options.showParams (1,1) string = "S11 S21 S12 S22"
    options.magParams (1,1) string  = "dB"
    options.xLog (1,1) {mustBeNumericOrLogical} = true
    options.addPhase(1,1) {mustBeNumericOrLogical} = false
    options.independentPlot (1,1) {mustBeNumericOrLogical}  = false
    end 

params=strsplit(showParams);
s = sparameters(s2p(:,:,:),freqs) % S-параметры
s11=rfparam(s,1,1);
s21=rfparam(s,2,1);
s12=rfparam(s,1,2);
s22=rfparam(s,2,2);

ind=0
ind=find(ismember(params,'S11'))
% S11
if (ind ~= 0) 
% Диаграмма Смитта
if(independetPlot==1)
figure;
else
figure(1);
end
draw_smith_chart;
hold on;
plot(s11,'*','DisplayName','S11')
% Находим коэффициенты отражения матрицы
s11_dB=mag2db(abs(s11));
if(independetPlot==1)
figure;
else
figure(2);
end
plot(freqs,s11_dB,'DisplayName','S11')
xlabel('Частота, Гц')
ylabel('return loss, дБ')
title('Обратные потери (return loss)')
grid on
hold on;
% VSWR
VSWR = (1+abs(s11))/(1-abs(s11));% VSWR minimum
%ration=vswr(s11)
if(independetPlot==1)
figure;
else
figure(3);
end
plot(freqs,VSWR,'DisplayName','S11')
xlabel('Частота')
ylabel('КСВН')
title('КСВН')
grid on
axis tight;
ylim([1 inf]);
hold on;
% АЧХ
if(independetPlot==1)
figure;
else
figure(4);
end
z11=real(s11)
plot(freqs,s11,'DisplayName','S11')
% ФЧХ
if (addPhase == 1) 
if(independetPlot==1)
figure;
else
figure(5);
end
f11=imag(s11)
plot(freqs,f11,'DisplayName','S11')
end
end 

%%S21
ind=0
ind=find(ismember(params,'S21'))

if (ind ~= 0) 
% Диаграмма Смитта
if(independetPlot==1)
figure;
else
figure(1);
end
draw_smith_chart;
hold on;
plot(s21,'*','DisplayName','S21')
% Находим коэффициенты отражения матрицы
s21_dB=mag2db(abs(s21));
if(independetPlot==1)
figure;
else
figure(2);
end
plot(freqs,s21_dB,'DisplayName','S21')
xlabel('Частота, Гц')
ylabel('return loss, дБ')
title('Обратные потери (return loss)')
grid on
hold on;
% VSWR
VSWR = (1+abs(s21))/(1-abs(s21));% VSWR minimum
%ration=vswr(s21)
if(independetPlot==1)
figure;
else
figure(3);
end
plot(freqs,VSWR,'DisplayName','S21')
xlabel('Частота')
ylabel('КСВН')
title('КСВН')
grid on
axis tight;
ylim([1 inf]);
hold on;
% АЧХ
if(independetPlot==1)
figure;
else
figure(4);
end
z121=real(s21)
plot(freqs,s11,'DisplayName','S21')
% ФЧХ
if (addPhase == 1) 
if(independetPlot==1)
figure;
else
figure(5);
end
f21=imag(s21)
plot(freqs,f11,'DisplayName','S21')
end
end 
%%S22
ind=0
ind=find(ismember(params,'S22'))

if (ind ~= 0) 
% Диаграмма Смитта
if(independetPlot==1)
figure;
else
figure(1);
end
draw_smith_chart;
hold on;
plot(s22,'*','DisplayName','S22')
% Находим коэффициенты отражения матрицы
s22_dB=mag2db(abs(s22));
if(independetPlot==1)
figure;
else
figure(2);
end
plot(freqs,s22_dB,'DisplayName','S22')
xlabel('Частота, Гц')
ylabel('return loss, дБ')
title('Обратные потери (return loss)')
grid on
hold on;
% VSWR
VSWR = (1+abs(s22))/(1-abs(s22));% VSWR minimum
%ration=vswr(s11)
if(independetPlot==1)
figure;
else
figure(3);
end
plot(freqs,VSWR,'DisplayName','S22')
xlabel('Частота')
ylabel('КСВН')
title('КСВН')
grid on
axis tight;
ylim([1 inf]);
hold on;
% АЧХ
if(independetPlot==1)
figure;
else
figure(4);
end
z22=real(s22)
plot(freqs,s22,'DisplayName','S22')
% ФЧХ
if (addPhase == 1) 
if(independetPlot==1)
figure;
else
figure(5);
end
f22=imag(s22)
plot(freqs,f22,'DisplayName','S22')
end
end 

%%S12
ind=0
ind=find(ismember(params,'S12'))

if (ind ~= 0) 
% Диаграмма Смитта
if(independetPlot==1)
figure;
else
figure(1);
end
draw_smith_chart;
hold on;
plot(s12,'*','DisplayName','S12')
% Находим коэффициенты отражения матрицы
s12_dB=mag2db(abs(s12));
if(independetPlot==1)
figure;
else
figure(2);
end
plot(freqs,s12_dB,'DisplayName','S12')
xlabel('Частота, Гц')
ylabel('return loss, дБ')
title('Обратные потери (return loss)')
grid on
hold on;
% VSWR
VSWR = (1+abs(s12))/(1-abs(s12));% VSWR minimum
%ration=vswr(s11)
if(independetPlot==1)
figure;
else
figure(3);
end
plot(freqs,VSWR,'DisplayName','S12')
xlabel('Частота')
ylabel('КСВН')
title('КСВН')
grid on
axis tight;
ylim([1 inf]);
hold on;
% АЧХ
if(independetPlot==1)
figure;
else
figure(4);
end
z12=real(s12)
plot(freqs,s12,'DisplayName','S12')
% ФЧХ
if (addPhase == 1) 
if(independetPlot==1)
figure;
else
figure(5);
end
f12=imag(s12)
plot(freqs,f12,'DisplayName','S12')
end
end 