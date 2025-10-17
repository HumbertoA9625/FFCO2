
clear all

%Agregar y cargar path del mesh 

mesh_path = fullfile(mrstPath('ls-proj'), 'C:\Users\huaba0661\OneDrive - University of Bergen\Desktop\mrst-2024b\FluidFlower\mrstExample\mesh');
data = load(fullfile(mesh_path, 'simpleExtrudedG_cellSize3cm_depth1km.mat'));

%Well position

well=data.wellNo;

% Mostrar algunos valores antes del cambio

fprintf('Valores originales:\n');
fprintf('Celda 10: %g\n', well(10));
fprintf('Celda 1995: %g\n', well(1995));

% % Cambiar los valores de dos celdas específicas
% well(10) = 3;   % Asignar pozo 1 a la celda 10
% well(25) = 4;   % Asignar pozo 2 a la celda 25
% 
% % Mostrar los valores después del cambio
% fprintf('Valores modificados:\n');
% fprintf('Celda 10: %g\n', well(10));
% fprintf('Celda 25: %g\n', well(25));
% 
% % guardar el nuevo vector:
% data.wellNo = well;
% save(fullfile(mesh_path, 'modified_simpleExtrudedG.mat'), '-struct', 'data');
% 
% 
% % % Guardar los cambios
% % % save('C:\Users\huaba0661\OneDrive - University of Bergen\Desktop\mrst-2024b\FluidFlower\mrstExample\mesh\modified.mat', 'G');