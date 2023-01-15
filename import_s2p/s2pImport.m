function result = s2pImport(FileName)
%--------------------------------------------------------------------------
%Функция считывания файла формата Touchstone. Входной параметр FileName
% - имя загружаемого файла.
%--------------------------------------------------------------------------

FileName = strcat("s2p_src/",FileName);
[ID, mes] = fopen(FileName, 'rt');
%Проверка правильного открытия файла
if ID ~= -1
    %Создание пустого символьного массива
    MAS = '';
    %Цикл считывания строк файла пока не достигнется конец файла
    while feof(ID) == 0
        %Считывание строки
        line = fgetl(ID);
        %Запись считанной строки в массив MAS
        MAS = char(MAS, line);
    end
    %Закрытие файла
    fclose(ID);
    else
    disp('Ошибка открытия файла')
    disp(FileName)
    error(mes)
end
%Число строк в файле
numstr=length(MAS(:,1));
%Создание пустого символьного массива для хранения строк файла, содержащих числа (заголовок и комментарии удаляются)
MAT = '';
%Присваивание символьной переменной com знака комментария в sNp-файле
com = '!';
%Присваивание строковой переменной tab знака заголовка таблицы в sNp-файле
tab = '#';
%Начальное значение счетчика строк массива MAT
n = 1;
%Цикл селекции строк sNp-файла с числовыми данными 
for k=1:numstr
    %k-я строка массива MAS
    strk = MAS(k, :);
    %Проверка того, что строка не является комментарием или заголовком sNp-файла
    if  (length(findstr(strk, com)) ~= 0) | (length(findstr(strk, tab)) ~= 0)
        %Проверка того, что строка содержит числовые данные, а не пустая
    elseif (length(findstr(strk, '0')) ~= 0) | (length(findstr(strk, '1') ~= 0)) | (length(findstr(strk, '2') ~= 0)) |...
           (length(findstr(strk, '3') ~= 0)) | (length(findstr(strk, '4') ~= 0)) | (length(findstr(strk, '5') ~= 0)) |...
           (length(findstr(strk, '6') ~= 0)) | (length(findstr(strk, '7') ~= 0)) | (length(findstr(strk, '8')) ~= 0) |...
           (length(findstr(strk, '9') ~= 0))
           %Присваивание k-ой строки (с числовыми данными) массива MAS n-ой строке массива MAT
            MAT(n, :) = MAS(k, :);
            %Инкрементирование счетчика
            n = n + 1;
   end
end
%Преобразование строчного массива в массив чисел (выходной параметр функции)
MAT_NUM1=str2num(MAT);

%Поиск и запись строки содержащей параметры
for k=1:numstr
        strk = MAS(k, :);
    if  (~isempty(findstr(strk, tab)))
        str_data=k;
        break
    end
end
um=0;
strk = upper(strk);
%Определение частот
if findstr(strk,'GHZ')
    um=1e+9;
elseif findstr(strk,'MHZ')
    um=1e+6;
elseif findstr(strk,'KHZ')
    um=1e+3; 
elseif findstr(strk,'HZ')
    um=1;
else
    disp(FileName)
    error("unkown frequency format")
end
MAT_NUM1(:,1)=MAT_NUM1(:,1)*um;


if findstr(strk,'MA')
    c = "MA";
elseif findstr(strk,'DB')
    c = "DB";
elseif findstr(strk,'RI')
    c = "RI";
else
    disp(FileName)
    error("unkonwn amplitude format")
end

spFile = trans(MAT_NUM1, c);


freqs = spFile(:,1);
spLine = spFile(:,2:end); 
SP = zeros(2,2,size(spLine,1));

for ind = 1:1:size(spLine,1)
    SP(:,:,ind) = reshape(spLine(ind,:),2,2);
end; clear ind;

result = {freqs;SP};
end