rootFolder = 'C:\Users\Telma\Desktop\TCC\Bases de Dados\UTSig'; % Caminho para realizar as operações. 

imds = imageDatastore(fullfile(rootFolder),...
'IncludeSubfolders',true,'LabelSource','foldernames');

imds.ReadFcn = @(filename)readAndPreprocessImage(filename); % Aplica o pré-processamento no ImageDataStore.

% Prepara a Base de Treinamento e Base de Teste.
[trainingSet, testSet] = splitEachLabel(imds, 0.8, 'randomize'); % Randomiza os arquivos da imds para o training set e test set.

save('TrainingSet', 'trainingSet');
save('TestSet', 'testSet');

function Iout = readAndPreprocessImage(filename) % Realiza o pré-processamento.

    I = imread(filename);

    [rows, columns, numberOfColorChannels] = size(I);

    if (numberOfColorChannels == 3) % Verifica se a imagem é colorida RGB.
        I = rgb2gray(I); % Caso a imagem for colorida transforma em escala de cinza.
    end

    level = graythresh(I); % Calcula um limiar para a imagem.
    I = imbinarize(I,level); % Usa o limiar para binarizar a imagem.
    I = bwmorph(I, 'thin'); % Afinamento morfológico.
    Iout = imresize(I, [227 227]); % Redimenciona a imagem para 227x227 para a entrada na CNN.
    
end