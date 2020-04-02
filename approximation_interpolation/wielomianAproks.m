function wielomian = wielomianAproks(x,y,stopien)
    n = length(x);
    X = zeros(stopien);
    X(1,1) = n;
    for i = 2:stopien
       potega = i - 1;
       suma = 0;
       for j = 1:n
           suma = suma + x(j) ^ potega;
       end
       r = 1;
       for k = i:-1:1
           X(r,k) = suma;
           r = r + 1;
       end
    end    
    for i = 2:stopien
       potega = i - 2 + stopien;
       suma = 0;
       for j = 1:n
           suma = suma + x(j) ^ potega;
       end
       k = stopien;
       for r = i:stopien
           X(r,k) = suma;       
           k = k - 1;
       end
    end    
    Y = zeros(stopien,1);    
    for i = 1:stopien
       suma = 0;
       for j = 1:n
           suma = suma + y(j) * x(j) ^ (i - 1);
       end      
       Y(i) = suma;
    end    
    A = (X \ Y)';    
    wielomian = fliplr(A);
end