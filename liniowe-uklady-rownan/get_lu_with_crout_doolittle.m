function [L, U] = get_lu_with_crout_doolittle(A)
len = length(A);
L = eye(len);
U = zeros(size(A));

for i = 1:len
    U(1, i)=A(1, i);
end

for i = 1:len-1
    for j = 1:len        
        L(j, i)=get_l(A, L, U, j, i);
    end
    for j = i+1:len        
        U(i+1, j)=get_u(A, L, U, i+1, j);
    end
end
end

function u = get_u(A, L, U, row, col)
    u=A(row, col);
    for i = 1:row-1
        u = u - L(row, i) * U(i, col);
    end
end

function l = get_l(A, L, U, row, col)
    l = A(row, col);
    for i = 1:col-1
        l = l - L(row, i) * U(i, col);
    end
    l = l / U(col, col);
end