#PREPROCESSING DATA
function retVal = preprocessing (in)

  dlzkaVstupu = size(in);

  %vyberam hodnoty BZ, RMS_BZ_GSE, SW Proton Density, Dst-index
  data = [in(1:dlzkaVstupu, 5), in(1:dlzkaVstupu, 7), in(1:dlzkaVstupu, 8), in(1:dlzkaVstupu, 9)];

  pocitadlo = 1;
  
  %nahradzanie chybajucich dat ak je ich za sebu <= 24 
  for j = 1:4
    poslednaDeviatka = false;
    
    %preskocim prve deviatky
    for i = 1:dlzkaVstupu(1)
      if(data(i,j) == 999.9)
        continue;
      endif
      pocitadlo = i;
      break;
    endfor
    
    while pocitadlo < dlzkaVstupu(1)
      
      if(data(pocitadlo, j) == 999.9)

      prvaDeviatka = pocitadlo;
        
        while (data(pocitadlo, j) == 999.9)
          pocitadlo = pocitadlo + 1;
          if(pocitadlo >= dlzkaVstupu(1))
            poslednaDeviatka = true;
            break;
          endif
        endwhile
        
        if(poslednaDeviatka)
          break;
        endif
      
        pocetDeviatiek = pocitadlo - prvaDeviatka;

        if(pocetDeviatiek <= 24) 
          rozdielHranicnychHodnot = abs(data(prvaDeviatka - 1, j) - data(pocitadlo, j));
          dielik = rozdielHranicnychHodnot / (pocetDeviatiek + 1);
          for i = prvaDeviatka:pocitadlo - 1
            if (data(prvaDeviatka - 1, j) < data(pocitadlo, j))
              data(i, j) = data(prvaDeviatka - 1, j) + (i - prvaDeviatka + 1) * dielik;
            else
              data(i, j) = data(prvaDeviatka - 1, j) - (i - prvaDeviatka + 1) * dielik;
            endif
          endfor
        endif
      endif
      pocitadlo = pocitadlo + 1;
    endwhile
  endfor

  pomocneData = [(0:dlzkaVstupu-1)', data(1:dlzkaVstupu, 1:4)];

  vystup = [];

  for i = 1:dlzkaVstupu
    dataBezDevietiek = true;
    for j = 2:5
      if(pomocneData(i, j) == 999.9)
        dataBezDevietiek = false;
        break;
      endif
    endfor
    if(dataBezDevietiek)
      vystup = [vystup; pomocneData(i, 1:size(pomocneData)(2))];
    endif
  endfor

  retVal = vystup;

endfunction
 