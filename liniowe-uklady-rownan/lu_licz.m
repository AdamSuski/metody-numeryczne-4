function x = lu_licz(A,b)
    [L, R] = get_lu_with_crout_doolittle(A);
    y = krok1LU(L, b);
    x = krok2LU(R, y);
end

function y = krok1LU(L, b)
    n = size(L, 2);
    y = zeros(n, 1);
    for i = 1:n
        suma = 0;
        for j = 1:i-1
            suma = suma + L(i, j) * y(j);
        end
        y(i) = (b(i) - suma) / L(i, i);
    end
end

function x = krok2LU(R, y)
    n = size(R, 2);
    x = zeros(n, 1);
    for i = n:-1:1
        suma = 0;
        for j = i+1:n
            suma = suma + R(i, j) * x(j);
        end
        x(i) = (y(i) - suma) / R(i, i);
    end
end


