function [ out ] = getVote( I, T, L, x,y )
    
   c = 1;
   
   while 1
      cl = T{2}(c);
      cr = T{3}(c);
      t = T{4}(c);
      x0 = T{5}(c);
      y0 = T{6}(c);
      z0 = T{7}(c);
      x1 = T{8}(c);
      y1 = T{9}(c);
      z1 = T{10}(c);
      s = T{11}(c);
      
      val = computebox(I, x, x0, y, y0, col2Ind(z0), s) - computebox(I, x, x1, y,y1,col2Ind(z1), s);
      
      if(val < t)
          next = cl;
      else
          next = cr;
      end
      
      if next < 1
         %leaf
         ind = abs(next) + 1;
         px = L{2}(ind);
         py = L{3}(ind);
         out(1) = px;
         out(2) = py;
         break;
      else
         c = next+1;
      end
      
   end

end

