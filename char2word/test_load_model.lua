require('torch')
require('model_tools')
require('nn')
require('rnn')
require('get_rand_batch')
require('cal_error')
require('optim')

char_emds = read_words("data/input.train")
char_tensor = convert2tensors(char_emds)--类型的自动转换
word_emds = read_words("data/target.train")
word_tensor = convert2tensors(word_emds)--类型的自动转换

filename = "results/model10"
rnn = torch.load(filename)
allOutputs = rnn:forward(char_tensor)

local err = getError(allOutputs, word_tensor)
print("生成模型和词向量的误差值",err)
