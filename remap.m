user_count = 0;
count = 0;

A = zeros(10532);

%A(15200, 15200) = 0;

for i = 1:10532  
    A(M(i, 1),M(i, 2)) = 1;
    A(M(i, 2),M(i, 1)) = 1;
end