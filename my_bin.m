function binar = my_bin(image,lmin,lmax,posbin,viz,r,tipo)
% MY_BIN - binariza a imagem, ou seja, coloca os valores entre 0 e 1
%
% Chamada da função:
%     binar = my_bin(IMAGE,lmin,lmax,posbin,viz,r,tipo)
 
% Variáveis de entrada:
%     IMAGE: imagem pré-processada através de rgb2gray e normalização
%     lmin: limite inferior
%     lmax: limite superior
%     posbin: se for 1 faz processamento, se for 2 não o faz
%     viz: vizinhança escolhida pu não pelo utilizador
%     r: repetição, escolhida ou não pelo utilizador
%     tipo: se for 1 é do tipo preto e branco, se for 2 é a cores
 
% Variáveis de saída:
%     binar: imagem binarizada, com os valores compreendidos entre 0 e 1
 
% Objetivo: binarizar a imagem introduzida, ou seja, comprimir os valores
%de intensidade dos pixels entre 0 e 1, sendo assim possível, por exemplo,
%distinguir o fundo das regiões de interesse da imagem

% Testes da validade dos inputs

while lmin < 0 || lmin > 1 ||  isnumeric(lmin) == 0
    
    per = {'Introduza um número entre 0 e 1'};

    res = inputdlg(per,'Erro! Limite mínimo',[1 40]);

    lmin = str2num(res{1});
    
end

while  lmax < 0 || lmax > 1 ||  isnumeric(lmax) == 0 || lmax<lmin
    per = {'Introduza um número entre 0 e 1 superior ao limite mínimo'};

    res = inputdlg(per,'Erro! Limite máximo',[1 40]);

    lmax = str2num(res{1});
end
 
[i j] = size(image);
bin = zeros(i,j);

for m = 1:j
    for n = 1:i
        if image(n,m)>lmin && image(n,m)<lmax
            bin(n,m)=1;
        end
    end
end

%switch permite escolher entre 4 tipos de imagens
switch tipo
    case 1
        switch posbin
            case 1
                binar = proposbin(bin,viz,r);
            case 2
                binar = bin;
        end
    case 2
        switch posbin
            case 1
                bina = proposbin(bin,viz,r);
            case 2
                bina = bin;
        end
%Ciclo for que define a matriz de 0's e 1's       
binar = image;
for x = 1:i
    for y = 1:j
        if bina(x,y) == 0
            binar(x,y) = 1;
        end
    end
end
     
end
end