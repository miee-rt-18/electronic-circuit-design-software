clear; clc

b = split(genpath("./"),";"); 
b(contains(b,"git",'IgnoreCase',true))=[];
b(end)=[];
for ind = 1:length(b)
    addpath(b{ind});
end
clear ind b; clc
