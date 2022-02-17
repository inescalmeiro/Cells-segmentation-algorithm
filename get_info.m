function imagetext = get_info(imagergb)
% GET_INFO - fornece o valor de intensidade de um pixel escolhido e o
% valor máximo e mínimo da derivada
%
% Chamada da função:
%     y = get_info(image, p)
 
% Variáveis de entrada:
%     imagergb: imagem rgb
  
% Variáveis de saída:
%     imagetext: imagem com o texto aplicado
 
% Outras variáveis locais:
%     cx: abcissa de um ponto da imagem
%     cy: ordenada de um ponto da imagem
%     r: valor da intensidade de vermelho do pixel escolhido
%     g: valor da intensidade de verde do pixel escolhido
%     b: valor da intensidade de azul do pixel escolhido
%     der: derivada da imagem
%     max: máximo da derivada
%     min: mínimo da derivada
%     comando: comando que armazena informações das decisões do utilizador
%     per: pergunta feita ao utilizador

 
% Objetivo: colocar a intensidade de um pixel escolhido pelo utilizador e
% os valores mínimo e máximo da derivada na imagem inicial



    img = rgb2gray(imagergb);
    img = my_norm(img);
    der = my_deriv(img,3);
    max = my_max(der);
    min = my_min(der);
    
    [i j] = size(img);
    
    comando = 1;
    imagetext = imagergb;
    r = 0; 
    while comando == 1
              
            imshow(imagetext) 
            title('Escolha um pixel')
            [cx,cy] = ginput(1);
            
            % Caso os pontos estejam muito à direita contatena-se uma
            % matriz para ser possível ler o texto
            if j-cx < 160 && r~=1
                extra = cat(3, ones(i,160), ones(i,160), ones(i,160));
                imagetext = [imagetext extra];
                %r impede que a concatenação ocorra mais que uma vez
                r = 1;
            end

            r = double(imagergb(floor(cy),floor(cx),1));
            g = double(imagergb(floor(cy),floor(cx),2));
            b = double(imagergb(floor(cy),floor(cx),3));
            
            t = ['R: ' num2str(r) ' G: ' num2str(g) ' B: ' num2str(b)];
            
            imagetext = insertText(imagetext, [cx cy], t, 'boxopacity', 0.4, 'fontsize', 15);
                
            per = {'Pretende colocar mais intensidades?'};
                lista = {'Sim' 'Não'};
            comando = listdlg('PromptString',per, 'SelectionMode', 'single','ListSize',[350,250],'ListString',lista);

    end
 
        
    t = ['Derivada máxima - ' num2str(max) '        Derivada mínima - ' num2str(min)];
    imagetext = insertText(imagetext, [40,10], t, 'boxopacity', 0, 'fontsize',15);

end