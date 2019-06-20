function yprime = f(t,y)

% acceleration due to pull of earth
[Ex,Ey] = positionofearth(t); % postion of earth at time t
r = ( (Ex-y(1))^2 + (Ey-y(2))^2 )^(1/2); % distance betweem the earth and the satellite
aE = 20 / (r^2); % acceleration of the satellite due to pull of earth

% calculating the x and y components using similar triangle properties, as
% their position and acceleration components are propotional
aEx =    ((Ex-y(1)) / r  * aE); 
aEy =    ((Ey-y(2)) / r  * aE);


% acceleration of the satellite due to pull of moon
[Mx,My] = positionofmoon(t); % postion of moon at time t
r = ( (Mx-y(1))^2 + (My-y(2))^2 )^(1/2); % distance betweem the moon and the satellite
aM = (20/81.3) / (r^2); % acceleration of the satellite due to pull of moon

% calculating the x and y components using similar triangle properties, as
% their position and acceleration components are propotional
aMx =    ((Mx-y(1)) / r  * aM);
aMy =    ((My-y(2)) / r  * aM);

% summing up acceleration along each co-ordinates
a = aEx + aMx;
b = aEy + aMy;

%yprime
yprime = [y(3); y(4); a; b];
end
