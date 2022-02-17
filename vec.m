function vetor = vec(image)
% MY_VEC - converte matrizes em vetores
%
% Chamada da função:
%     vetor = my_vec(IMAGE)
 
% Variáveis de entrada:
%     IMAGE: imagem pré-processada através de rgb2gray e normalização
 
% Variáveis de saída:
%     vetor: vetor que corresponde a todas as linhas da matriz de entrada
  
% Objetivo: transformar uma matriz num só vetor através da concatenação de
% todas as linhas
 
[i j] = size(image);
vetor = [];
for r = 1:i
    vetor = [vetor image(r,:)];
end
end