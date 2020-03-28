function [ ] = ruth(x)
%Note: I don't own this code!
%This code is taken from online source and I have made minor changes to fit my needs.

%A.
%Routh Hurwitz

    %% Taking coefficients vector and organizing the first two rows
    len = length(x);
    rhTableColumn = round(len/2);
    %  Initialize Routh-Hurwitz table with empty zero array
    routhTable = zeros(len,rhTableColumn);
    %  Compute first row of the table
    routhTable(1,:) = x(1,1:2:len);
    %  Check if length of coefficients vector is even or odd
    if (rem(len,2) ~= 0)
        % if odd, second row of table will be
        routhTable(2,1:rhTableColumn - 1) = x(1,2:2:len);
    else
        % if even, second row of table will be
        routhTable(2,:) = x(1,2:2:len);
    end
    %% Calculate Routh-Hurwitz table's rows
    %  Set epss as a small value
    epss = 0.01;
    %  Calculate other elements of the table
    for i = 3:len

        %  special case: row of all zeros
        if routhTable(i-1,:) == 0
            order = (len - i);
            cnt1 = 0;
            cnt2 = 1;
            for j = 1:rhTableColumn - 1
                routhTable(i-1,j) = (order - cnt1) * routhTable(i-2,cnt2);
                cnt2 = cnt2 + 1;
                cnt1 = cnt1 + 2;
            end
        end

        for j = 1:rhTableColumn - 1
            %  first element of upper row
            firstElemUpperRow = routhTable(i-1,1);

            %  compute each element of the table
            routhTable(i,j) = ((routhTable(i-1,1) * routhTable(i-2,j+1)) - ....
                (routhTable(i-2,1) * routhTable(i-1,j+1))) / firstElemUpperRow;
        end


        %  special case: zero in the first column
        if routhTable(i,1) == 0
            routhTable(i,1) = epss;
        end
    end
    %%  Compute number of right hand side poles(unstable poles)
    %   Initialize unstable poles with zero
    unstablePoles = 0;
    %   Check change in signs
    for i = 1:len - 1
        if sign(routhTable(i,1)) * sign(routhTable(i+1,1)) == -1
            unstablePoles = unstablePoles + 1;
        end
    end
    %   Print calculated data on screen
    fprintf('\n Routh-Hurwitz table:\n')
    routhTable
    %   Print the stability result on screen
    if unstablePoles == 0
        fprintf('Stable system! (There are NO changes of signs in the first column)\n')
    else
        fprintf('Un-stable system! (There are changes of signs in the first column)\n')
    end
    fprintf('\n Number of right hand side poles =%d\n',unstablePoles)

end

