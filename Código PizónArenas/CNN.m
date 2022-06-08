
% Criando a arquitetura da CNN de Pizón-Arenas.  

% Criando a primeira parte da CNN.

layers1 = imageInputLayer([258 305 1], 'Name', 'Input');

% Criando a segunda parte da CNN

layers2 = [...
convolution2dLayer([16 16], 32, 'Stride', 3, 'Padding', 2, 'Name', 'Conv_1');
reluLayer('Name', 'Relu_1');
batchNormalizationLayer('Name', 'Norm_1');

convolution2dLayer([5 5], 64, 'Stride', 1, 'Padding', 2, 'Name', 'Conv_2');
reluLayer('Name', 'Relu_2');
batchNormalizationLayer('Name', 'Norm_2');

maxPooling2dLayer([2 3], 'Stride', 2, 'Padding', [1 0], 'Name', 'Pool_1');

convolution2dLayer([4 4], 96, 'Stride', 1 , 'Padding', 1, 'Name', 'Conv_3');
reluLayer('Name', 'Relu_3' );
batchNormalizationLayer('Name', 'Norm_3');

convolution2dLayer([4 4], 128, 'Stride', 1, 'Padding', 1, 'Name', 'Conv_4');
reluLayer('Name', 'Relu_4');
batchNormalizationLayer('Name', 'Norm_4');

maxPooling2dLayer([2 2], 'Stride', 2, 'Padding', 0, 'Name', 'Pool_2');

convolution2dLayer([4 4], 256, 'Stride', 1, 'Padding', 0, 'Name', 'Conv_5');
reluLayer('Name', 'Relu_5');
batchNormalizationLayer('Name', 'Norm_5');

maxPooling2dLayer([2 2], 'Stride', 2, 'Padding', 0, 'Name', 'Pool_3');

fullyConnectedLayer(1024, 'Name', 'FC_1');
reluLayer('Name', 'Relu_6');
dropoutLayer('Name', 'Dropout_1');

fullyConnectedLayer(2048, 'Name', 'FC_2');
reluLayer('Name', 'Relu_7');
dropoutLayer('Name', 'Dropout_2');

];

% Criando terceira parte da CNN.

layers3 = [
convolution2dLayer([30 30], 16, 'Stride', 1, 'Padding', 0, 'Name', 'Conv_6')
reluLayer('Name', 'Relu_8')
batchNormalizationLayer('Name', 'Norm_6')

convolution2dLayer([20 20], 16, 'Stride', 1, 'Padding', 0, 'Name', 'Conv_7')
reluLayer('Name', 'Relu_9')
batchNormalizationLayer('Name', 'Norm_7')

maxPooling2dLayer([3 2], 'Stride', 2, 'Padding', 0, 'Name', 'Pool_4')

convolution2dLayer([10 10], 32, 'Stride', 1, 'Padding', 2, 'Name', 'Conv_8')
reluLayer('Name', 'Relu_10')
batchNormalizationLayer('Name', 'Norm_8')

maxPooling2dLayer([2 3], 'Stride', 2, 'Padding', 0, 'Name', 'Pool_5')

convolution2dLayer([9 9], 32, 'Stride', 1, 'Padding', 2, 'Name', 'Conv_9')
reluLayer('Name', 'Relu_11')
batchNormalizationLayer('Name', 'Norm_9')

maxPooling2dLayer([2 2], 'Stride', 2, 'Padding', 0, 'Name', 'Pool_6')

convolution2dLayer([4 4], 64, 'Stride', 1, 'Padding', 2, 'Name', 'Conv_10')
reluLayer('Name', 'Relu_12')
batchNormalizationLayer('Name', 'Norm_10')

maxPooling2dLayer([2 3], 'Stride', 2, 'Padding', 0, 'Name', 'Pool_7')

fullyConnectedLayer(256, 'Name', 'FC_3')
reluLayer('Name', 'Relu_13')
dropoutLayer('Name', 'Dropout_3')

fullyConnectedLayer(2048, 'Name', 'FC_4')
reluLayer('Name', 'Relu_14')
dropoutLayer('Name', 'Dropout_4')
];

% Criando a quarta parte da CNN.

layers4 = [
additionLayer(2, 'Name', 'Addition');
fullyConnectedLayer(230, 'Name', 'FC_5');
softmaxLayer('Name', 'Softmax_1')
classificationLayer('Name', 'Classification_1')

];

% Juntando as partes da CNN.

lgraph = layerGraph(layers1);

lgraph = addLayers(lgraph,layers2);
lgraph = addLayers(lgraph,layers3);
lgraph = addLayers(lgraph,layers4);

% Conectando camadas.

lgraph = connectLayers(lgraph, 'Input', 'Conv_1');
lgraph = connectLayers(lgraph, 'Input', 'Conv_6');
lgraph = connectLayers(lgraph, 'Dropout_2', 'Addition/in1');
lgraph = connectLayers(lgraph, 'Dropout_4', 'Addition/in2');

figure
plot(lgraph)

save('DAG_CNN.mat', 'lgraph')
