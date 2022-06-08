load('Modelo_Treinado.mat');
load('TrainingSet.mat');

% Obtendo ativações da camada FC_2.

featureLayer = 'FC_2';

trainingFeatures = activations( Modelo_treinado, trainingSet, featureLayer, ...
                    'MiniBatchSize', 32, 'OutputAs', 'columns');
                
trainingLabels = trainingSet.Labels;

save('TrFeatures.mat', 'trainingFeatures');
save('TrLabels.mat', 'trainingLabels');