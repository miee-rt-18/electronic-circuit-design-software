function draw_smith_chart 
t = linspace(0, 2*pi, 100);
x = cos(t);
y = sin(t);
plot(x, y, 'linewidth', 3); axis equal; 
title(' Диаграмма Смита ')
set(gca,'xticklabel',{[]});
set(gca,'yticklabel',{[]});
hold on
k = [.25 .5 .75];
for i = 1 : length(k)
    x(i,:) = k(i) + (1 - k(i)) * cos(t);
    y(i,:) = (1 - k(i)) * sin(t);
    plot(x(i,:), y(i,:), 'k')
end 
kt = [2.5 pi 3.79 4.22];
k = [.5 1 2 4];
for i = 1 : length(kt)
    t = linspace(kt(i), 1.5*pi, 50);
    a(i,:) = 1 + k(i) * cos(t);
    b(i,:) = k(i) + k(i) * sin(t);
    plot(a(i,:), b(i,:),'k:', a(i,:), -b(i,:),'k:' )
end
end
