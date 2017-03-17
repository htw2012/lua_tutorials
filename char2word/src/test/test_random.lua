require('torch')
require('model_tools')
require('nn')
require('rnn')

--1.读入数据
char_emds = read_words("chars.train")
char_tensor = convert2tensors(char_emds)--类型的自动转换

--indices=torch.LongTensor(10)
--for k = 1, 2 do
--  -- 1. 随机选择一批数据
--  local inputs = torch.DoubleTensor()
--  local rnds = torch.randperm(100)
--  --print(rnds)
--  for i=1,10 do
--  	indices[i] = rnds[i]
--  	print(i,indices[i])
--  end
--  
--  inputs = {}
--  for i=1,10 do
--    print(i,indices[i])
--    inputs[#inputs + 1] = char_tensor[indices[i]]
--  end
--  print("inputs",inputs)
--  print("input[8]",inputs[8])
--  print("input[4]",inputs[4])
--end

function genOneBatchData(trainSet,batchSize)
  local indices=torch.LongTensor(batchSize)
  local inputs = torch.DoubleTensor()
  local size = table.getn(trainSet) --trainSet:size() --获得数据的个数
  print("size",size)
  local rnds = torch.randperm(size)
  --print(rnds)
  for i=1,batchSize do
    indices[i] = rnds[i]
--    print(i,indices[i])
  end
  
  inputs = {}
  for i=1,batchSize do
    print(i,indices[i])
    inputs[#inputs + 1] = trainSet[indices[i]]
  end
--  print("inputs",inputs)
--  print("input[8]",inputs[8])
--  print("input[4]",inputs[4])
  return inputs
end

local inputs = genOneBatchData(char_tensor,10)
print("inputs",inputs)

