function contorno = cont(image,lim)
% CONT - responsável pela definição dos contornos
 
% Chamada da função:
%     contorno = cont(image,lim)
 
% Variáveis de entrada:
%     image: imagem pré-processada através de rgb2gray
%     lim: limite
 
% Variáveis de saída:
%     contorno: contornos da imagem introduzida
 
 
% Outras variáveis locais:
%     derx: valor absoluto da abcissa da derivada da imagem 
%     dery: valor absoluto da ordenada da derivada da imagem 
 
% Objetivo: definir os contornos da imagem introduzida


% Testes da validade dos inputs
while lim < 0 || lim > 1 || isnumeric(lim) == 0
    per = {'Introduza um número natural'};

    res = inputdlg(per,'Erro!',[1 40]);

    lim = str2num(res{1});

end

[i j] = size(image);
derx = abs(my_deriv(image,1));
dery = abs(my_deriv(image,2));

%Limiar define após que valor a derivada permite localizar um contorno

contornox = zeros(i,j);
contornoy = zeros(i,j);
for m = 2:i-1
    for n = 2:j-1
        if derx(m,n) > lim
            contornox(m,n)=1;
        end
        if dery(m,n) > lim
            contornoy(m,n)=1;
        end
    end
end

%Contorno incluirá pixels importante na derivação por colunas e também na
%derivação por linhas

contorno = ~(bitor(contornox,contornoy));
contorno = double(contorno);
end