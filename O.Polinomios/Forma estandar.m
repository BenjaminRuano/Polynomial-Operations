clc; clear; close all;
%forma estandar

% Función para normalizar polinomios (rellenar con ceros si es necesario)
function p_normalizado = normalizar(p, len)
    % Asegura que el polinomio tenga la longitud correcta
    p_normalizado = [p, zeros(1, len - length(p))];
end

% Función para sumar polinomios
function resultado = sumar_polinomios(p, q)
    % Verificar si los polinomios tienen la misma longitud
    len_p = length(p);
    len_q = length(q);
    
    if len_p ~= len_q
        % Normalizar los polinomios si no tienen la misma longitud
        max_len = max(len_p, len_q);
        p = normalizar(p, max_len);
        q = normalizar(q, max_len);
    end
    
    % Sumar los polinomios
    resultado = p + q;
end

% Función para multiplicar polinomios
function resultado = multiplicar_polinomios(p, q)
    % Usar la función conv para multiplicar los polinomios
    resultado = conv(p, q);
end

% Función para dividir polinomios
function [cociente, residuo] = dividir_polinomios(p, q)
    % Usar la función deconv para dividir los polinomios
    [cociente, residuo] = deconv(p, q);
end

% Función para evaluar el polinomio de forma estándar (forma Horner)
function valor = evaluar_polinomio_estandar(p, x)
    % Normalizar el polinomio
    p = normalizar(p, length(p));
    
    % Evaluar el polinomio usando la forma estándar (Horner)
    valor = 0;
    for i = 1:length(p)
        valor = valor * x + p(i);
    end
end

% Probar las operaciones con los polinomios dados
p = [1, -6, 11, -6];  % p(x) = x^3 - 6x^2 + 11x - 6
q = [1, -1];          % q(x) = x - 1

% Suma de polinomios
resultado_suma = sumar_polinomios(p, q);
disp('Resultado de la suma de los polinomios:');
disp(resultado_suma);

% Multiplicación de polinomios
resultado_multiplicacion = multiplicar_polinomios(p, q);
disp('Resultado de la multiplicación de los polinomios:');
disp(resultado_multiplicacion);

% División de polinomios
[cociente, residuo] = dividir_polinomios(p, q);
disp('Resultado de la división de los polinomios (cociente y residuo):');
disp('Cociente:');
disp(cociente);
disp('Residuo:');
disp(residuo);

% Evaluación de p(x) en x = 2 usando la forma estándar
valor_estandar = evaluar_polinomio_estandar(p, 2);
disp(['Evaluación de p(x) en x=2 (forma estándar): ', num2str(valor_estandar)]);