--训练字符到词语的
--1.字和词语的词向量获取层
--2.RNN/LSTM隐层模型层
--3.RNN/LSTM模型结果的mean pooling层
--4.损失函数计算层
--5.构建整个训练的过程
require('torch')
require('rnn')
require('model_tools')--完成训练数据的加载
require('train_tools')--训练的工具类

--1.数据获得
samples = read_words('train.sample')

inputs = samples[1];
targets = samples[2];

--2.构建LSTM网络
--设置相关模型参数
batchSize = 8
rho = 10 -- sequence length
hiddenSize = 50
nIndex = 100 -- input words
--nClass = 7 -- output classes
lr = 0.1

-- nn Recurrent
rnn = nn.Sequential()
:add(nn.LookupTable(nIndex, hiddenSize))
:add(nn.SplitTable(1,2))--?
:add(nn.Sequencer(r))
--:add(nn.SelectTable(-1)) -- 保留全部,而不是最后一个
:add(nn.Mean())--添加mean pooling的实现  --3.mean pooling 这个加到那个里面?
--:add(nn.Linear(hiddenSize, nIndex)) 暂时注掉
--:add(nn.LogSoftMax())

-- rnn包完成创建工作
rnn = nn.Sequential()
      :add(nn.Sequencer(nn.Linear(inputSize,hiddenSize)))
      :add(nn.Sequencer(nn.LSTM(inputSize,hiddenSize)))
--      :add(nn.Sequencer(nn.Mean(2,2)))
--4.损失函数的计算层
criterion = nn.MSECriterion ()

--5.训练
trainEpoch(rnn,criterion,inputs,targets)



