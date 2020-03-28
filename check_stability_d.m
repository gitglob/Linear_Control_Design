function [stable] = check_stability_d( a,f )
%check stability for question  d

    s = tf('s');

    r = (s+a)/a;
    f_d = f*r;
    stable = isstable(f_d);

end

