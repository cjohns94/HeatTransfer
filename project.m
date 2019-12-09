clear all
clc
close all

T0 = 50+273;
l = 0.1;
r = 0.04;
cp = 4179;
rho = 1/(1.009e-3);
As = 2*pi*r*l + pi*r^2; %sides and top of bottle
V = pi*r^2*l;
e = .8;
alpha = e; %eps = alpha for large enclosure with uniform T (see pg 810 of textbook)
Tsurr = 25+273;
sig = 5.67e-8;
Pr = .707;
nu = 15.89e-6;
B = 1/((T0+Tsurr)/2);
g = 9.81;
k = 26.3e-3;

%calc h
Gr = (g*B*(T0 - Tsurr)*l^3)/(nu^2)
Ra = Gr*Pr
Nu = (0.825 + (.387*Ra^(1/6))/((1+(.492/Pr)^(9/16))^(8/27)))^2
h = Nu*k/l


tspan = [0 2000];
[t,T] = ode45(@(t,T) -(As/(rho*V*cp))*...
    (h*(T - Tsurr)+(e*sig*T^4-alpha*sig*Tsurr^4)), tspan, T0);
plot(t,T-273)
grid on
hold on

open_air = 50.1 - 9.04e-3.*(t) + 1.17e-6.*(t.^2);
insulated = 49.9 - 4.98e-3.*t + 6.26e-7.*t.^2;

plot(t,open_air)
plot(t, insulated)
legend('Model (\epsilon = \alpha)','Open Air', 'Insulated')
xlabel('Temp (C)')
ylabel('Time(s)')

%Why so different? I expect that the esp = alpha would be close to the open
%air graph and that not including radiation would make it closer to the
%insulated case.
%modelling errors like it wasnt suspended but sitting on table, opening in
%bottle cap, etc?