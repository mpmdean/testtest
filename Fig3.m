set(0, 'defaultaxesfontsize', 5, 'defaulttextfontsize', 5)
figure(3, 'position', [0 0 1000 400])
colours_pi = autumn(6);

% Plot EPC dispersion

subplot('Position', [0.06 0.15 0.15 0.8])
hold on
plot([0 0.05 0.05 0.37 0.37 0.37 0.42 0.42 0.63 1 1], [0.23 0.05 0 0 0 0.06 0.32 0 0 0 0.23], '-', 'Color', colours_pi(3, :), 'Linewidth', 1.5)
plot([0 0.05 0.37 0.42 0.63 1], [0.23 0.05 0.06 0.32 0 0.23], '.', 'Color', colours_pi(3, :), 'MarkerSize', 20)
hold off
ylabel('EPC strength (eV)')
xticks([0 0.42 0.63 1])
xticklabels({'\Gamma' 'K' 'M' '\Gamma'})
box on

% Plot resonance fit

subplot('Position', [0.27 0.15 0.3 0.8])
hold on
data_tmp = importdata('pi*/285.6eV.txt', ' ');
errorbar(data_tmp(:, 1), data_tmp(:, 2) / 170, data_tmp(:, 3) / 170, 'k.')
data_tmp = importdata('pi*/285.6eV_calc.txt', ' ');
plot(data_tmp(:, 1), data_tmp(:, 2) / max(data_tmp(:, 2)), '-', 'Color', colours_pi(3, :), 'LineWidth', 2)
plot([0.13 0.13 0.18 0.18 0.18 0.24 0.24], [0.9 0.95 0.95 1 0.95 0.95 0.9], 'k-')
text(0.18, 1.04, '1-phonon', "horizontalalignment", "center")
plot([0.28 0.28 0.36 0.36 0.36 0.44 0.44], [1 1.05 1.05 1.1 1.05 1.05 1], 'k-')
text(0.36, 1.14, '2-phonon', "horizontalalignment", "center")
plot([0.44 0.44 0.57 0.57 0.57 0.64 0.64], [0.9 0.95 0.95 1 0.95 0.95 0.9], 'k-')
text(0.57, 1.04, '3-phonon', "horizontalalignment", "center")
plot([0.6 0.6 0.78 0.78 0.78 0.84 0.84], [0.8 0.85 0.85 0.9 0.85 0.85 0.8], 'k-')
text(0.78, 0.94, '4-phonon', "horizontalalignment", "center")
text(0.75, 1.1, '285.6 eV', "horizontalalignment", "center")
hold off
xlim([0.08 0.88])
ylim([0 1.2])
xticks(0:0.1:0.8)
xlabel('Energy loss (eV)')
ylabel('Normalized intensity')
box on

% Plot energy dependence

subplot('Position', [0.65 0.15 0.05 0.8])
hold on
data_tmp = importdata('pi*/XAS.txt', ' ');
plot(data_tmp(:, 2), data_tmp(:, 1), 'k-', 'LineWidth', 1)
annotation('arrow', [0.7 0.68], [0.15 0.15], 'Color', colours_pi(1, :), 'LineWidth', 2)
annotation('arrow', [0.7 0.666], [0.31 0.31], 'Color', colours_pi(2, :), 'LineWidth', 2)
annotation('arrow', [0.7 0.656], [0.47 0.47], 'Color', colours_pi(3, :), 'LineWidth', 2)
annotation('arrow', [0.7 0.657], [0.63 0.63], 'Color', colours_pi(4, :), 'LineWidth', 2)
annotation('arrow', [0.7 0.678], [0.79 0.79], 'Color', colours_pi(5, :), 'LineWidth', 2)
hold off
xlim([0.9 1.8])
ylim([285.2 286.2])
xlabel('XAS')
ylabel('Incident energy (eV)')
xticks([])
box on
set(gca, 'XDir', 'reverse')

norm_tmp = [140 180 170 210 350];

subplot('Position', [0.701 0.15 0.25 0.8])
hold on
for i = 1:5
    data_tmp = importdata(['pi*/' num2str(285 + 0.2 * i, '%.1f') 'eV.txt'], ' ');
    errorbar(data_tmp(:, 1), data_tmp(:, 2) / norm_tmp(i) + i, data_tmp(:, 3) / norm_tmp(i), 'k.')
    data_tmp = importdata(['pi*/' num2str(285 + 0.2 * i, '%.1f') 'eV_calc.txt'], ' ');
    plot(data_tmp(:, 1), data_tmp(:, 2) / max(data_tmp(:, 2)) + i, '-', 'Color', colours_pi(i, :), 'Linewidth', 2)
end
hold off
xlim([0.08 0.88])
ylim([1 6])
xlabel('Energy loss (eV)')
ylabel('Normalized intensity', 'Position', [0.9 3.3], 'Rotation', 270)
yticks([])
box on

print('Fig3.pdf', '-dpdf', '-S1000,400')
