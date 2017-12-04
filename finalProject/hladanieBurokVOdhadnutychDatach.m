#geomagneticke burky

function retVal = hladanieBurokVOdhadnutychDatach(vstup)

  Dst = vstup(:, size(vstup)(2));
  dlzkaVstupu = size(Dst);

  Obr1 = figure;
  figure(Obr1);

  subplot(2, 1, 1); 
  plot(1:dlzkaVstupu, Dst);
  hold on;
  plot([0, dlzkaVstupu(1)], [0, 0], 'k:');
  hold on;
  subplot(2, 1, 2);
  plot([36, 36],[-150, 100],'k:');
  pocetBurok = 0;
  pozicieBurok = [];
  i = 37; %predpoklad je ze data maju aspon cca 180 riadkov
  while(i < dlzkaVstupu(1) - 106)

    if(Dst(i) - Dst(i+2) > 40);
         
      pocetBurok++;
      plot(1:144, Dst(i-36:i+107));
      hold on;
      i + 9 %tieto data su posunute o 10
      pozicieBurok = [pozicieBurok, i];
      i = i + 144;
      continue
    endif
    i++;
  endwhile
  plot([36 36],[-100 50],'k:');
  pocetBurok
  
    retVal = pozicieBurok;
 
endfunction