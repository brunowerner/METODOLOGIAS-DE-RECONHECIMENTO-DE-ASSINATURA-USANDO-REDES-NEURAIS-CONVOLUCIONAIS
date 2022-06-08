load('TestSet.mat');
load('Classificador_SVM.mat');
load('Modelo_Treinado.mat');

% Inicializando variáveis.

totalImagens = numel(testSet.Files);
TA = 0;
FR = 0;
FA = 0;
TR = 0;

% Teste do modelo em uma base de dados mista, tanto assinaturas vedadeiras quanto assinaturas forjadas.

for i = 1:totalImagens

    testImage = readimage(testSet, i);
    testLabel = double(string(testSet.Labels(i)));
    
    featureLayer = 'FC_2';
    
    imageFeatures = activations(Modelo_treinado, testImage, featureLayer, 'OutputAs', 'columns');
    label = double(string(predict(classifier, imageFeatures, 'ObservationsIn', 'columns')));
    
    if(testLabel <= 115)
    
        if(testLabel == label)
            TA = TA + 1;
        else
            FR = FR + 1;
        end
        
    elseif(label <= 115)
        FA = FA + 1;
    else
        TR = TR + 1;
    end
    
end

disp("TA: " + TA);
disp("FR: " + FR);
disp("FA: " + FA);
disp("TR: " + TR);

% Cálculo das métricas de acurácia.

T = numel(testSet.Files);
FRR = FR/(FR+TA);
FAR = FA/(TR+FA);
ERR = (FR+FA)/T;
Accuracy = (TA+TR)/T;

disp("FRR " + FRR);
disp("FAR " + FAR);
disp("ERR " + ERR);
disp("Accuracy: " + Accuracy);
