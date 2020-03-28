function [ f_new ] = b( g, h )
%B.

    %If we had a second order system, we would find  æ like this:
    %acc = 0.1;
    %Mp <= 0.05;
    %Since our Mp <= 0.05 
    %e^( ((-ð)*æ)/(sqrt(1-(æ^2))) ) <= 0.05
    % => æ >= 0.69010
    %Then we would compare our transfer function (with depended variable k) 
    %with the standard second order transfer funcion model (where æ >= 0.69010)
    %and we would find the proper value of k.
    %However we cannot do that, because our system ir 3rd order, so we used
    %trial and error method! 

    %I used trial and error to conclude what value k should get
    fprintf(['We used trial and error to find the proper value for k.\n',...
        'If we had a 2nd order system, we would be able to find  æ ',...
        'and through æ, find k,\n but since our system is of 3rd order, we cannot do that!\n'])
    k = -0.0778 ;
    fprintf ('We ended up picking Gain: k = %f\n',k)

    %calculate new transfer function
    f_new = feedback(g*k,h) ;

    %monitor overshooting %
    S = stepinfo(f_new);
    fprintf ('\nOur overshooting is: %f%%\n',S.Overshoot)

    figure()
    step (f_new) %our step response now converges to ~0.6
    fprintf(['Our controller was extremely important because it made\n',...
        'our system converge to ~0.6, while previously it diverged\n'])
    grid on;

    fprintf('New transfer function:')



end

