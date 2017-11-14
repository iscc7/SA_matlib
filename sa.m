clc,clear

f = @(x)-(x-2)^2;

T = 1e4;
T_decrease = 0.9999;
x_min = -10;
x_max = 10;

range = 2;

x0 = x_min+rand*(x_max-x_min);
y0 = f(x0);
box = zeros(1,100000);
for i = 1:100000
    x1 = x0 + (rand-rand)*(range);
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
    elseif exp(error/T)>rand;
        x0 = x1;
    end
    box(i) = exp(error/T);
    T = T*T_decrease;
end
x0
plot(box)
