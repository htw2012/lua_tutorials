require('rnn')
require('nn')
require('torch')

inputSize = 50
hiddenSize = 50
outputSize = 50

rnn = nn.Sequential():
add(nn.Sequencer(nn.Linear(inputSize,hiddenSize))):
add(nn.Sequencer(nn.LSTM(hiddenSize,hiddenSize))):
add(nn.Sequencer(nn.Linear(hiddenSize,outputSize)))--不再加入logSoftmax了

--model = nn.Sequencer(rnn)
input = {torch.randn(50,50),torch.randn(50),torch.randn(50)}
rnn:forward(input[1])
