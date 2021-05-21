function [num] = RandomChooseSquare(board, avsq, turn)
% RANDOMCHOOSESQUARE Random player
% Try to win in one ply. Else, try to prevent the other side from
% winning in the next ply. Otherwise, choose a random square. 
% board     - The board position
% avsq      - Available squares' indices
% turn      - The next player to make a move
% num       - The chosen square

num=0;
i=1;
j=turn;

%try to win, if u can't try to block
while num==0
    if i==1     
    	s=[1 2 3];
    elseif i==2
    	s=[4 5 6];
    elseif i==3
    	s=[7 8 9];
    elseif i==4
    	s=[1 4 7];
    elseif i==5
    	s=[2 5 8];
    elseif i==6
    	s=[3 6 9];
    elseif i==7
    	s=[1 5 9];
    elseif i==8
    	s=[3 5 7];
    elseif i==9 && j==turn
        j=3-turn;
        i=1;
    elseif i==9 && j==3-turn
        num=avsq(ceil(rand*(length(avsq)))); %pick any sq if everything fails
    end
	
	if board(s(1))==j && board(s(2))==j && board(s(3))==0
        num=s(3);
	elseif board(s(1))==j && board(s(2))==0 && board(s(3))==j
        num=s(2);
	elseif board(s(1))==0 && board(s(2))==j && board(s(3))==j
        num=s(1);
	end
    i=i+1;
end

end

