% Deflacion polinomial
clc; clear; close all;
function [coef_deflacionado] = deflacion_polinomial(coeficientes, raiz)
    % coeficientes: vector con los coeficientes del polinomio original
    % raiz: valor de la raíz por la que se divide el polinomio (en este caso x - 4)
    
    % Obtener el grado del polinomio
    n = length(coeficientes);  % El grado del polinomio es el número de coeficientes
    
    % Inicializar el arreglo para el polinomio deflacionado
    coef_deflacionado = zeros(1, n - 1);  % El grado se reduce en 1
    
    % Realizar la división sintética utilizando un ciclo while
    resto = coeficientes(1);  % El primer coeficiente es el mismo
    
    for i = 2:n
        % Dividir sintéticamente
        coef_deflacionado(i - 1) = resto;
        resto = coef_deflacionado(i - 1) * raiz + coeficientes(i);  % Actualizar el resto
    end
    
    % El coeficiente final de la división es el término constante
    coef_deflacionado(end) = resto;
    
    % Imprimir el polinomio deflacionado para comprobar el resultado
    fprintf('Polinomio deflacionado: ');
    for i = 1:length(coef_deflacionado)
        if i == 1
            fprintf('%dx^%d ', coef_deflacionado(i), length(coef_deflacionado)-i);
        else
            fprintf('+ %dx^%d ', coef_deflacionado(i), length(coef_deflacionado)-i);
        end
    end
    fprintf('\n');
end
% Definir los coeficientes del polinomio x^2 + 2x - 24
coeficientes = [1, 2, -24];  % coeficientes del polinomio
raiz = 4;  % Raíz (x - 4)

% Llamar a la función de deflación polinomial
coef_deflacionado = deflacion_polinomial(coeficientes, raiz);

% Mostrar el resultado deflacionado
disp('El polinomio deflacionado es:');
disp(coef_deflacionado);