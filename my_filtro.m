function matriz = my_filtro(IMAGE,viz,p)

% MY_FILTRO - produz uma imagem suavizada, em que a cada ponto
% corresponde � mediana ou m�dia, dependendo da escolha do utilizador, da 
% vizinhan�a escolhida, de todos os pontos de uma imagem 
 
% Chamada da fun��o:
%     matriz = my_filtro(IMAGE, viz, p)
 
% Vari�veis de entrada:
%     IMAGE: imagem pr�-processada atrav�s de rgb2gray e normaliza��o
%     viz: vizinhan�a escolhida pelo utilizador
%     p: par�metro, se for 1 � a mediana se for 2 � a m�dia
 
% Vari�veis de sa�da:
%     matriz: matriz dos pontos da imagem ap�s a aplica��o da m�dia ou
%     mediana
 
 
% Outras vari�veis locais:
%     d: alcance da vizinhan�a
%     x1: abcissa do ponto a partir do qual come�a a vizinhan�a em estudo
%     x2: abcissa do ponto no qual termina a vizinhan�a em estudo
%     y1: ordenada do ponto a partir do qual come�a a vizinhan�a em estudo
%     y2: ordenada do ponto no qual termina a vizinhan�a em estudo
%     tipo: vari�vel que define se a vizinhan�a � par(1) ou �mpar(2)
%     N: corresponde, no caso de um vetor com n�mero par de elementos, ao
%     elemento mais � esquerda entre os dois elementos centrais, no caso de 
%     um vetor com n�mero �mpar de elementos, ao elemento do meio
 
 
% Objetivo: calcular a m�dia ou mediana, esta escolha � feita pelo
% utilizador, de cada elemento da matriz correspondente � imagem, bem como
% � sua vizinhan�a, tamb�m esta definida pelo utilizador. E, assim, obter
% uma imagem mais suavizada ou com redu��o de ru�do relativamente � imagem
% original.

[i j] = size(IMAGE);
d = floor(viz/2);                            %d � o alcance da vizinhan�a
                                             
% Comando if que define as vari�veis de forma concordante com o tipo de
% vizinhan�a

if floor(viz/2)==viz/2                       %Vizinhan�a par
    x1 = d;
    x2 = i-d;
    y1 = d;
    y2 = j-d;
    tipo = 1;
   matriz = zeros(i-2*d+1,j-2*d+1);           
else                                         %Vizinhan�a impar
    x1 = d+1;
    x2 = i-d-1;
    y1 = d+1;
    y2 = j-d-1;
    tipo = 2;
    matriz = zeros(i-2*d,j-2*d);  
end
    
%C�lculo da mediana ou media na parte central da imagem
    
for x = x1:x2                            %Leitura dos valores centrais
    for y = y1:y2
        valores = vetviz(IMAGE,x,y,viz); %Vetor com valores da vizinhan�a
        switch p

           case 1


               vetor = ordenar(valores);        %Vetor ordenado
               N = ceil(length(vetor)/2);
                switch tipo
                    case 1
                        matriz(x-d+1,y-d+1) = (vetor(N)+vetor(N+1))/2;
                    case 2
                        matriz(x-d,y-d) = vetor(N);  
                end

           case 2
               soma = 0;
                for i=1:length(valores)
                    soma = soma + valores(i);
                end
            switch tipo
                case 1
                    matriz(x-d+1,y-d+1) = soma/length(valores); 
                case 2                        
                    matriz(x-d,y-d) = soma/length(valores);
            end

       end

    end
end
     
%Concaten��o da mediana central com as matrizes da mediana ou media em cada borda
%Primeiramente a mediana ou media 2.1 e 2.2
    matriz = [analiseborda(IMAGE,2,1,viz,p); matriz; analiseborda(IMAGE,2,2,viz,p)];
%Por fim concatena��o com a mediana ou media 1.1 e 1.2
    matriz = [analiseborda(IMAGE,1,1,viz,p) matriz analiseborda(IMAGE,1,2,viz,p)];
end



