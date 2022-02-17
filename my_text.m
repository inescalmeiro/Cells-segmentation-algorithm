function y = my_text(image,cx,cy)
% MY_TEXT - introduz o texto pretendido pelo utilizador num local escolhido
% na imagem
%
% Chamada da função:
%     y = my_text(IMAGE, cx, cy)
 
% Variáveis de entrada:
%     IMAGE: imagem pré-processada através de rgb2gray e normalização
%     cx: abcissa do ponto escolhido na imagem
%     cy: ordenada do ponto escolhido na imagem
 
% Variáveis de saída:
%     y: imagem inicial com o texto escrito no local previamente escolhido
 
% Outras variáveis locais:
%     per: pergunta feita ao utilizador
%     res: resposta escolhida pelo utilizador
 
% Objetivo: aplica na imagem o texto escrito pelo utilizador, no local por
% este escolhido através, para isto apenas é requerido ao utilizador que
% carregue no local da imagem onde quer que o texto apareça   
per = {'Introduza o texto que pretende que apareça na imagem:'};

res = inputdlg(per,'Input',[1 40]);

t = res{1};
y = insertText(image, [cx cy], t, 'boxopacity', 0.4, 'fontsize', 25);
end


