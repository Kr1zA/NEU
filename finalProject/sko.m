function sko(rokNaTestovanieBezChybajucichDat, denormalizovaneOdhadnuteDstB)
  
  strednaKvadratickaOdchylka = 0;

  for j = 1:size(denormalizovaneOdhadnuteDstB)
    
    strednaKvadratickaOdchylka = strednaKvadratickaOdchylka + (denormalizovaneOdhadnuteDstB(j) - rokNaTestovanieBezChybajucichDat(j + 9, 5)) * (denormalizovaneOdhadnuteDstB(j) - rokNaTestovanieBezChybajucichDat(j + 9, 5));
    
  endfor
  
  strednaKvadratickaOdchylka = sqrt(strednaKvadratickaOdchylka / size(denormalizovaneOdhadnuteDstB)(1))
    
endfunction