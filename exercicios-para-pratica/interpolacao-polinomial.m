%calculo das potencias para x = [1,10]
y = zeros(10,1);
pontos = [1:10];

for i=1:10
  y(i) =  power(i); % vetor  y vai ser usado na conta A * c = y
end

V = vander(pontos); % matriz de vandermonde 

c = V \ y %  vetor com os coeficientes do polinomio de interpolacao

pontos2 = linspace(1,10,100); %potencia para 100 pontos
for k=1:100
  y2(k) = power(pontos2(k));
end

poli =  polyval(c,pontos2) %avaliando o polinomio nos 100 pontos

spl = spline(pontos,y,pontos2) %fazendo interpolacao de spline

figure(1)#plot para 10 pontos/100 pontos e polinomio em 100 pontos
plot(pontos,y,'o',pontos2,y2,'o',pontos2,poli,'c*')
figure(2)#comparacao entre o polinomio e spline
plot(pontos2,poli,'c*',pontos2,spl,'x')