function [] = d( f )
%D.
    
    s = tf('s');

    %Trial and error for many 'a' values
    fprintf(['Is our system with the addition of a zero stable (in our plot)?',...
    '\n\t1: stable\n\t0: unstable\n'])
    stable = [] ;
    for a = -100:2:100
        if a == 0
            a = 0.000001;
        end
        stable = [stable, check_stability_d(a,f)];
    end

    %print our stability for various 'a' values!
    x = linspace(-100,100,101);
    figure()
    subplot(6,1,1)
    plot (x,stable)
    ylim([-1.5 1.5])
    xlabel('a')
    ylabel('stability (0 or 1)')
    title('Stability of system for various a. 0:unstable, 1:stable')
    
    %a=0: Can't be, because we have division with 0!!
    %a!=0: Our system is unstable
    %Plot our step response for 5 values of a (0, -1, 1, -100, 100).
    
    subplot(6,1,2)
    a = 0.000001;
    r = (s+a)/a;
    step(f*r)
    title('Step response. Unstable system (for a--->0')
       
    subplot(6,1,3)
    a = -1;
    r = (s+a)/a;
    step(f*r)
    title('Step response. Unstable system (for a!=0, here a=-1)')

    subplot(6,1,4)
    a = 1;
    r = (s+a)/a;
    step(f*r)
    title('Step response. Unstable system (for a!=0, here a=1)')
    
    subplot(6,1,5)
    a = -100;
    r = (s+a)/a;
    step(f*r)
    title('Step response. Unstable system (for a!=0, here a=-100)')
    
    subplot(6,1,6)
    a = 100;
    r = (s+a)/a;
    step(f*r)
    title('Step response. Unstable system (for a!=0, here a=100)')

    fprintf(['\nConclusion:\nWe can see that our system is unstable',...
        ' for all possible a values!!\n\n'])
    
end

