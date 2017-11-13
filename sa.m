clc,clear

f = @(x)(x.^2-1);
T_fun = @(Error,t)exp(-(Error)./t);

T = 1e4;
T_decrease = 0.998;
x_min = -2;
x_max = 3;

range_min = -1;
range_max = 1;
find_purpose = 1;

x_0 = rand*(x_max-x_min);
y_0 = f(x_0);
box = [];

for I = 1:1000
    deta_x = (rand-rand)*(range_max-range_min);
    x_1 = x_0 + deta_x;
    if x_1>x_max;
        x_1 = x_max;
    end
    if x_1<x_min;
        x_1 = x_max;
    end
    y_1 = f(x_1);
    error = y_1 - y_0;
    
    if error*find_purpose>0
        x_0 = x_1;
    elseif T_fun(error,T)>rand;
        x_0 = x_1;
    end
    box = [box, T_fun(error,T)];
    T = T*T_decrease;  
end
disp(x_0)
plot(box,'d')

