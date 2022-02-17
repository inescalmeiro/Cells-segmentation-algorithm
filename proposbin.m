function posbin = proposbin(bin,viz,r)
% PROPOSBIN - elimina todo o ruído demasiado grosseiro para obter uma
% melhor binarização da imagem


% Chamada da função:
%     posbin = proposbin(bin,viz,r)
 
% Variáveis de entrada:
%     bin: imagem binarizada
%     viz: vizinhança escolhida pelo utilizador
%     r: número de repitações
 
% Variáveis de saída:
%     posbin: imagem com reduzido ruído

 
% Objetivo: é um processo que pode ser repetido várias vezes até se obter 
%uma matriz que possa posteriormente sofrer binarização 



% Testes da validade dos inputs
while viz ~= floor(viz) || viz <= 2 || viz > 10 || isnumeric(viz) == 0
    per = {'Introduza um número natural entre 3 e 10'};
    res = inputdlg(per,'Erro! Vizinhança',[1 40]);
    
    viz = str2num(res{1});
end

while r < 1 || r > 10 || r ~= floor(r) || isnumeric(r) == 0
    per = {'Introduza um número natural entre 1 e 10'};

    res = inputdlg(per,'Erro! Repetições',[1 40]);

    r = str2num(res{1});

end

[i j] = size(bin);
d = floor(viz/2);
bina = bin;
for rep=1:r
    for yb = 1+d:j-d
        for xb = 1+d:i-d
            media = sum(vetviz(bin,xb,yb,viz))/2;
            if media > 0.50
                bina(xb,yb) = 1;
            end
        end
    end
bin = bina;
end
posbin = bina;
end