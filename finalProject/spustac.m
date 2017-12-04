%spustac


rokyNaUcenie = load('rokyNaUcenie', '-ascii');
rokNaTestovanie = load('rokNaTestovanie', '-ascii');

rokyNaUcenieBezChybajucichDat = preprocessing(rokyNaUcenie);
rokNaTestovanieBezChybajucichDat = preprocessing(rokNaTestovanie);

normalizacneKonstanty = najdenieNormalizacnychKonstant([rokyNaUcenieBezChybajucichDat; rokNaTestovanieBezChybajucichDat]);

burkyNaUcenie = hladanieBurok(rokyNaUcenieBezChybajucichDat);
hladanieBurok(rokNaTestovanieBezChybajucichDat);

normalizovaneBurkyNaUcenie = normalizacia(burkyNaUcenie, normalizacneKonstanty);
normalizovaneDataNaTestovanie = normalizacia(rokNaTestovanieBezChybajucichDat, normalizacneKonstanty);

"Vypocet siete A"
odhadnuteDstA = zadanieA(normalizovaneBurkyNaUcenie, normalizovaneDataNaTestovanie);
denormalizovaneOdhadnuteDstA = denormalizacia(normalizacneKonstanty', odhadnuteDstA);
hladanieBurokVOdhadnutychDatach(denormalizovaneOdhadnuteDstA);
sko(rokNaTestovanieBezChybajucichDat, denormalizovaneOdhadnuteDstA);

"Vypocet siete B"
odhadnuteDstB = zadanieB(normalizovaneBurkyNaUcenie, normalizovaneDataNaTestovanie);
denormalizovaneOdhadnuteDstB = denormalizacia(normalizacneKonstanty', odhadnuteDstB);
hladanieBurokVOdhadnutychDatach(denormalizovaneOdhadnuteDstB);
sko(rokNaTestovanieBezChybajucichDat, denormalizovaneOdhadnuteDstB);

"Vypocet siete C"
odhadnuteDstC = zadanieC(normalizovaneBurkyNaUcenie, normalizovaneDataNaTestovanie);
denormalizovaneOdhadnuteDstC = denormalizacia(normalizacneKonstanty', odhadnuteDstC);
hladanieBurokVOdhadnutychDatach(denormalizovaneOdhadnuteDstC);
sko(rokNaTestovanieBezChybajucichDat, denormalizovaneOdhadnuteDstC);

"Vypocet siete D"
odhadnuteDstD = zadanieD(normalizovaneBurkyNaUcenie, normalizovaneDataNaTestovanie);
denormalizovaneOdhadnuteDstD = denormalizacia(normalizacneKonstanty', odhadnuteDstD);
hladanieBurokVOdhadnutychDatach(denormalizovaneOdhadnuteDstD);
sko(rokNaTestovanieBezChybajucichDat, denormalizovaneOdhadnuteDstD);