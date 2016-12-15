close all;
clear all; %#ok<CLSCR>
clc;

%% Start here

load('Stress.mat');
hold on;

scatter(ones(size(y(7:12,1),1),1), y(7:12,1),'b');
scatter(2*ones(size(y(7:12,1),1),1), y(7:12,2),'b');
scatter(3*ones(size(y(7:12,1),1),1), y(7:12,3),'b');

means = mean(y(7:12,:));
plot([0.8 1.2], [means(1) means(1)],'k');
plot([1.8 2.2], [means(2) means(2)],'k');
plot([2.8 3.2], [means(3) means(3)],'k');
plot([0 4], [mean(means) mean(means)],'--k');

xlim([0 4]);
ylim([0 100]);
ylabel('Adrenalingehalt');
set(gca, 'XTick', [1 2 3], 'XTickLabel', {'S-Bahn', 'Bus', 'Fahrrad'});

saveas(gcf,'stress','epsc2')

anova2(y(7:12,:),3);
anova1(y(7:12,:));
hold off;