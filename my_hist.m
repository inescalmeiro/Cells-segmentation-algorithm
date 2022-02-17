function my_hist(IMAGE,sgt)
% MY_HIST - converte uma matriz num vetor e desenha o histograma desse
% vetor
%
% Chamada da função:
%     my_hist(IMAGE, sgt)
 
% Variáveis de entrada:
%     IMAGE: imagem pré-processada através de rgb2gray e normalização
%     sgt: parâmetro que permite ao utilizador definir se quer ou não
%     sugestões
 
% Outras variáveis locais:
%     i: vetor com os primeiros dois pontos de inflexão
 
% Objetivo: criar um histograma correspondente aos valores de intensidade
% dos pixels da imagem e permitir ao utilizador escolher se pretende ou não
% sugestões quanto aos pontos de inflexão do histograma


%Switch permite ao utilizador escolher se quer se sugestões ou não 

switch sgt
    case 1
        
    %Se quiser sugestões o programa corre uma função que encontra os pontos de
    %infleção e os coloca no gráfico

    i = (inflection(IMAGE,2))./255;

    a = 1:10000;
    i1 = i(1)*ones(1,10000);
    i2 = i(2)*ones(1,10000);

    hold on
    histogram(my_norm(IMAGE),256)
    title('Histograma da imagem')
    xlabel('Intensidades')
    ylabel('N.º de pixels')
    plot(i1,a)
    plot(i2,a)

    txt1 = [' ' num2str(i(1))];
    text(i(1),10050,txt1)
    txt2 = [' ' num2str(i(2))];
    text(i(2),9050,txt2)
    
    case 2
        histogram(my_norm(IMAGE),256)
        title('Histograma da imagem')
        xlabel('Intensidades')
        ylabel('N.º de pixels')

end
end