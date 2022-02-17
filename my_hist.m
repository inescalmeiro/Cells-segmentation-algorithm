function my_hist(IMAGE,sgt)
% MY_HIST - converte uma matriz num vetor e desenha o histograma desse
% vetor
%
% Chamada da fun��o:
%     my_hist(IMAGE, sgt)
 
% Vari�veis de entrada:
%     IMAGE: imagem pr�-processada atrav�s de rgb2gray e normaliza��o
%     sgt: par�metro que permite ao utilizador definir se quer ou n�o
%     sugest�es
 
% Outras vari�veis locais:
%     i: vetor com os primeiros dois pontos de inflex�o
 
% Objetivo: criar um histograma correspondente aos valores de intensidade
% dos pixels da imagem e permitir ao utilizador escolher se pretende ou n�o
% sugest�es quanto aos pontos de inflex�o do histograma


%Switch permite ao utilizador escolher se quer se sugest�es ou n�o 

switch sgt
    case 1
        
    %Se quiser sugest�es o programa corre uma fun��o que encontra os pontos de
    %infle��o e os coloca no gr�fico

    i = (inflection(IMAGE,2))./255;

    a = 1:10000;
    i1 = i(1)*ones(1,10000);
    i2 = i(2)*ones(1,10000);

    hold on
    histogram(my_norm(IMAGE),256)
    title('Histograma da imagem')
    xlabel('Intensidades')
    ylabel('N.� de pixels')
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
        ylabel('N.� de pixels')

end
end