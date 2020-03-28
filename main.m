clear
clc
close all

%syms s
s = tf('s');

%Find transfer function
g = 2*s + 7; %tf([2 7])
h = s^2 + 2; %tf([1 0 2]) 
fprintf('Transfer function:')
f = feedback(g,h) 

%Plot step response
figure()
step (f,10000) %we can see that our step response diverges!
grid on;

%NOTE: PRESS F5 TO CONTINUE FROM BREAKPOINTS!!


%A.
fprintf ('A.\n')
a(f)

%B.
fprintf ('B.\n')
f_new = b(g, h)

%C.
fprintf ('C.\n')
c(f_new)

%D.
fprintf ('D.\n')
d(f)

%E.
fprintf ('E.\n')
%NOTE: I take as input the function from b, not the initial function.
e(f_new)

%If you want, you can run the following command, to do the same (e) for the 
%initial function. It will work perfectly, but the printing messages will
%be wrong, because they are depended on the results!
%You can easily extract analogous information from the plots.
%The system will be unstable for all ã values again (boring) and the Nyquist diagrams a
%bit more interesting.

%e(f)



