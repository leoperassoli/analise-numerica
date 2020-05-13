intervalo = linspace(0,pi,100);

f = @(x)(x*exp(-x)*cos(2*x));

#Exercicio 1
f_lin =  @(x)(exp(-x)*cos(2*x)+x*(-exp(-x)*cos(2*x)-2*exp(-x)*sin(2*x)));
f_2lin = @(x)(-3*exp(-x)*x*cos(2*x)+4*exp(-x)*x*sin(2*x)-2*exp(-x)*cos(2*x)-4*exp(-x)*sin(2*x));

y1 = zeros(1, length(intervalo));
y2 = zeros(1, length(intervalo));

for i=1:length(intervalo)
  y1(i) = f_lin(i);
  y2(i) = f_2lin(i);
endfor

subplot(1,2,1)
plot(intervalo,y1,'-o')
title("primeira derivada de f entre 0 e pi")
subplot(1,2,2)
plot(intervalo,y2,'-o')
title('segunda derivada de f entre 0 e pi')

#Exercicio 2
deltinha = [0.2,0.1,0.05,0.0025];
y_forward = zeros(1, length(intervalo));
y_backward = zeros(1, length(intervalo));
y_centered = zeros(1, length(intervalo));


for i=1:length(deltinha) 
  for j=1:length(intervalo)
    y_forward(j) = (f(intervalo(j)+deltinha(i)) - f(intervalo(j)))/deltinha(i) ;
    y_backward(j) = (f(intervalo(j)) - f(intervalo(j) - deltinha(i)))/deltinha(i);
    y_centered(j) = (f(intervalo(j) + deltinha(i)) - f(intervalo(j) - deltinha(i)))/(2*deltinha(i));
  endfor
endfor

y_centered


figure
plot(intervalo,y_forward,intervalo,y_backward,intervalo,y_centered)

#Exercicio 3
x_barra = pi/2;

k = [1,2,3,4,5,6,7,8,9,10];
delta = zeros(1,length(k));
ex3_1 = zeros(1,length(k));
ex3_2 = zeros(1,length(k));
erro_forward = zeros(1,length(k));
erro_centered = zeros(1,length(k));

for i=1:length(k)
  delta(i) = 0.25/k(i);
endfor

for i=1:length(delta)
  ex3_1(i) = (f(x_barra+delta(i)) - f(x_barra))/(delta(i));
  ex3_2(i) = (f(x_barra + delta(i)) - f(x_barra - delta(i)))/(2*delta(i));
 endfor
 
 for i=1:length(delta)
  erro_forward(i) = abs(ex3_1(i) - f_lin(x_barra));
  erro_centered(i) = abs(ex3_2(i) - f_lin(x_barra));
 endfor
 
figure
subplot(1,2,1)
plot(erro_forward,delta,'-o')
title("erro forward finite difference")
subplot(1,2,2)
plot(intervalo,y2,'-o')
title('erro centered finite difference')

#Exercicio 4
delta2 = [0.2,0.1,0.01];
y_seg = zeros(length(delta2), length(intervalo))
y_4 = zeros(1, length(intervalo))

for i=1:length(intervalo)
  for j=1:length(delta2)
    y_seg(j,i) = (f(intervalo(i) + delta2(j)) - 2*f(intervalo(i)) + f(intervalo(i) - delta(j)))/(delta(j)^2)
  endfor
endfor

for i=1:length(intervalo)
  y_4(i) = f_2lin(intervalo(i))
endfor


figure
plot(intervalo,y_seg,intervalo,y_4)
title('aproximacao da segunda derivadas com varios deltas e segunda derivada exata')