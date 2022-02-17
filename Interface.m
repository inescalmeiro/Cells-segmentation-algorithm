%Sistema processamento de imagem
% 
% Objetivo: Processar imagens com recurso a algoritmos de derivação,
% binarização e filtragem
% 
%   Date           
%   ====               
% 29/01/21 
%
% Autores
% ======      =======     =======
%Ana Magalhães up202007440 MIB1F
%Ana Pinto up202008182 MIB1F
%Inês Calmeiro up202007385 MIB1F
%José Santos up202007566 MIB1F
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

%Por favor corra o programa para começar o processamento

clear 
close all
clc

per = {'Nomeie o ficheiro que deseja ler'};

res = inputdlg(per,'Input',[1 40]);

I = res{1};
                
Image = imread(I);

comando = 1;

while comando == 1
    sis(Image)

per = ['Pretende continuar a processar este ficheiro?'];

lista = {'Sim' 'Não'};
comando = listdlg('PromptString',per, 'SelectionMode', 'single','ListSize',[350,250],'ListString',lista);
end

msgbox('Esperamos que tenha gostado da experiência')
        
            
                