clc,clear

f = @(x)-(x-2)^2;
num = 100000;
T = 1e4;
T_decrease = 0.9999;
x_min = -10;
x_max = 10;

range = 0.1;

x0 = x_min+rand*(x_max-x_min);
y0 = f(x0);
box = zeros(1,num);
box_x = zeros(1,num);

for i = 1:num
    deta = 2*(rand-0.5)*range;
    x1 = x0 + deta;
    if x1<x_min;
        x1 = x_min;
    end
    if x1 > x_max
        x1 = x_max;   
    end
    y1 = f(x1);
    error = y1-y0;
    if error >= 0
        x0 = x1;
        y1 = y0;
    elseif exp(-1/T)>rand;
        x0 = x1;
        y1 = y0;
    end
    box(i) = exp(-1/T);
    box_x(i) = x0;
    
    T = T*T_decrease;
end
x0
plot(box)
figure
plot(box_x,'.')

