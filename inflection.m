function ind = inflection(IMAGE,pts)
% INFLECTION - determina os pts's primeiros pontos de inflexão do gráfico
% de aproximação ao histograma de uma imagem
%
% Chamada da função:
%     ind = inflection(IMAGE, pts)
 
% Variáveis de entrada:
%     IMAGE: imagem pré-processada através de rgb2gray e normalização
%     pts: número de pontos de inflexão a calcular
 
% Variáveis de saída:
%     ind: vetor com pontos de inflexão
 
% Outras variáveis locais:
%     l: comprimento do vetor, número de elementos
%     int: número de vezes de ocorrência de cada intensidade dos pixels
%     p: polinómio associado à função que relaciona as
%     intensidades dos pixels com a sua ocorrência
%     y: ordenadas do gráfico de aproximação ao histograma da imagem
%     SD: segunda derivada do gráfico de aproximação ao histograma da
%     imagem
%     minimo: mínimo da segunda derivada do gráfico de aproximação ao
%     histograma da imagem
%     index: vetor dos indíces dos valores da segunda derivada ordenados de
%     forma crescente
%     ind: vetor dos índices de índice mais baixo cuja diferença entre os
%     primeiros índices é significativa
 
% Objetivo: calcular os pontos de inflexão do gráfico de aproximação ao
% histograma da imagem

vetor = vec(IMAGE);

l = length(vetor);


% Cálculo do vetor que contem o número de recorrências de cada intensidade

int = [];

for n = 0:255
    occ = 0;
    for i = 1:l
        if vetor(i)==n
           occ = occ + 1;
        end
    end
    int = [int occ];
end

v = 0:255;

grau = 5;

% Cálculo da segunda derivada do gráfico de aproximação ao histograma

p = polyfit(v,int,grau);

y = polyval(p,v);

SD = abs(diff(diff(y)));

minimo = my_min(SD);
index = [];

%Cálculo do vetor que contem os indíces correspodente ás derivada ordenada
%de forma crescente

for i = 1:length(SD)
    max = SD(1);
    p = 1;
    for k = 1:length(SD)
        if SD(k)>max
            max = SD(k);
            p = k;
        end
    end
    SD(p)= minimo-1;
    index = [p index];
end

ind = [index(1)];
n = 2;

% Cálculo dos primeiros pontos significativamente espaçados do vetor ind

while length(ind)~= pts
 
    controlo =1;
    for k = 1:length(ind)
        if abs(ind(k)-index(n))<0.07
            controlo = 0;
        end
    end
        if controlo ==1
            ind = [ind index(n)];
        end
    n = n+1;
end
end
