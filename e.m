function [] = e( f )
%E.

    s = tf('s');
    
    %Trial and error for many 'gamma' values
    fprintf(['Is our system with the addition of a pole stable (in our plot)?',...
    '\n\t1: stable\n\t0: unstable\n'])
    stable = [] ;
    for gamma = -100:2:100
        stable = [stable, check_stability_e(gamma,f)];
    end

    %print our stability for various 'gamma' values!
    x = linspace(-100,100,101);
    figure()
    subplot(4,2,[1 2])
    plot (x,stable)
    ylim([-1.5 1.5])
    xlabel('gamma')
    ylabel('stability (0 or 1)')
    title('Stability of system for various gamma. 0:unstable, 1:stable')
    
    %gamma: Our system is stable for any value of 'gamma'
    %Plot our step response for 3 values of gamma (0, -5, 5).
    
    subplot(4,2,3)
    gamma = 0;
    r = (gamma*s)+1;
    step(f*(1/r))
    title('Step response. Stable system (for gamma=0)')
       
    subplot(4,2,5)
    gamma = -5;
    r = (gamma*s)+1;
    step(f*(1/r))
    title('Step response. Unstable system (for gamma=-5)')

    subplot(4,2,7)
    gamma = 5;
    r = (gamma*s)+1;
    step(f*(1/r))
    title('Step response. Stable system (for gamma=5)')
    
    %Now we want to confirm our results through Routh-Hurwitz method and
    %the Nyquist diagram. We will do that again for 3 values of gamma 
    %(-5, 0, 5)
    
    %gamma = 0
    fprintf('\nã = 0 (stable system):\n')
    subplot(4,2,4)
    gamma = 0;
    r = (gamma*s)+1;
    f_new = f*(1/r);
    nyquist (f_new)
    title('Nyquist: gamma=0')
    
    %get numerator and denominator coefficients from our transfer function
    %to perform Routh Hurwitz
    [num, den] = tfdata(f_new,'v');
    num = -num;
    fprintf ('Characteristic equation coefficients:')
    den = -den
    ruth(den)
    
    %gamma = -5
    fprintf('\nã = -5 (UNstable system):\n')
    subplot(4,2,6)
    gamma = -5;
    r = (gamma*s)+1;
    f_new = f*(1/r);
    nyquist (f_new)
    title('Nyquist: gamma=-5')
    
    %get numerator and denominator coefficients from our transfer function
    %to perform Routh Hurwitz
    [num, den] = tfdata(f_new,'v');
    num = -num;
    fprintf ('Characteristic equation coefficients:')
    den = -den
    ruth(den)
    
    %gamma = 5
    subplot(4,2,8)
    fprintf('\nã = 5 (stable system):\n')
    gamma = 5;
    r = (gamma*s)+1;
    f_new = f*(1/r);
    nyquist (f_new)
    title('Nyquist: gamma=5')
    
    %get numerator and denominator coefficients from our transfer function
    %to perform Routh Hurwitz
    [num, den] = tfdata(f_new,'v');
    num = -num;
    fprintf ('Characteristic equation coefficients:')
    den = -den
    ruth(den)
    
    fprintf(['\nConclusion:\nWe can see that our system is unstable for',...
        ' ã<0 and stable for ã>=0 !!\n\n'])
   
end



