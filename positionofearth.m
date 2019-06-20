function [x,y] = positionofearth(t)
% calculating the position of earth using
% r = -RE(cos(wt) , sin(wt))
w = (2 * pi) / (27.322 * 24); 

x = - 0.7346 * cos ( w * t);
y = - 0.7346 * sin ( w * t);

end

