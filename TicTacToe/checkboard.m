function win = checkboard(b)
%CHECKBOARD Check for win
% b     - The board position
% win   - 1 for X, 2 for O, 0 otherwise

win=0;
for i=1:2
    if b(1)==i && b(2)==i && b(3)==i
        win=i;
    elseif b(4)==i && b(5)==i && b(6)==i
        win=i;
    elseif b(7)==i && b(8)==i && b(9)==i
        win=i;
    elseif b(1)==i && b(4)==i && b(7)==i
        win=i;
    elseif b(2)==i && b(5)==i && b(8)==i
        win=i;
    elseif b(3)==i && b(6)==i && b(9)==i
        win=i;
    elseif b(1)==i && b(5)==i && b(9)==i
        win=i;
    elseif b(3)==i && b(5)==i && b(7)==i
        win=i;
    end
    
end