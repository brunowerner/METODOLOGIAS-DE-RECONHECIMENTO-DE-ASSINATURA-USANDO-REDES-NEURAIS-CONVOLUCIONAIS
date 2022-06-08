    % Criação das camadas da rede neural convolucional do método de Jagtap.
    
    layers = [
	imageInputLayer([227 227 1], 'Name', 'Input')

	convolution2dLayer([11 11], 96, 'Stride', 4, 'Padding', 0, 'Name', 'Conv_1')  
	reluLayer('Name', 'Relu_1')
	batchNormalizationLayer('Name', 'Norm_1')
	maxPooling2dLayer([3 3], 'Stride', 2, 'Padding', 0, 'Name', 'Pool_1')

	convolution2dLayer([5 5], 256, 'Stride', 1, 'Padding', 2, 'Name', 'Conv_2')
	reluLayer('Name', 'Relu_2')
	batchNormalizationLayer('Name', 'Norm_2')
	maxPooling2dLayer([3 3], 'Stride', 2, 'Padding', 0, 'Name', 'Pool_2')

	convolution2dLayer([3 3], 384, 'Stride', 1, 'Padding', 1, 'Name', 'Conv_3')
	reluLayer('Name', 'Relu_3')
	
	convolution2dLayer([3 3], 384, 'Stride', 1, 'Padding', 1, 'Name', 'Conv_4')
	reluLayer('Name', 'Relu_4')

	convolution2dLayer([3 3], 256, 'Stride', 1, 'Padding', 1, 'Name', 'Conv_5')
	reluLayer('Name', 'Relu_5')
	maxPooling2dLayer([3 3], 'Stride', 2, 'Padding', 0, 'Name', 'Pool_3')

	fullyConnectedLayer(4096,'Name', 'FC_1')
	reluLayer('Name', 'Relu_6')
    
    fullyConnectedLayer(4096,'Name', 'FC_2')
	reluLayer('Name', 'Relu_7')
    
	fullyConnectedLayer(230, 'Name', 'FC_3')
    
    softmaxLayer('Name', 'Soft_1')
    classificationLayer('Name', 'Output')
    ];
    save('signnet_Jagtap.mat', 'layers')