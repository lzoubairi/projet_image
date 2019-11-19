function H = estim_hom(P)
nb_points = size(P)(1); %nb de lignes de P

%% Construction de A et B:

A = zeros(nb_points, nb_points);
B = zeros(nb_points, 1);
j =1;
for (i=1:nb_points:2)
    
    A[i, :] = [P(j,1) P(j,2) 1 0 0 0 -P(j,1)*P(j+nb_points/2,1) -P(j,2)*P(j+nb_points/2,1)];
    A[i+1, :] = [0 0 0 P(j,1) P(j,2) 1 -P(j,1)*P(j+nb_points/2,2) -P(j,2)*P(j+nb_points/2,2)];
    B[i, :] = P(j+nb_points/2,1);
    B[i+1, :] = P(j+nb_points/2,2);
    j = j+1;
    
end

%% calcul de H :

if (nb_points == 8)
    H = A\B;
end

else if (nb_points > 8)
        H = inv(A'*A)*A'*B;
    end
    
end



    

