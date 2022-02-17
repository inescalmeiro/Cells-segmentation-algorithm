function mediana = my_median(IMAGE,viz)
% MY_MEDIAN - calcula em todos os pontos da imagem a mediana do seu valor e
% respetiva vizinhança
%
% Chamada da função:
%     mediana = my_median(IMAGE,viz)
 
% Variáveis de entrada:
%     IMAGE: imagem pré-processada através de rgb2gray e normalização
%     viz: vizinhança escolhida pelo utilizador
 
% Variáveis de saída:
%     mediana: imagem com menos ruído
 
% Objetivo: suavizar a imagem através da mediana entre o valor
% correspondente a cada ponto e todos pertencentes à sua vizinhança,
% escolhida pelo utilizador

% Testes da validade dos inputs

while viz ~= floor(viz) || viz <= 2 || viz > 10 || isnumeric(viz) == 0
    per = {'Introduza um número natural, por favor:'};
    res = inputdlg(per,'Erro!',[1 40]);
    
    viz = str2num(res{1});
end

mediana = my_filtro(IMAGE,viz,1);
end
