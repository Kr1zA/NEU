function [retVal] = zadanieB(normalizovaneBurkyNaUcenie, normalizovaneDataNaTestovanie)

data = normalizovaneBurkyNaUcenie(1:size(normalizovaneBurkyNaUcenie), 2:5);

pocetBurok = size(data)(1)/144;

n = 0.01;

# generovavie vah
w1 = rand(41, 9) * 2 - 1;
w2 = rand(10, 9) * 2 - 1;
w3 = rand(10, 1) * 2 - 1; 
  
  for k = 0:pocetBurok - 1
   
    storm = data(1 + k * 144:144 + k * 144, 1:4);
    
    for m = 0:100
      
      w1n = [];
      w2n = [];
      w3n = [];
      
      vystupyPouziteNaVstupe = rand(8, 1) * 2 - 1;
      
      for j = 1:144 - 10
                
        V1 = [];
        V2 = [];
        V3 = [];

        X = [-1; storm(j:j + 7, 1); storm(j:j + 7, 2); storm(j:j + 7, 3); storm(j:j + 7, 4); vystupyPouziteNaVstupe]; 
        #pocitanie vystupov 1 vnutornej vrstvy
        V1 = X' * w1;  
        V11 = [-1,V1];
        V1 = tanh(V1); 
        V1 = [-1,V1];
        
        #pocitanie vystupov 2 vnutornej vrstvy
        V22 = V1*w2;
        V22 = [-1,V22];
        V2 = tanh(V1*w2); 
        V2 = [-1,V2];
        
        #pocitanie vestupov vystunej vrstvy
        V3 = tanh(V2*w3); 
        
        delta3 = (1-(tanh(V2*w3))^2)*(storm(j + 9, 4)-V3);
        
        derivacia2 = (ones(1,10).-((tanh(V22)).^2));
        
        delta2 = (derivacia2.*(w3*delta3)');
      
        derivacia1 = (ones(1,10).-((tanh(V11)).^2));
        
        delta2pom = delta2(2:10);
        
        delta1 = (derivacia1.*(w2*delta2pom')');
        
        w1n = [];
        w2n = [];
        w3n = [];
        
        for o = 1:41
          w1n = [w1n; w1(o,1:9).+(n*delta1(2:10)'*X(o))'];
        endfor
      
      
        w2n = w2(1,1:9).+(n*delta2(2:10)'*-1)';
        for i = 2:10;
          w2n = [w2n;w2(i,1:9).+(n*delta2(2:10)'*V1(i))'];
        endfor;
        w3n = w3.+(n*delta3*V2)';
     
        w1 = w1n;
        w2 = w2n;
        w3 = w3n;
        
        vystupyPouziteNaVstupe = [vystupyPouziteNaVstupe(2:8); V3];
        
      endfor;
       
    endfor;
    
  endfor
  
  dataNaTestovanie = normalizovaneDataNaTestovanie(1:size(normalizovaneDataNaTestovanie), 2:5);
  
  vystupyPouziteNaVstupe = rand(8, 1) * 2 - 1;
  
  odhadnuteDst = [];
  
  for j = 1:size(dataNaTestovanie) - 10
        X = [-1; dataNaTestovanie(j:j + 7, 1); dataNaTestovanie(j:j + 7, 2); dataNaTestovanie(j:j + 7, 3); dataNaTestovanie(j:j + 7, 4); vystupyPouziteNaVstupe]; 
        #pocitanie vystupov 1 vnutornej vrstvy
        V1 = X' * w1;  
        V11 = [-1,V1];
        V1 = tanh(V1); 
        V1 = [-1,V1];
        
        #pocitanie vystupov 2 vnutornej vrstvy
        V22 = V1*w2;
        V22 = [-1,V22];
        V2 = tanh(V1*w2); 
        V2 = [-1,V2];
        
        #pocitanie vestupov vystunej vrstvy
        V3 = tanh(V2*w3); 
        
        odhadnuteDst = [odhadnuteDst, V3];
        vystupyPouziteNaVstupe = [vystupyPouziteNaVstupe(2:8); V3];
                
  endfor
  
  retVal = odhadnuteDst;
  
  endfunction;