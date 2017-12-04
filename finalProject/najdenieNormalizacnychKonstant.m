function retVal = najdenieNormalizacnychKonstant(data)

  maxMinData = [];

  %najdenie najmensich a najvacsich dat
  for i = 2:5
    maxMinData = [maxMinData, min(data(1:size(data), i)), max(data(1:size(data), i))];
  endfor
  
  
  %uprava najmensich a najvacsich dat
  for i = 1:8
    if (mod(i, 2) == 1 && maxMinData(i) >= 0 && maxMinData(i) < 10)
      maxMinData(i) = 0;
      continue
    endif
    if (maxMinData(i) > 0)
      maxMinData(i) = maxMinData(i) + (10 - mod(maxMinData(i), 10));
      continue
    endif
    if (maxMinData(i) < 0)
      maxMinData(i) = maxMinData(i) - mod(maxMinData(i), 10);
      continue
    endif
  endfor
  
  for i = 1:8

    if mod(i, 2) == 0
      maxMinData(i) = maxMinData(i) + 10;
    else
      maxMinData(i) = maxMinData(i) - 10;
    endif
    
  endfor
  
  retVal = maxMinData;
endfunction