function matriz = analiseborda(IMAGE,a,b,viz,p)
% ANALISEBORDA - cria as matrizes correspondentes � mediana e m�dia nos
% pontos das bordas da imagem
 
% Chamada da fun��o:
%     matriz = analiseborda(IMAGE, a, b, viz, p)
 
% Vari�veis de entrada:
%     IMAGE: imagem pr�-processada atrav�s de rgb2gray e normaliza��o
%     a: �ndice de primeira ordem da regi�o em estudo
%     b: �ndice de segunda ordem da regi�o em estudo
%     viz: vizinhan�a escolhida pelo utilizador
%     p: par�metro, se for 1 � a mediana se for 2 � a m�dia
 
% Vari�veis de sa�da:
%     matriz: matriz de uma dada regi�o da imagem inicial ap�s um
%     tratamento de m�dia ou mediana
 
% Outras vari�veis locais:
%     d: alcance da vizinhan�a
%     newimage: matriz correspondente � matriz da imagem inicial rodeado
%     por -1
%     x1: abcissa do ponto a partir do qual come�am os pixeis em estudo
%     x2: abcissa do ponto no qual terminam os pixeis em estudo
%     y1: ordenada do ponto a partir do qual come�am os pixeis em estudo
%     y2: ordenada do ponto no qual terminam os pixeis em estudo 
%     f: ajuste do �ndice da abcissa � regi�o em estudo
%     e: ajuste do �ndice da ordenada � regi�o em estudo
%     valores: vetor com os valores dos elementos da vizinhan�a da matriz,
%     incluindo os -1 previamente adicionados � matriz original
 
% Objetivo: analisa diferentes regi�es das bordas da imagem e cria as
% matrizes correspondestes � m�dia ou mediana das vizinhan�as de cada ponto 

[i j] = size(IMAGE);
d = floor(viz/2); 

%Essas bordas s�o preenchidas por -1's que ser�o depois descartados
if d == viz/2
    newimage = [-ones(i,d-1) IMAGE -ones(i,d)];  
    newimage = [-ones(d-1,d+j+d-1); newimage; -ones(d,d+j+d-1)];
    switch a
    case 1
        x1 = 1;
        x2 = i;
        f = 0;
            switch b
                case 1
                     y1 = 1;
                     y2 = d-1;
                     e = 0;
                     matriz = zeros(i,d-1);
                case 2
                    y1 = j-d+1;
                    y2 = j;
                    e = d-j;
                    matriz = zeros(i,d);
            end
    case 2
        y1 = d;
        y2 = j-d; 
        e = -d+1;
            switch b
                case 1
                    x1 = 1;
                    x2 = d-1;
                    f = 0;
                    matriz = zeros(d-1,j-2*d+1);
                case 2
                    x1 = i-d+1;
                    x2 = i;
                    f = d-i;
                    matriz = zeros(d,j-2*d+1);
            end
    end

else
newimage = [-ones(i,d) IMAGE -ones(i,d)];  
newimage = [-ones(d,d+j+d); newimage; -ones(d,d+j+d)];

switch a
    case 1
        x1 = 1;
        x2 = i;
        matriz = zeros(i,d);
        f = 0;
            switch b
                case 1
                     y1 = 1;
                     y2 = d;
                     e = 0;
                case 2
                    y1 = j-d+1;
                    y2 = j;
                    e = d-j;
            end
    case 2
        y1 = d+1;
        y2 = j-d; 
        matriz = zeros(d,j-2*d);
        e = -d;
            switch b
                case 1
                    x1 = 1;
                    x2 = d;
                    f = 0;
                case 2
                    x1 = i-d+1;
                    x2 = i;
                    f = d-i;
            end
end
end

%Switch que vai atribui �s vari�veis x1, x2, y1 e y2 valores que indiquem as
%casas a ser analisada, nomeadamente, as linhas inicial e final e a coluna
%inicial e final, respetivamente.
%Atribui �s vari�veis e e f valores que permitirem fazer o ajuste dos 
%�ndices e cria uma matriz de zeros com o tamanho apropriado

%Definidas as vari�veis, os ciclos for s�o executados de forma
%personalizada para cada segmento da mediana ou media

for x = x1:x2
    for y = y1:y2
        valores = vetviz(newimage,x+floor((viz-1)/2),y+floor((viz-1)/2),viz);  %Valores da vizinhan�a
        
        switch p
            case 1
        matriz(x+f,y+e) = medianandes(notnegone(valores));
       
            case 2
        matriz(x+f,y+e) = sum(notnegone(valores))/length(valores);        
        
        %Para cada indice ajustado � nova matriz o valor do pixel � o da
        %mediana ou media entre os valores da respetiva vizinhan�a ap�s terem 
        %sido descartados os valores -1
        end
    end
end
end