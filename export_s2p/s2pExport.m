function s2pExport(MAT, FREQ, FORMAT, R, FileName)
%--------------------------------------------------------------------------
%Функция формирует файл S-параметров в формате Touchstone из числового
%массива данных. Входные параметры функции: 
% 1) MAT = массив числовых данных;
% 2) FREQ - символьная переменная, задающая размерность частоты (GHz, MHz,
% kHz, Hz);
% 3) FORMAT - формат данных (MA - модуль-фаза, RI - Re-Im или DB модуль в Дб);
% 4) R - величина опорного сопротивления (число);
% 5) FileName - Неполное или полное (с полным путем) имя создаваемого файла
%--------------------------------------------------------------------------
R=50;
n=500;
m=9;
FREQ=char(n);
FORMAT='MA';
Y=rand(n,m);
MAT=Y;
format long
%Преобразование значение R в символьный тип
RES = num2str(R);
%Формирование заголовка по умолчанию таблицы S-параметров в формате Touchstone
TAB = '# GHz           S          MA           R         50';
%Изменение заголовка таблицы, если входные аргументы функции не совпадают
%со значениями, заданными в заголовке по умолчанию
if strcmp(FREQ, 'GHz') == 0
    TAB = strrep(TAB, 'GHz', FREQ);
end
if FORMAT ~= 'MA'
    TAB = strrep(TAB, 'MA', FORMAT);
end
if R ~= 50
    TAB = strrep(TAB, '50', RES);
end
%Преобразование массива MAT в символьный массив
MAT_STR = num2str(MAT);
%Формирование полной таблицы
com1 = '!©&® Генна Цыдармян Предсталяет';
com2 = '!-----------------------------------------------------------------------------';
com3 = '!Freq          ReS11        ImS11        ReS21       ImS21       ReS12     ImS12      ReS22        ImS22';
FULL_TAB = strvcat(com1, com2, TAB, com2, com3, MAT_STR);
%Создание файла и запись в него полученной таблицы в файл
[ID, mes] = fopen('KIK.txt', 'wt+');
%Число строк массива
L = length(FULL_TAB(:,1));
%Построчная запись массива FULL_TAB в файл 'FileName'
for k = 1:L
    fprintf(ID, [FULL_TAB(k,:) '\n']);
end
%Закрытие файла
fclose(ID);
