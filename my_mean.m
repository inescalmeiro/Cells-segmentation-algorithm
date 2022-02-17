function media = my_mean(IMAGE,viz)
% MY_MEAN - calcula em todos os pontos da imagem a média dos valores desse
% ponto e da correspondente vizinhança
%
% Chamada da função:
%     media = my_mean(IMAGE, viz)
 
% Variáveis de entrada:
%     IMAGE: imagem pré-processada através de rgb2gray e normalização
%     viz: vizinhança escolhida pelo utilizador
 
% Variáveis de saída:
%     media: matriz com as médias de cada ponto e correspondente vizinhança

% Objetivo: calcula a média de cada ponto da imagem e da sua respetiva
% vizinhança, escolhida pelo utilizador, suavizando desta forma a imagem
% final obtida

% Testes da validade dos inputs
while viz ~= floor(viz) || viz <= 2 || viz > 10 || isnumeric(viz) == 0
    per = {'Introduza um número natural, por favor:'};
    res = inputdlg(per,'Erro!',[1 40]);
    
    viz = str2num(res{1});
end

media = my_filtro(IMAGE,viz,2);
end