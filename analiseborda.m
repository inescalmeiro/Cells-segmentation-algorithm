function matriz = analiseborda(IMAGE,a,b,viz,p)
% ANALISEBORDA - cria as matrizes correspondentes à mediana e média nos
% pontos das bordas da imagem
 
% Chamada da função:
%     matriz = analiseborda(IMAGE, a, b, viz, p)
 
% Variáveis de entrada:
%     IMAGE: imagem pré-processada através de rgb2gray e normalização
%     a: índice de primeira ordem da região em estudo
%     b: índice de segunda ordem da região em estudo
%     viz: vizinhança escolhida pelo utilizador
%     p: parâmetro, se for 1 é a mediana se for 2 é a média
 
% Variáveis de saída:
%     matriz: matriz de uma dada região da imagem inicial após um
%     tratamento de média ou mediana
 
% Outras variáveis locais:
%     d: alcance da vizinhança
%     newimage: matriz correspondente à matriz da imagem inicial rodeado
%     por -1
%     x1: abcissa do ponto a partir do qual começam os pixeis em estudo
%     x2: abcissa do ponto no qual terminam os pixeis em estudo
%     y1: ordenada do ponto a partir do qual começam os pixeis em estudo
%     y2: ordenada do ponto no qual terminam os pixeis em estudo 
%     f: ajuste do índice da abcissa à região em estudo
%     e: ajuste do índice da ordenada à região em estudo
%     valores: vetor com os valores dos elementos da vizinhança da matriz,
%     incluindo os -1 previamente adicionados à matriz original
 
% Objetivo: analisa diferentes regiões das bordas da imagem e cria as
% matrizes correspondestes à média ou mediana das vizinhanças de cada ponto 

[i j] = size(IMAGE);
d = floor(viz/2); 

%Essas bordas são preenchidas por -1's que serão depois descartados
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

%Switch que vai atribui às variáveis x1, x2, y1 e y2 valores que indiquem as
%casas a ser analisada, nomeadamente, as linhas inicial e final e a coluna
%inicial e final, respetivamente.
%Atribui às variáveis e e f valores que permitirem fazer o ajuste dos 
%índices e cria uma matriz de zeros com o tamanho apropriado

%Definidas as variáveis, os ciclos for são executados de forma
%personalizada para cada segmento da mediana ou media

for x = x1:x2
    for y = y1:y2
        valores = vetviz(newimage,x+floor((viz-1)/2),y+floor((viz-1)/2),viz);  %Valores da vizinhança
        
        switch p
            case 1
        matriz(x+f,y+e) = medianandes(notnegone(valores));
       
            case 2
        matriz(x+f,y+e) = sum(notnegone(valores))/length(valores);        
        
        %Para cada indice ajustado à nova matriz o valor do pixel é o da
        %mediana ou media entre os valores da respetiva vizinhança após terem 
        %sido descartados os valores -1
        end
    end
end
end