%pontos:
pontos1 = [1:10]; %10 pontos
pontos2 = linspace(1,10,20); %20 pontos
pontos3 = linspace(1,10,30); %20 pontos
grau_polinomio = 9;

%calculando a matriz de vandermonde:
v1 = vander(pontos1,grau_polinomio + 1);
v2 = vander(pontos2,grau_polinomio + 1);
v3 = vander(pontos3,grau_polinomio + 1);
b1 = v1'*v1;
b2 = v2'*v2;
b3 = v3'*v3;

%calculando a potencia nos pontos1,2,3:

%potencia para pontos1
for k=1:10
  y1(k) = power(pontos1(k));
end

  r1 = v1'*y1';
  c1 = b1\r1;
  
%potencia para pontos2
for k=1:20
 y2(k) = power(pontos2(k));
end
  
  r2 = v2'*y2';
  c2 = b2'*r2;
  
%potencia para pontos3
for k=1:30
  y3(k) = power(pontos3(k));
end

  r3 = v3'*y3';
  c3 = b3'*r3;
  
  p1 = polyfit(pontos1,y1,grau_polinomio)
  p2 = polyfit(pontos2,y2,grau_polinomio)
  p3 = polyfit(pontos3,y3,grau_polinomio)