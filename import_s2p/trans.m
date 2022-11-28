function f = trans(a, c)
if (c == 1)
 f(:,1) = a(:,1);
 for i= 1:1:size(a, 1)
     f(i,2) = a(i,2) + 1i*a(i,3);
     f(i,3) = a(i,4) + 1i*a(i,5);
     f(i,4) = a(i,6) + 1i*a(i,7);
     f(i,5) = a(i,8) + 1i*a(i,9);
 end
end

if (c == 2)
 f(:,1) = a(:,1);
 for i= 1:1:size(a, 1)
     f(i,2) = 10^(a(i,2)/10) + 1i*10^(a(i,3)/10);
     f(i,3) = 10^(a(i,4)/10) + 1i*10^(a(i,5)/10);
     f(i,4) = 10^(a(i,6)/10) + 1i*10^(a(i,7)/10);
     f(i,5) = 10^(a(i,8)/10) + 1i*10^(a(i,9)/10);
 end
end


if (c == 3)
 f(:,1) = a(:,1);
 for i= 1:1:size(a, 1)
     a(i,3) = a(i,3) * pi/180;
     a(i,5) = a(i,5) * pi/180;
     a(i,7) = a(i,7) * pi/180;
     a(i,9) = a(i,9) * pi/180;
     f(i,2) = a(i,2)*(cos(a(i,3)) + 1i*sin(a(i,3)));
     f(i,3) = a(i,4)*(cos(a(i,5)) + 1i*sin(a(i,5)));
     f(i,4) = a(i,6)*(cos(a(i,7)) + 1i*sin(a(i,7)));
     f(i,5) = a(i,8)*(cos(a(i,9)) + 1i*sin(a(i,9)));
 end
end

end