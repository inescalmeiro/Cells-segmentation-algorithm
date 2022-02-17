function props = my_regionprop(image)

label= bwlabel(image);

[i j] = size(label);
maxi = zeros(1,j);

%Ciclo for que averigua o número de regiões
for x = 1:i
    max = my_max(label(x,:));
    maxi(1,x) = max;
end

max = my_max(maxi);

centro = zeros(max,2);
dia = zeros(max,2);
area = zeros(max,1);
for reg=1:max
    [row col] = my_find(label == reg);
    
    %Ciclo for que calcula o número de pixels existentes em cada região
    
    soma = 0;
    for x = 1:i
        for y = 1:j
            if label(x,y) == reg
                soma = soma +1;
            end
        end
    end
    
    area(reg,1)=soma;
    
    %Cálculo dos diâmetros
    
    lx = my_max(row)-my_min(row)+2;
    ly = my_max(col)-my_min(col)+2;
    
    diame = lx;
    diama = ly;
   
    if lx > ly
         diame = ly;
         diama = lx;
    end
    
    dia(reg,1)=diame;
    dia(reg,2)=diama;
    
    %Cálculo do pixel central de cada região
    
    x1 = my_min(row)-1;
    y1 = my_min(col)-1;
    xc = x1 + floor(lx/2);
    yc = y1 + floor(ly/2);
    
    centro(reg,1)=xc;
    centro(reg,2)=yc;   
    
end

%Cálculo das distâncias ao centro mais próximo para cada região

dismin = zeros(max,1);
for reg = 1:max
    dmin = 1024;
    for reg2 = 1:max
        x1 = centro(reg,1);
        y1 = centro(reg,2);
        x2 = centro(reg2,1);
        y2 = centro(reg2,2);
        d = sqrt((x1-x2)^2+(y1-y2)^2);
        if d < dmin && d~=0
            dmin = d;
        end
    end
    dismin(reg,1)=dmin;
end

% Concatenação dos vetores de propriedades
props = [centro area dia dismin];
end
    
