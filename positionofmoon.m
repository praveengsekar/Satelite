function [x,y] = positionofmoon(t)
% calculating the position of moon using
% r = RM(cos(wt) , sin(wt))
w = (2 * pi) / (27.322 * 24); 

x =  59.680 * cos ( w * t);
y =  59.680 * sin ( w * t);

end