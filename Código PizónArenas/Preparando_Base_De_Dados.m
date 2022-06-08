imds = imageDatastore('C:\Users\Telma\Desktop\TCC\Bases de Dados\UTSig\UTSig',... % Caminho da base de dados
    'IncludeSubfolders', true, 'LabelSource', 'foldernames');

imds.ReadFcn = @(filename)readAndPreprocessImage(filename); % Chama a função de pré-processamento.

[trainingSet, testSet] = splitEachLabel(imds, 0.8, 'randomize'); % Divide a base de dados em 80% para treinamento e 20% para teste e randomiza.

save('TrainingSet.mat', 'trainingSet');
save('TestSet.mat', 'testSet');

function Iout = readAndPreprocessImage(filename) % Realiza o pré-processamento.

I = imread(filename);

threshold = graythresh(I); % Encontra um limiar na imagem.
I = backgroundIsBlank(I, threshold); % Limpa as sujeiras das imagens e tranforma o fundo em branco.

[rows, columns, numberOfColorChannels] = size(I);

if (numberOfColorChannels == 3) % Verifica se a imagem é colorida RGB.
    I = rgb2gray(I); % Transforma em escala de cinza.
end

I = imadjust(I, [0.5059 1], [0 1], 1); % Ajuste no contraste da imagem.
Iout = imresize(I, [258 305]); % Redimensiona a imagem para 30% do tamanho original.

end

% Realiza a limpeza de ruídos e transforma o fundo em branco usando um
% limiar.
function Iout = backgroundIsBlank(I, threshold)
intensity = threshold*255;
    for r = 1:size(I, 1)
        for c = 1:size(I, 2)
            if(I(r,c) > intensity)
                I(r,c) = 255;
            end
        end   
    end
    Iout = I;
end

