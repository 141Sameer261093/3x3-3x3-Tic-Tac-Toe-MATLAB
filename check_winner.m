function [winner] = check_winner(m)

winner = 0;
countZeros = 0;

    for i = 1:3
    
      m1 = m(i,:);
      
      if( sum(m1) == 27 )
           winner = 1;  
      end
      if( sum(m1) == 3 ) 
           winner = 1;  
      end
      
    end
  
    for j = 1:3
      
        m2 = m(:,j);
      
      if( sum(m2) == 27 )
           winner = 1;  
      end
      if( sum(m2) == 3 ) 
           winner = 1;  
      end
      
    end
    
    if m(1,1) + m(2,2) + m(3,3) == 27
        winner = 1;
    end
    if m(1,1) + m(2,2) + m(3,3) == 3
        winner = 1;
    end
    
    if m(3,1) + m(2,2) + m(1,3) == 27
        winner = 1;
    end
    if m(3,1) + m(2,2) + m(1,3) == 3
        winner = 1;
    end
    
    for i = 1:3
        for j = 1:3
            if m(i,j) == 0
                countZeros = countZeros + 1;
            end
        end
    end
    
    if (countZeros == 0)
        winner = 3;
    end
    
        
end