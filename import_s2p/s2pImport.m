function result = s2pImport(filename)

% spFile - это матрица S параметров вида 
% частота S11 S21 S12 S22

freqs = spFile(:,1);
spLine = spFile(:,2:end); SP = zeros(2,2,size(spLine,1));

for ind = 1:1:size(spLine,1)
    SP(:,:,ind) = reshape(spLine(ind,:),2,2);
end; clear ind;

result = {freqs;SP};
end