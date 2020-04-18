function y = lagrange(x,wezly)
    %wezly to zbior x (1 wiersz) i f (2 wiersz) 
    n = size(wezly,2);
    L = ones(n,length(x));
    for i = 1:n
        for j = 1:n
            if i ~= j
                L(i,:) = L(i,:) .* ((x - wezly(1,j)) / (wezly(1,i) - wezly(1,j)));
            end
        end
    end
    y = zeros(1,length(x));
    for i = 1:n
        y = y + wezly(2,i) * L(i,:);
    end
    %y = sum(wezly(2,:)*L(:,:));
end