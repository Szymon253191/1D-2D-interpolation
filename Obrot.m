clear all; 
clc;
img = imread('Sequoia.bmp'); 

% zczytywanie rozmiaru macierzy - rząd i kolumna
[row, column, z]= size(img); 

% kąt obrotu
angle = -65;

% zamiana na radiany
rads = (2 * pi * angle)/360;  
tic
% wyliczanie wymiarów tła w taki sposób, żeby obrócony obraz
% był do niego idealnie dopasowany, użyłam wartości bezwzględnych 
% w celu uzyskania dodatnich watości w kazdym przypadku
row_backgnd = ceil(row * abs(cos(rads)) + column * abs(sin(rads)));                      
column_backgnd = ceil(row * abs(sin(rads)) + column * abs(cos(rads)));                     

% definije tablicę z wyliczonymi wymiarami i wypenia tablicę zerami
B = uint8(zeros([row_backgnd column_backgnd 3]));

% wyliczna środek orginalnego i finalnego obrazu
x_midd = ceil(row/2);                                                            
y_midd = ceil(column/2);

midd_x = ceil((size(B,1))/2);
midd_y = ceil((size(B,2))/2);

% w pętli obliczane są współrzędne pikseli A dla każdego piksela B,
% a jego intensywaność zostanie przypisana po sprawdzeniu
for i=1:size(B,1)
    for j=1:size(B,2)                                                       

         x = (i - midd_x) * (cos(rads)) + (j - midd_y) * (sin(rads));                                       
         y = -(i - midd_x) * (sin(rads)) + (j - midd_y) * (cos(rads));
         
         x = round(x) + x_midd;
         y = round(y) + y_midd;

         if (x >= 1 && y >= 1 && x <= size(img,1) &&  y <= size(img,2)) 
              B(i,j,:) = img(x,y,:);  
         end
         
    end
end
czas = toc
imshow(B);