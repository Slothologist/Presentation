%% Eingabedaten müssen schon in Array namens data vorhanden sein! 
%  Je nach Eingabe muss hier die Länge von Data sowie die VariableNames
%  geändert werden.

data = importfile('data.txt');

t = table(data(:,1),data(:,2),data(:,3),data(:,4),data(:,5),data(:,6),data(:,7),... % Table aus Array erstellen
'VariableNames',{'VP','V1','V2','V3','V4','V5','V6'});

%% Lege Faktoren und ihre Faktorstufen in Bezug auf die Eingabe fest
%  Hier: Zweifaktoriell
factors = table({'S';'S';'V';'V';'A';'A'},{'1';'2';'1';'2';'1';'2'},...
    'VariableNames',{'Wortart','Wiederholung'}); 

%% Fitte ein Model mit den eben bestimmten Faktoren und ihren Faktorstufen, welche den Vx entsprechen, welche Normalverteilt sind.

rm = fitrm(t,'V1-V6~1','WithinDesign',factors);  % ~1: sind normalverteilt

%% Berechne Varianzanalyse für die Faktoren Wortart und Wiederholung sowie ihre Interaktion
ranovatbl = ranova(rm,'WithinModel','Wortart * Wiederholung')