%Teste de funções 
%% Leitura da imagem
clear
clc
close all

celula = imread('celula#1.png');

cell = rgb2gray(celula);

%% Normalização
celln = my_norm(cell);
imshow(celln)
%% Histograma

my_hist(cell,1)
hold off
%% Binarização

bin = my_bin(celln,0.12,0.47,2,1,1,2);
imshow(bin)
%% Derivada

der = my_deriv(celln,3);

%% Mediana

mediana = my_median(celln,3);
imshow(mediana)
%% Média

media = my_mean(celln,3);
imshow(media)
%% InsertText

%Esta função apresenta mais potencialidades no ciclo sis

imshow(celln)
[cx, cy] = ginput(1);

text = my_text(celln,cx,cy);
imshow(text)
%% Getinfo

get = get_info(celula);
inshow(get)

%% Segmentação e Regionprop

seg = segmen(celln,0.12,0.47);
props = my_regionprop(seg);

%% Contornos

contornos = cont(celln,0.07);
imshow(contornos)

%% Outros testes

%Considerou-se que ao testar as função acima, as globais, se testou também
%as funções necessárias ao funcionamento destas





