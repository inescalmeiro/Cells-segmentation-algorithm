function media = my_mean(IMAGE,viz)
% MY_MEAN - calcula em todos os pontos da imagem a m�dia dos valores desse
% ponto e da correspondente vizinhan�a
%
% Chamada da fun��o:
%     media = my_mean(IMAGE, viz)
 
% Vari�veis de entrada:
%     IMAGE: imagem pr�-processada atrav�s de rgb2gray e normaliza��o
%     viz: vizinhan�a escolhida pelo utilizador
 
% Vari�veis de sa�da:
%     media: matriz com as m�dias de cada ponto e correspondente vizinhan�a

% Objetivo: calcula a m�dia de cada ponto da imagem e da sua respetiva
% vizinhan�a, escolhida pelo utilizador, suavizando desta forma a imagem
% final obtida

% Testes da validade dos inputs
while viz ~= floor(viz) || viz <= 2 || viz > 10 || isnumeric(viz) == 0
    per = {'Introduza um n�mero natural, por favor:'};
    res = inputdlg(per,'Erro!',[1 40]);
    
    viz = str2num(res{1});
end

media = my_filtro(IMAGE,viz,2);
end