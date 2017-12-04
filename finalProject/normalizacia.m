%normalizacia

function retVal = normalizacia(data, maxMinData)

  for i = 2:5
     a = -2 / (maxMinData(2 * (i - 1) - 1) - maxMinData(2 * (i - 1)));
     b = 1 - a * maxMinData(2 * (i - 1));
     for j = 1:size(data)
       data(j, i) = (a * data(j, i)) + b;
     endfor
  endfor

  retVal = data;
  
endfunction