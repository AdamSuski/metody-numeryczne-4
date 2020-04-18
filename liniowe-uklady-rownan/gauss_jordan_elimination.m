function [A, b] = gauss_jordan_elimination(Ab, pivoting_enabled)
%równanie m*a=b
%szukane a
[m, n] = size(Ab);
A = Ab(:, 1:n-1);
b = Ab(1:m, n);
len = length(A);

for i = 1:len    
    if pivoting_enabled
        [A, b] = pivoting(A, b, i);
    else
        [A, b] = przestawienie(A, b, i);
    end
    [A, b] = jedynka_prowadzaca(A, b, i);
    [A, b] = zerowanie(A, b, i);
end
end

function [A, b] = pivoting(A, b, i)
len = length(A);
max = abs(A(i, i));
wirsz = i;
for j = i+1:len
    if abs(A(j, i)) > max
        max = A(j, i); 
        wirsz = j;
    end
    %switch_rows(A, b, j, i);
    switch_rows(A, b, i, wirsz);
   
end
end

function [A, b] = przestawienie(A, b, i)
len = length(A);
if A(i, i) == 0
    for j = i+1:len
        if A(j, i) ~= 0
            [A, b] = switch_rows(A, b, i, j);
            break;
        end
    end
end
end

function [A, b] = jedynka_prowadzaca(A, b, i)
if A(i, i) ~= 1
   tmp = A(i, i);
   A(i, :) = A(i, :) ./ tmp;
   b(i) = b(i) / tmp;
end
end

function [A, b] = zerowanie(A, b, i)
len = length(A);
for j = 1:len
    if j ~= i
        tmp = A(j, i);
        A(j, :) = A(j, :) - A(i, :) .* tmp;
        b(j) = b(j) - b(i) * tmp;
    end
end
end

function [A, b] = switch_rows(A, b, j, i)
temp = A(j, :);
A(j, :) = A(i, :);
A(i, :) = temp;
temp = b(j);
b(j) = b(i);
b(i) = temp;
end