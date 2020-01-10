% ����ͼƬ
im = imread('1.jpg');

figure;
imshow(im); 

% �����ת����
a = 30 / 180 * pi;
R = [cos(a), -sin(a); sin(a), cos(a)];
R = R'; % �����ת��������������������
 
% ����ԭͼ��С
sz = size(im);
h = sz(1);
w = sz(2);
ch = sz(3);
c1 = [h; w] / 2;
 
% ������ʾ����ͼ����Ҫ�Ļ�����С
hh = floor(w*sin(a)+h*cos(a))+1;
ww = floor(w*cos(a)+h*sin(a))+1;
c2 = [hh; ww] / 2;
 
% ��ʼ��Ŀ�껭��
im2 = uint8(ones(hh, ww, 3)*128);
for k = 1:ch
    for i = 1:hh
       for j = 1:ww
          p = [i; j];
          pp = (R*(p-c2)+c1);
          mn = floor(pp);
          ab = pp - mn;
          a = ab(1);
          b = ab(2);
          m = mn(1);
          n = mn(2);
          % ���Բ�ֵ����
          if (pp(1) >= 2 && pp(1) <= h-1 && pp(2) >= 2 && pp(2) <= w-1)
             im2(i, j, k) = (1-a)*(1-b)*im(m, n, k) + a*(1-b)*im(m+1, n, k)...
                          + (1-a)*b*im(m, n, k)     + a*b*im(m, n, k);
          end
       end
    end
end
 
% ��ʾͼ��
figure;
imshow(im2);