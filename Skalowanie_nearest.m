clear;
close all;

% Interpolacja metodą „najbliższego sąsiada”
% metoda najprostsza, w której przy skalowaniu odbywa się wierne 
% kopiowanie najbliższego piksela.

% wczytanie oryginalnego orazu
img = imread('Sequoia.bmp');

% zmiana skali
scale = 4;

% pobieranie rozmiaru oryginalnego obrazu i jego skalowanie
dimension = size(img);
dimension_scale = [floor(dimension(1) * scale), floor(dimension(2) * scale), 3];

% wyświetlanie oryginału
figure(1)
imshow(uint8(img))
tic
% wypełanianie wyskalowanego już obrazu zerami a następnie wyliczenie
% nowej tablicy z ustalonymi proporcjami
dimension_scale_img = zeros(dimension_scale(1), dimension_scale(2), 3);
proportion = [dimension(1)/dimension_scale(1), dimension(2)/dimension_scale(2)];

for c = 1 : dimension_scale(3)
     for i = 1 : dimension_scale(1)
         for j = 1 : dimension_scale(2)
             x = ceil(i * proportion(1));
             y = ceil(j * proportion(2));
             dimension_scale_img(i, j, c) = img(x, y, c);
         end
     end
end
czas = toc
% wyświetlanie wyskalowanego obrazu
figure(2)
imshow(uint8(dimension_scale_img));