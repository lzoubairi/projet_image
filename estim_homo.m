function H = estim_homo(P1, P2)

    nb_points = 2*length(P1(:,1)); %nb de lignes de P

    
    %% Construction de A et B:
    
    A = zeros(nb_points, nb_points);
    B = zeros(nb_points, 1);
    H = ones(9,1);
    
    j =1;

    for (i=1:2:nb_points)

        A(i, :) = [P1(j,1) P1(j,2) 1 0 0 0 -P1(j,1)*P2(j,1) -P1(j,2)*P2(j,1)];
        A(i+1, :) = [0 0 0 P1(j,1) P1(j,2) 1 -P1(j,1)*P2(j,2) -P1(j,2)*P2(j,2)];
        B(i, :) = P2(j,1);
        B(i+1, :) = P2(j,2);
        j = j+1;

    end
    
    %% Calcul des 8 premiers coeff de H:
    
    if (nb_points == 8)
        H(1:8,:) = A\B;

    elseif (nb_points > 8)
        H(1:8,:) = inv(A'*A)*A'*B;
    end
    
   H = reshape(H, [3,3]);
    
end

