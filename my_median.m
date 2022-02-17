function mediana = my_median(IMAGE,viz)
% MY_MEDIAN - calcula em todos os pontos da imagem a mediana do seu valor e
% respetiva vizinhan�a
%
% Chamada da fun��o:
%     mediana = my_median(IMAGE,viz)
 
% Vari�veis de entrada:
%     IMAGE: imagem pr�-processada atrav�s de rgb2gray e normaliza��o
%     viz: vizinhan�a escolhida pelo utilizador
 
% Vari�veis de sa�da:
%     mediana: imagem com menos ru�do
 
% Objetivo: suavizar a imagem atrav�s da mediana entre o valor
% correspondente a cada ponto e todos pertencentes � sua vizinhan�a,
% escolhida pelo utilizador

% Testes da validade dos inputs

while viz ~= floor(viz) || viz <= 2 || viz > 10 || isnumeric(viz) == 0
    per = {'Introduza um n�mero natural, por favor:'};
    res = inputdlg(per,'Erro!',[1 40]);
    
    viz = str2num(res{1});
end

mediana = my_filtro(IMAGE,viz,1);
end
