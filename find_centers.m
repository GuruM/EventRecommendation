% count = 0;
% centers = zeros(10000,1);
% for j = 1:10532
%     if betweenness(j, 1) > 0.01
%         j
%         count = count + 1;
%         centers(count) = j;
%     end
%     
% end
% 
% centers = centers(1:count, :);



% center_friends = zeros(8, 35);
% 
% for j = 1:8
%     centers(j)
%     count = 0;
%     for i = 1:10532
%         if (A(centers(j), i) == 1)
%             count = count + 1;
%             center_friends(j, count) = i;
%         end
%     end
% end

centers_0 = zeros(8,1);

for j = 1:8
    count = 0;
    centers_0(j) = user_map(centers(j));
end
