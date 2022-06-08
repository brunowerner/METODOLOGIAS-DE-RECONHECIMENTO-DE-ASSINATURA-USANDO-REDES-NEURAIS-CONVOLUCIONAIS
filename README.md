# METODOLOGIAS-DE-RECONHECIMENTO-DE-ASSINATURA-USANDO-REDES-NEURAIS-CONVOLUCIONAIS

Códigos referentes ao artigo METODOLOGIAS DE RECONHECIMENTO DE ASSINATURA USANDO REDES NEURAIS CONVOLUCIONAIS.

Instruções dos Programas Desenvolvidos

Este guia apresentara um passo a passo para a execução dos programas dos métodos de Pizón-Arenas et al. e Jagtap et al..

Ambiente Necessário

Para a implementação dos métodos é necessário o software MATLAB (Matrix Laboratory - Laboratório de Matriz) com a biblioteca Deep Learning Toolbox.

Método de Pizón-Arenas

Altere o caminho configurado no arquivo Preparando_Base_De_Dados.m, como a seguir:

imds = imageDatastore('Seu Caminho da Base de dados',... % Caminho da base de dados
    'IncludeSubfolders', true, 'LabelSource', 'foldernames');
    
Para ser gerado os resultados do programa para uma determinada base de dados é necessário seguir a seguinte ordem de execução de arquivos:

CNN.m → Preparando_Base_De_Dados.m → Treinando_Modelo.m → Testando_Modelo.m 

Pronto! No console podem ser vistos os resultados para as métricas de acurácia.

Método de Jagtap

Altere o caminho configurado no arquivo Preparando_Base_De_Dados.m, como a seguir:

rootFolder = 'Seu Caminho da Base de dados'; % Caminho para realizar as operações. 
    
Para ser gerado os resultados do programa para uma determinada base de dados é necessário seguir a seguinte ordem de execução de arquivos:

CNN.m → Preparando_Base_De_Dados.m → Treinando_CNN.m → Feature_Learning.m → Classificador_SVM.m → Teste_Modelo.m

Pronto! No console podem ser vistos os resultados para as métricas de acurácia.

Faça bom proveito do código!

Atenciosamente, Bruno Emanoel Werner.
