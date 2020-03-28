function [] = a(f)
%A.

    %get numerator and denominator coefficients from our transfer function
    [n, d] = tfdata(f,'v');
    fprintf ('Characteristic equation coefficients:')
    d

    %Check stability with Routh-Hurwitz method
    %Coefficients: [-2    -7    -4   -15]
    %these are our characteristic equation coefficients!
    ruth(d)
    
    fprintf('\n')
    
end

