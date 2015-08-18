function [x] = check_winner(m)

x = 0;
    for i = 1:3
    
      m1 = m(i,:);
      
      if( sum(m1) == 27 )
           x = 1;  
      end
      if( sum(m1) == 3 ) 
           x = 1;  
      end
      
    end
  
    for j = 1:3
      
        m2 = m(:,j);
      
      if( sum(m2) == 27 )
           x = 1;  
      end
      if( sum(m2) == 3 ) 
           x = 1;  
      end
      
    end
    
    if m(1,1) + m(2,2) + m(3,3) == 27
        x = 1;
    end
    if m(1,1) + m(2,2) + m(3,3) == 3
        x = 1;
    end
    
    if m(3,1) + m(2,2) + m(1,3) == 27
        x = 1;
    end
    if m(3,1) + m(2,2) + m(1,3) == 3
        x = 1;
    end
    
    
    
end