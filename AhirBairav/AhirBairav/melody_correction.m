clc;
clear all;
close all;

% Melody contour correction obtained Melodia
file = '2';
fileName = strcat(file, '.txt');
saveFile = strcat(file, '_correct.mat');
[a, b]= textread(fileName);

b(b<0) = 0;
c = b;
c(c<0) = 0;
timeIndex = 1:length(a);

begSeg = abs(a - 6.855);
begMin = min(begSeg);
begIndex = find(begSeg == begMin);

endSeg = abs(a - 8.967);
endMin = min(endSeg);
endIndex = find(endSeg == endMin);

c(begIndex:endIndex) = 140;

ax1 = subplot(211);
plot(a, b); hold on;
plot(a, c-50, 'r'); hold off;
ax2 = subplot(212);
%plot(a, b); hold on
plot(timeIndex, c, 'r'); %hold off;
%linkaxes([ax1, ax2], 'x');


d = [a c];
save(saveFile, 'd');

% 1.wav 
% c(2910:2952) = c(2910:2952)/2;
% c(1253:1623) = 0;
% c(2155:2643) = 0;




