set(0, 'defaultaxesfontsize', 8, 'defaulttextfontsize', 8)
figure(1, 'position', [0 0 600 400])

% Import pi* XAS
data_tmp = importdata('pi*/XAS.txt', ' ');
E_XAS_pi = data_tmp(:, 1);
XAS_pi = data_tmp(:, 2);

% Plot pi* XAS
subplot('Position', [0.15 0.8 0.4 0.15])
plot(E_XAS_pi, XAS_pi, 'k-', 'LineWidth', 1)
line([285.7 285.7], [0.5 1.8], 'Color', 'k', 'LineWidth', 1, 'LineStyle', '--')
text(285.7, 0.2, '\pi^*', "horizontalalignment", "center")
xlim([284.2 287])
ylim([0 1.8])
ylabel('XAS')
xticks([])
yticks([])
box on

% Import pi* RIXS spectra
for i = 1:15
    data_tmp = importdata(['pi*/' num2str(284 + 0.2 * i, '%.1f') 'eV.txt'], ' ');
    E_pi(:, i) = data_tmp(:, 1);
    I_pi(:, i) = data_tmp(:, 2);
end

% Plot pi* RIXS map
subplot('Position', [0.15 0.15 0.4 0.65])
pcolor(repelem(284.2:0.2:287, length(E_pi(:, 1)), 1), E_pi, I_pi)
shading interp
xlim([284.2 287])
ylim([-0.1 1.5])
caxis([0 1000])
xlabel('Incident energy (eV)', 'Position', [287.1 -0.2])
ylabel('Energy loss (eV)')
box on

% Import sigma* XAS
data_tmp = importdata('sigma*/XAS.txt', ' ');
E_XAS_sig = data_tmp(:, 1);
XAS_sig = data_tmp(:, 2);

% Plot sigma* XAS
subplot('Position', [0.56 0.8 0.4 0.15])
plot(E_XAS_sig, XAS_sig, 'k-', 'LineWidth', 1)
line([291.8 291.8], [0.1 0.35], 'Color', 'k', 'LineWidth', 1, 'LineStyle', '--')
text(291.8, 0.05, '\sigma^*', "horizontalalignment", "center")
xlim([290.2 294.2])
ylim([0 0.35])
xticks([])
yticks([])
box on

% Import sigma* RIXS spectra
for i = 1:21
    data_tmp = importdata(['sigma*/' num2str(290 + 0.2 * i, '%.1f') 'eV.txt'], ' ');
    E_sig(:, i) = data_tmp(:, 1);
    I_sig(:, i) = data_tmp(:, 2);
end

% Plot sigma* RIXS map
subplot('Position', [0.56 0.15 0.4 0.65])
pcolor(repelem(290.2:0.2:294.2, length(E_sig(:, 1)), 1), E_sig, I_sig)
shading interp
xlim([290.2 294.2])
ylim([-0.1 1.5])
caxis([0 5000])
yticks([])
box on

print('Fig1.pdf', '-dpdf', '-S600,400')
