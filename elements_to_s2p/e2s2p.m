function result = e2s2p(name, value, freqs)
A = zeros(length(freq));
B = zeros(length(freq));
C = zeros(length(freq));
D = zeros(length(freq));
N = zeros (2,2,length(freq));
if (name == 'Lser') 
    for i=1:1:length(freq)
        A(i) = 1;
        B(i) = 1i*(2*pi*freq(i))*value;
        C(i) = 0;
        D(i) = 1;
    end
else if (name == 'Lpar') 
     for i=1:1:length(freq)
        A(i) = 1;
        B(i) = 0;
        C(i) = 1/(1i*(2*pi*freq(i))*value);
        D(i) = 1;
     end
else if (name == 'Cser')
     for i=1:1:length(freq)
        A(i) = 1;
        B(i) = -1i*(1/((2*pi*freq(i))*value));
        C(i) = 0;
        D(i) = 1;
     end
else if (name == 'Cpar')
     for i=1:1:length(freq)
        A(i) = 1;
        B(i) = 0;
        C(i) = 1/(-1i*(1/((2*pi*freq(i))*value)));
        D(i) = 1;
     end   
end
end
end
end

for i=1:1:length(freq)
    N(1,1,i) = (A(i) + (B(i)/50) - C(i)*50 - D(i))/(A(i) + (B(i)/50) + C(i)*50 + D(i));
    N(1,2,i) = (2*(A(i)*D(i)-B(i)*C(i)))/(A(i) + (B(i)/50) + C(i)*50 + D(i));
    N(2,1,i) = 2/(A(i) + (B(i)/50) + C(i)*50 + D(i));
    N(2,2,i) = (-A(i) + (B(i)/50) - C(i)*50 + D(i))/(A(i) + (B(i)/50) + C(i)*50 + D(i));
%Студент Токмаков. Доклад окончил.

end
