function [ ] = c( f_new )
%C. 

    %get numerator and denominator coefficients from our transfer function
    [num, den] = tfdata(f_new,'v');
    num = -num;
    fprintf ('Characteristic equation coefficients:')
    den = -den

    %Check stability with Routh-Hurwitz method
    %Coefficients: [0.1556    0.5446    0.3112    0.0892]
    %these are our characteristic equation coefficients!
    ruth(den)

    %Check stability with Nyquist plot
    figure()
    nyquist (f_new)
    grid on;
      
    fprintf(['\nNyquist diagram conclusion:\n',...
        'We can see in the Nyquist diagram that we have 0 encirclements of -1 (N=0).\n',...
        'From the Routh Hurwitz method we saw that we have 0 sign changes (P=0).\n',...
        'In order for our system to be stable, Z (closed loop poles) must be 0 (N = Z-P).\n',...
        'So we have: Z = N + P => Z = 0\n',...
        'That means that our system is stable!!\n\n'])
    

end

