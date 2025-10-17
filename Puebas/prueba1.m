% Prueba 1
clear all

%Agregar modulo
mrstModule add incomp

% Create grid
nx=50; ny=50; nz=10;
G = cartGrid([nx,ny,nz]);

% Make geometry
G = computeGeometry(G)

% Assign properties
rock.perm = [1000 100 10]*milli*darcy.*ones(G.cells.num, 1);
rock.poro = 0.3*ones(G.cells.num, 1);

%Transmisibilidad
hT= computeTrans(G,rock);

%Fluid properties

fluid = initSimpleFluid('mu', [ 1, 10] *centi*poise, ...
                        'rho', [1000, 500] *kilogram/meter^3, ...
                        'n', [2,2]);

%Add wells
W = addWell([], G, rock, 1 : nx*ny : nx*ny*nz,          ...
            'InnerProduct', 'ip_tpf', ...
            'Type', 'rate', 'Val', 1.0/day(), ...
            'Radius', 0.1, 'Comp_i', [1, 0]);
W = addWell(W, G, rock, nx : ny : nx*ny, ...
            'InnerProduct', 'ip_tpf', ...
            'Type', 'bhp' , 'Val', 1.0e5, ...
            'Radius', 0.1, 'Dir', 'y', 'Comp_i', [0, 1]);

%Plot wells
clf
plotGrid(G, 'FaceColor', 'none'); view(3);
[ht, htxt, hs] = plotWell(G, W, 'radius', 0.1, 'height', 2);
set(htxt, 'FontSize', 16);

%SOlucion del yacimiento
rSol = initState(G, W, 0, [0, 1]);

%Solucion de presion
gravity off
rSol = incompTPFA(rSol, G, hT, fluid, 'wells', W);

% Report initial state of reservoir
subplot(2,1,1), cla
   plotCellData(G, convertTo(rSol.pressure(1:G.cells.num), barsa));
   title('Initial pressure'), view(3)
   colorbar 

subplot(2,1,2), cla
   cellNo = rldecode(1:G.cells.num, diff(G.cells.facePos), 2) .';
   plotCellData(G, accumarray(cellNo, ...
      abs(convertTo(faceFlux2cellFlux(G, rSol.flux), meter^3/day))));
   title('Initial flux intensity'), view(3)
   colorbar 