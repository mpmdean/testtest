set(0, 'defaultaxesfontsize', 5, 'defaulttextfontsize', 5)
figure(4, 'position', [0 0 1000 400])
colours_sig = viridis(7);

% Plot EPC dispersion

subplot('Position', [0.06 0.15 0.15 0.8])
hold on
plot([0 0.42 0.63 1], [0.195 0.33 0.195 0.195], '.-', 'Color', colours_sig(3, :), 'Linewidth', 1.5, 'MarkerSize', 20)
hold off
ylim([0 0.35])
ylabel('EPC strength (eV)')
xticks([0 0.42 0.63 1])
xticklabels({'\Gamma' 'K' 'M' '\Gamma'})
box on

axes('Position', [0.08 0.25 0.11 0.2])
hold on
patch([0; 1; 0.75], [0; 0; 0.43], [0.195; 0.33; 0.195])
text(-0.05, 0, 0, '\Gamma', "horizontalalignment", "center")
text(1.05, 0, 0, 'K', "horizontalalignment", "center")
text(0.75, 0.48, 0, 'M', "horizontalalignment", "center")
hold off
axis off

% Plot resonance fit

subplot('Position', [0.27 0.15 0.3 0.8])
hold on
data_tmp = importdata('sigma*/291.8eV.txt', ' ');
errorbar(data_tmp(:, 1), data_tmp(:, 2) / max(data_tmp(:, 2)), data_tmp(:, 3) / max(data_tmp(:, 2)), 'k.')
data_tmp = importdata('sigma*/291.8eV_calc.txt', ' ');
plot(data_tmp(:, 1), data_tmp(:, 2) / max(data_tmp(:, 2)), '-', 'Color', colours_sig(3, :), 'LineWidth', 2)
plot([0.12 0.12 0.19 0.19 0.19 0.26 0.26], [1 1.05 1.05 1.1 1.05 1.05 1], 'k-')
text(0.19, 1.14, '1-phonon', "horizontalalignment", "center")
plot([0.26 0.26 0.35 0.35 0.35 0.44 0.44], [0.8 0.85 0.85 0.9 0.85 0.85 0.8], 'k-')
text(0.35, 0.94, '2-phonon', "horizontalalignment", "center")
plot([0.44 0.44 0.52 0.52 0.52 0.6 0.6], [0.6 0.65 0.65 0.7 0.65 0.65 0.6], 'k-')
text(0.52, 0.74, '3-phonon', "horizontalalignment", "center")
plot([0.6 0.6 0.69 0.69 0.69 0.78 0.78], [0.4 0.45 0.45 0.5 0.45 0.45 0.4], 'k-')
text(0.69, 0.54, '4-phonon', "horizontalalignment", "center")
plot([0.78 0.78 0.86 0.86 0.86 0.94 0.94], [0.2 0.25 0.25 0.3 0.25 0.25 0.2], 'k-')
text(0.86, 0.34, '5-phonon', "horizontalalignment", "center")
text(0.82, 1.1, '291.8 eV', "horizontalalignment", "center")
hold off
xlim([0.08 0.96])
ylim([0 1.2])
xticks(0:0.1:0.9)
xlabel('Energy loss (eV)')
ylabel('Normalized intensity')
box on

% Plot energy dependence

subplot('Position', [0.65 0.15 0.05 0.8])
hold on
data_tmp = importdata('sigma*/XAS.txt', ' ');
plot(data_tmp(:, 2), data_tmp(:, 1), 'k-', 'LineWidth', 1)
annotation('arrow', [0.7 0.683], [0.15 0.15], 'Color', colours_sig(1, :), 'LineWidth', 2)
annotation('arrow', [0.7 0.678], [0.31 0.31], 'Color', colours_sig(2, :), 'LineWidth', 2)
annotation('arrow', [0.7 0.665], [0.47 0.47], 'Color', colours_sig(3, :), 'LineWidth', 2)
annotation('arrow', [0.7 0.653], [0.63 0.63], 'Color', colours_sig(4, :), 'LineWidth', 2)
annotation('arrow', [0.7 0.658], [0.79 0.79], 'Color', colours_sig(5, :), 'LineWidth', 2)
hold off
xlim([-0.1 0.33])
ylim([291.2 292.2])
xlabel('XAS')
ylabel('Incident energy (eV)')
xticks([])
box on
set(gca, 'XDir', 'reverse')

subplot('Position', [0.701 0.15 0.25 0.8])
hold on
for i = 1:5
    data_tmp = importdata(['sigma*/' num2str(291 + 0.2 * i, '%.1f') 'eV.txt'], ' ');
    errorbar(data_tmp(:, 1), data_tmp(:, 2) / max(data_tmp(:, 2)) + i, data_tmp(:, 3) / max(data_tmp(:, 2)), 'k.')
    data_tmp = importdata(['sigma*/' num2str(291 + 0.2 * i, '%.1f') 'eV_calc.txt'], ' ');
    plot(data_tmp(:, 1), data_tmp(:, 2) / max(data_tmp(:, 2)) + i, '-', 'Color', colours_sig(i, :), 'Linewidth', 2)
end
hold off
xlim([0.08 0.96])
ylim([1 6])
xlabel('Energy loss (eV)')
ylabel('Normalized intensity', 'Position', [1 3.3], 'Rotation', 270)
yticks([])
box on

print('Fig4.pdf', '-dpdf', '-S1000,400')
