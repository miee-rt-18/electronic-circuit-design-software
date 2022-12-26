function g = trans(a, c)
if (c == "MA")
 f(:,1) = a(:,1);
 for i= 1:1:size(a, 1)
     f(i,2) = a(i,2).*exp(1i*deg2rad(a(i,3)));
     f(i,3) = a(i,4).*exp(1i*deg2rad(a(i,5)));
     f(i,4) = a(i,6).*exp(1i*deg2rad(a(i,7)));
     f(i,5) = a(i,8).*exp(1i*deg2rad(a(i,9)));
 end
elseif (c == "DB")
 f(:,1) = a(:,1);
 for i= 1:1:size(a, 1)
     f(i,2) = db2pow(a(i,2)).*exp(1i*deg2rad(a(i,3)));
     f(i,3) = db2pow(a(i,4)).*exp(1i*deg2rad(a(i,5)));
     f(i,4) = db2pow(a(i,6)).*exp(1i*deg2rad(a(i,7)));
     f(i,5) = db2pow(a(i,8)).*exp(1i*deg2rad(a(i,9)));
 end
elseif (c == "RI")
 f(:,1) = a(:,1);
 for i= 1:1:size(a, 1)
     f(i,2) = a(i,2) + 1i*a(i,3);
     f(i,3) = a(i,4) + 1i*a(i,5);
     f(i,4) = a(i,6) + 1i*a(i,7);
     f(i,5) = a(i,8) + 1i*a(i,9);
 end
else
    error("c is not of value")
end
g = f;
end