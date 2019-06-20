









%
% H9E9_1.m
%
% Solving differential equation for satellite's motion using ode45;
% uses the function ftest
format long

t0 = 0;     % initial value for the time
a = 8;     % initial angle at which the engine is turned on
v0 = 6.082;   % initial velocity of the satellite
landed = false; % check variable to see if the satellite has landed

% initial value y0
% y0 = [ x y vx vy ]
y0 = [-0.7346+1.06*cosd(a) 1.06*sind(a) v0*cosd(90 + a) v0*sind(90 + a)];

plot (0,0)
hold

% Main loop for 28 days
for i = 1:28
    
    % integration over 24 h
    tfinal = t0 + 24;
    tspan=[t0 tfinal];
    opts = odeset('RelTol',1e-6);
    [t,y] = ode45('f',tspan,y0,opts);
    
    % setting initial values for the next loop
    t0 = tfinal;
    y0 = y(end,:);
    
    % position of earth and moon at all time t returned by ode45
    [x2,y2] = positionofearth(t);
    [x1,y1] = positionofmoon(t);
    
    % condition to check whether the satellite has landed or not
    for j = 1 : length(t)
        d = sqrt( (x1(j) - y(j,1))^2 + (y1(j) - y(j,2))^2 );
        if d < (3500/6400)
            landed = true;
            break;
        end
    end    
    
    % plotting the orbit
    if ( landed == true )
        for k = 1:j
            plot(y(k,1),y(k,2));    
            hold on
            plot(x2(k),y2(k),'b*');
            hold on
            plot(x1(k),y1(k),'ko');
        end
        fprintf ('\n\nThe angle at which the engine is turned on, alpha = %d degrees ', a); 
        fprintf ('\n\nThe initial velocity, vo = %d EU/h ', v0);
        fprintf ('\n\nThe time took for landing is %d h ', t(j,1));
        break;
    else
        plot(y(:,1),y(:,2));    
        hold on
        plot(x2,y2,'*');
        hold on
        plot(x1,y1,'o');
        drawnow;
        pause(1);
    end
        
end  
 