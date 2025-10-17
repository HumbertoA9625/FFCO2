% Valores estándar para un crudo típico (ajustar según las condiciones específicas)
Tc = 375; % Temperatura crítica en °C
Pc = 600; % Presión crítica en bar

% Punto de Burbuja y Punto de Rocío (valores de ejemplo)
Pb = 20; % Presión de burbuja (Punto de burbuja) en bar
Pr = 150; % Presión de rocío (Punto de rocío) en bar

% Temperaturas de saturación
Tmin = 40; % Temperatura mínima de la fase líquida en °C
Tmax = Tc; % Temperatura máxima (crítica)

% Rango de temperaturas para calcular el envelope
T = linspace(Tmin, Tmax, 100); % Temperaturas de 40°C a la Tc

% Cálculo de la presión de saturación en las condiciones de burbuja y rocío
% Relación empírica simplificada para ilustración
P_bubble = Pb * (Tc - T) / (Tc - Tmin); % Aproximación para el punto de burbuja
P_dew = Pr * (Tc - T) / (Tc - Tmin); % Aproximación para el punto de rocío

% Extender los valores de la presión para completar la curva cerrada
T_full = [T, flip(T)]; % Doble la temperatura para completar el ciclo (liquido + vapor)
P_full = [P_bubble, flip(P_dew)]; % De igual forma para las presiones

% Graficar el Phase Envelope cerrado
figure;
hold on;
plot(T_full, P_full, 'b-', 'LineWidth', 2, 'DisplayName', 'Phase Envelope');
xlabel('Temperatura (°C)');
ylabel('Presión (bar)');
title('Phase Envelope de un Crudo');
legend('show');
grid on;

% Agregar líneas de presión crítica
plot([Tc, Tc], [0, Pc], 'k--', 'DisplayName', 'Presión Crítica');
plot([Tmin, Tmax], [Pc, Pc], 'k--', 'DisplayName', 'Presión Crítica');
text(Tc + 2, Pc, 'Presión Crítica', 'Color', 'k');

% Mostrar la región de fase líquida y vapor
fill([T_full, Tc], [P_full, Pc], 'c', 'FaceAlpha', 0.1, 'DisplayName', 'Fase Líquida');
fill([T_full, Tc], [P_full, 0], 'g', 'FaceAlpha', 0.1, 'DisplayName', 'Fase Vapor');

% Agregar etiquetas a las fases
text(100, 300, 'Fase Líquida', 'Color', 'c');
text(200, 50, 'Fase Vapor', 'Color', 'g');

