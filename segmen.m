function imageseg = segmen(IMAGE,lim1,lim2)

% Testes da validade dos inputs
while lim1 < 0 || lim1 > 1 ||  isnumeric(lim1) == 0
    
    per = {'Introduza um número entre 0 e 1'};

    res = inputdlg(per,'Erro! Limite mínimo',[1 40]);

    lim1 = str2num(res{1});
    
end

while  lim2 < 0 || lim2 > 1 ||  isnumeric(lim2) == 0 || lim2<lim1
    per = {'Introduza um número entre 0 e 1'};

    res = inputdlg(per,'Erro! Limite máximo',[1 40]);

    lim2 = str2num(res{1});
end
 


imagebin = my_bin(IMAGE,lim1,lim2,1,3,4,1);
        
imlabel = bwlabel(imagebin);

imshow(imlabel)

comando = 1;
inten = [];
while comando == 1

    imshow(imlabel)
    title('Selecione a região que pretende incluir')
    [x y] = ginput(1);

    int=imlabel(floor(y),floor(x));

    inten = [inten int];
    per = {'Pretende incluir mais regiões?'};
    lista = {'Sim' 'Não'};
    comando = listdlg('PromptString',per, 'SelectionMode', 'single','ListSize',[350,250],'ListString',lista);
end
[i j] = size(imagebin);

imageseg = (imlabel==inten(1));

if length(inten) > 1
    imageseg = zeros(i,j);
    for ind=1:length(inten)
        img = double(imlabel==inten(ind));
        imageseg = imageseg + double(imlabel==inten(ind));
    end
end
end
