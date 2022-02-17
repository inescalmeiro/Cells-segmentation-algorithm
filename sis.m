function sis(Image)

%SIS - Ciclo de processamento de imagem

% Chamada da função:
%     sis(Image)
 
% Variáveis de entrada:
%     Image: Imagem rgb
 
% Objetivo: Permitir ao utilizador escolher que tipo de operações pretende
% realizar com elavada autonomia ou de forma praticamente automática
 
%Encadeamente de comandos switch e lisdlg ou inputdlg permitem realizar uma
%série de operações, mediante a decisão do utilizador

per = ['Qual das seguintes opções de processamento pretende utilizar?'];

lista = {'Obter histograma da imagem' 'Binarizar imagem (recomenda-se ver histograma primeiro)' 'Obter contornos' 'Aplicar filtros' 'Inserir texto na imagem' 'Obter informações sobre intesidades na imagem' 'Ver imagem em tons de cinzento normalizada' 'Segmentar a imagem'};
indice = listdlg('PromptString',per, 'SelectionMode', 'single','ListSize',[350,250],'ListString',lista);

grayimage = rgb2gray(Image);
imagenor = my_norm(grayimage);


switch indice
    case 1
        hold off
        
        per = ['Pretende obter sugestões automáticas?'];

        lista = {'Sim' 'Não'};
        comando = listdlg('PromptString',per, 'SelectionMode', 'single','ListSize',[350,250],'ListString',lista);
        
        switch comando
            case 1
                my_hist(grayimage,1)
            case 2   
                my_hist(grayimage,2)
        end
        
        imagesave = -1;
    case 2
        hold off       
        per = ['De que forma pretende binarizar a imagem?'];

        lista = {'Usando sugestões de limites automáticas' 'Definindo os limites de binarização'};
        comando = listdlg('PromptString',per, 'SelectionMode', 'single','ListSize',[350,250],'ListString',lista);                
              
        switch comando
            case 1
                lim = inflection(grayimage,2)./255;
                lim1 = my_min(lim);
                lim2 = my_max(lim);
                             
            case 2
                
                per = {'Limite mínimo (0-1)' 'Limite máximo (0-1)'};

                res = inputdlg(per,'Input',[1 40]);
                           
                lim1 = str2num(res{1});
                lim2 = str2num(res{2});
        end
        per = ['Pretende fazer um processamento pós-binarização?'];

        lista = {'Sim, de forma automática' 'Sim, de forma personalizada' 'Não'};
        comando = listdlg('PromptString',per, 'SelectionMode', 'single','ListSize',[350,250],'ListString',lista);                
            
        switch comando
            case 1
                posbin = 1;
                viz = 3;
                r = 4;
            case 2
                posbin = 1;
                
                per = {'Insira a vizinhaça' 'Insira o número de repetições (1-10)'};

                res = inputdlg(per,'Input',[1 40]);
                           
                viz = str2num(res{1});
                r = str2num(res{2});
            case 3
                posbin = 2;
                viz = 1;
                r = 1;
        end
        
        per = ['Que tipo de imagem pretende obter?'];

        lista = {'Preto e Branco' 'Tons originais nas áreas do intervalo'};
        tipo = listdlg('PromptString',per, 'SelectionMode', 'single','ListSize',[350,250],'ListString',lista);                
        
        imagebin = my_bin(imagenor,lim1,lim2,posbin,viz,r,tipo);
        imshow(imagebin)
        title('Imagem binarizada')
        
        imagesave = imagebin;
        
    case 3
        hold off
        per = ['Pretende definir o limiar de derivada?'];

        lista = {'Sim' 'Não, pretendo utilizar um limiar recomendado'};
        comando = listdlg('PromptString',per, 'SelectionMode', 'single','ListSize',[350,250],'ListString',lista);      
      
        switch comando
            case 1
                per = {'Insira o valor do limiar que pretende (0-1)'};

                res = inputdlg(per,'Input',[1 40]);
                
                lim = str2num(res{1});
                
            case 2
                lim = 0.07;
        end
        
        imageder = cont(imagenor,lim);
        
        imshow(imageder)
        title('Contornos da imagem')
        
        imagesave = imageder;
        
    case 4
        hold off
        per = ['Que tipo de filtro pretende aplicar?'];

        lista = {'Filtro de mediana (redução de ruído)' 'Filtro de média (suavização)'};
        comando = listdlg('PromptString',per, 'SelectionMode', 'single','ListSize',[350,250],'ListString',lista);   
        
        per = {'Insira a vizinhança à qual pretende aplicar o filtro'};

                res = inputdlg(per,'Input',[1 40]);
                
                viz = str2num(res{1});
               
        switch comando
            case 1
                filtro = my_median(imagenor,viz);
            case 2
                filtro = my_mean(imagenor,viz);
        end
        
        imshow(filtro)
        title('Imagem com filtro')
        
        imagesave = filtro;
    case 5
        hold off
        comando = 1;
        imagetext = imagenor;
        while comando == 1
            imshow(imagetext)
            title('Escolha o local onde quer que apareça o texto')
            [cx, cy] = ginput(1);

             imagetext = my_text(imagetext,cx,cy);        
            

        per = ['Pretende inserir mais texto nesta imagem?'];

        lista = {'Sim' 'Não'};
        comando = listdlg('PromptString',per, 'SelectionMode', 'single','ListSize',[350,250],'ListString',lista);
        
        end
        imshow(imagetext)
        title('Imagem com texto')
        imagesave = imagetext;
    case 6
        hold off
               imageget = get_info(Image);
               imshow(imageget)
               title('Imagem com informações')
               imagesave = imageget;
    case 7
        hold off
        imshow(imagenor)
        title('Imagem normalizada')
        imagesave = imagenor;
    case 8
        hold off
       per = {'Limite mínimo (0-1)' 'Limite máximo (0-1)'};

                res = inputdlg(per,'Input',[1 40]);
                           
                lim1 = str2num(res{1});
                lim2 = str2num(res{2}); 
        
       imageseg = segmen(my_median(imagenor,3),lim1,lim2);
       imageseg = imageseg.*imagenor;
       imshow(imageseg)
       title('Imagem segmentada')
       
       per = ['Pretende inserir propriedades na imagem?'];

       lista = {'Sim' 'Não, mas pretendo obter um ficheiro excel' 'Não'};
       comando = listdlg('PromptString',per, 'SelectionMode', 'single','ListSize',[350,250],'ListString',lista);
       
       switch comando 
           case 1
           per = ['Que propriedade predente analisar?'];

            lista = {'Área' 'Diametro maior e menor' 'Distância é célula mais próxima'};
            comando = listdlg('PromptString',per, 'SelectionMode', 'single','ListSize',[350,250],'ListString',lista);

            [i j] = size(imagenor);
            

           props = my_regionprop(imageseg);
           
           if all(props(:,2)<350) == 0
                imageprops = [imagenor ones(i,160)];
           else
               imageprops = imagenor;
           end
           
           [a b] = size(props);
           for reg=1:a
               x = props(reg,1);
               y = props(reg,2);
               switch comando
                   case 1
               area = props(reg,3);
               text = ['Área = ' num2str(area)];
                   case 2
               diame = props(reg,4);
               diama = props(reg,5);
               text = ['Dmin = ' num2str(diame) ' Dmax = ' num2str(diama)];
                   case 3
               dis = props(reg,6)
               text = ['Dist = ' num2str(dis)];
               end
           imageprops = insertText(imageprops, [y x], text, 'boxopacity', 0.4, 'fontsize', 15);
           end
           imshow(imageprops)
           title('Imagem com propriedades')
           
         imagesave = imageprops;
    case 2
        props = my_regionprop(imageseg);


        data = datestr(datetime('today','Format','yyyy-MM-dd'))

        filename = [data '.xlsx'];


        X = [props(:,1)];
        Y = [props(:,2)];
        Area = [props(:,3)];
        DiametroMenor = [props(:,4)];
        DiametroMaior = [props(:,5)];
        DistanciaMinima = [props(:,6)];

        T = table(X,Y,Area,DiametroMenor,DiametroMaior,DistanciaMinima);

        writetable(T,filename)
        imagesave = -1;
       end
end

%Caso exista alguma imagem a guardar o utilizador pode fazê-lo
if imagesave ~= -1    
   per = ['Pretende guardar a imagem?'];

   lista = {'Sim' 'Não'};
   comando = listdlg('PromptString',per, 'SelectionMode', 'single','ListSize',[350,250],'ListString',lista);

   if comando == 1
       per = {'Que nome pretende dar ao ficheiro?'};

       res = inputdlg(per,'Input',[1 40]);

       filename = [res{1} '.png'];
       imwrite(imagesave,filename)
   end

end
end          