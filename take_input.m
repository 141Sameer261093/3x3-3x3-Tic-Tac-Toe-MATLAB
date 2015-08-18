function [place] = take_input()

   place = input('');
   
   while (place < 1) || (place > 9)
            display('Choice should be a number between 1 and 9\n. Enter your choice again. ');
            place = input('');
   end
   
   place = floor(place);
   
end