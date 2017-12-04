function retVal = denormalizacia(maxMinData, data)
  
  a = -2 / (maxMinData(7) - maxMinData(8));
  b = 1 - a * maxMinData(8);
  for j = 1:size(data)(2)
    
    data(j) = ((data(j) - b) / a);
  endfor
     
  retVal = data';
     
endfunction