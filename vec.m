function vetor = vec(image)
% MY_VEC - converte matrizes em vetores
%
% Chamada da fun��o:
%     vetor = my_vec(IMAGE)
 
% Vari�veis de entrada:
%     IMAGE: imagem pr�-processada atrav�s de rgb2gray e normaliza��o
 
% Vari�veis de sa�da:
%     vetor: vetor que corresponde a todas as linhas da matriz de entrada
  
% Objetivo: transformar uma matriz num s� vetor atrav�s da concatena��o de
% todas as linhas
 
[i j] = size(image);
vetor = [];
for r = 1:i
    vetor = [vetor image(r,:)];
end
end