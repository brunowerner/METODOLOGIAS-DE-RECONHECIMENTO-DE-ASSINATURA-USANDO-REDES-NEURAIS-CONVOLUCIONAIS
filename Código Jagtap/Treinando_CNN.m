load('TrainingSet.mat');
load('signnet_Jagtap.mat');

% Configurações do treinamento.
options = trainingOptions('sgdm',...
    'MiniBatchSize', 32, ...
    'InitialLearnRate', 0.0001, ...
    'Shuffle', 'every-epoch', ...
    'MaxEpochs', 30, ...
    'Plots', 'training-progress', ...
    'OutputFcn',@(info)stopIfAccuracyNotImproving(info,208));

Modelo_treinado = trainNetwork(trainingSet, layers, options);
save('Modelo_Treinado.mat', 'Modelo_treinado');


% Função de parada caso a acurácia se estabilize em 100% durante 1 época.
function stop = stopIfAccuracyNotImproving(info,N)

stop = false;

persistent bestValAccuracy
persistent valLag

if info.State == "start"
    bestValAccuracy = 0;
    valLag = 0;
    
elseif ~isempty(info.TrainingAccuracy)
    
    if info.TrainingAccuracy > bestValAccuracy
        valLag = 0;
        bestValAccuracy = info.TrainingAccuracy;
    elseif info.TrainingAccuracy < bestValAccuracy
        valLag = 0;
    else
        valLag = valLag + 1;
    end
    
    
    if valLag >= N
        stop = true;
    end
end

end