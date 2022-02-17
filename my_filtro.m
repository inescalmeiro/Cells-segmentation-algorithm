function matriz = my_filtro(IMAGE,viz,p)

% MY_FILTRO - produz uma imagem suavizada, em que a cada ponto
% corresponde à mediana ou média, dependendo da escolha do utilizador, da 
% vizinhança escolhida, de todos os pontos de uma imagem 
 
% Chamada da função:
%     matriz = my_filtro(IMAGE, viz, p)
 
% Variáveis de entrada:
%     IMAGE: imagem pré-processada através de rgb2gray e normalização
%     viz: vizinhança escolhida pelo utilizador
%     p: parâmetro, se for 1 é a mediana se for 2 é a média
 
% Variáveis de saída:
%     matriz: matriz dos pontos da imagem após a aplicação da média ou
%     mediana
 
 
% Outras variáveis locais:
%     d: alcance da vizinhança
%     x1: abcissa do ponto a partir do qual começa a vizinhança em estudo
%     x2: abcissa do ponto no qual termina a vizinhança em estudo
%     y1: ordenada do ponto a partir do qual começa a vizinhança em estudo
%     y2: ordenada do ponto no qual termina a vizinhança em estudo
%     tipo: variável que define se a vizinhança é par(1) ou ímpar(2)
%     N: corresponde, no caso de um vetor com número par de elementos, ao
%     elemento mais à esquerda entre os dois elementos centrais, no caso de 
%     um vetor com número ímpar de elementos, ao elemento do meio
 
 
% Objetivo: calcular a média ou mediana, esta escolha é feita pelo
% utilizador, de cada elemento da matriz correspondente à imagem, bem como
% à sua vizinhança, também esta definida pelo utilizador. E, assim, obter
% uma imagem mais suavizada ou com redução de ruído relativamente à imagem
% original.

[i j] = size(IMAGE);
d = floor(viz/2);                            %d é o alcance da vizinhança
                                             
% Comando if que define as variáveis de forma concordante com o tipo de
% vizinhança

if floor(viz/2)==viz/2                       %Vizinhança par
    x1 = d;
    x2 = i-d;
    y1 = d;
    y2 = j-d;
    tipo = 1;
   matriz = zeros(i-2*d+1,j-2*d+1);           
else                                         %Vizinhança impar
    x1 = d+1;
    x2 = i-d-1;
    y1 = d+1;
    y2 = j-d-1;
    tipo = 2;
    matriz = zeros(i-2*d,j-2*d);  
end
    
%Cálculo da mediana ou media na parte central da imagem
    
for x = x1:x2                            %Leitura dos valores centrais
    for y = y1:y2
        valores = vetviz(IMAGE,x,y,viz); %Vetor com valores da vizinhança
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
     
%Concatenção da mediana central com as matrizes da mediana ou media em cada borda
%Primeiramente a mediana ou media 2.1 e 2.2
    matriz = [analiseborda(IMAGE,2,1,viz,p); matriz; analiseborda(IMAGE,2,2,viz,p)];
%Por fim concatenação com a mediana ou media 1.1 e 1.2
    matriz = [analiseborda(IMAGE,1,1,viz,p) matriz analiseborda(IMAGE,1,2,viz,p)];
end



