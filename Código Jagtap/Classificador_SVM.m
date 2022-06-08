load('TrFeatures.mat')
load('TrLabels.mat')

% Treinando classificador SVM com ativações da camada FC_2.

classifier = fitcecoc(trainingFeatures, trainingLabels, ...
        'Learners', 'Linear', 'Coding', 'onevsall', 'ObservationsIn', 'columns');
    save('Classificador_SVM.mat', 'classifier');