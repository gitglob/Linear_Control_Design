function [stable] = check_stability_e( gamma,f )
%check stability for question  e

    s = tf('s');

    r = (gamma*s)+1;
    f_e = f*(1/r);
    stable = isstable(f_e);

end