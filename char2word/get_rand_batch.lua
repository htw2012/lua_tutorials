--随机获得批量数据
require('torch')
require('model_tools')
require('rnn')


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

--genBatchData(char_tensor,word_tensor,opt.batchSize)
function genBatchData(trainSet,testSet,batchSize)
  local indices=torch.LongTensor(batchSize)
  local size = table.getn(trainSet) --trainSet:size() --获得数据的个数
  print("size",size)
  local rnds = torch.randperm(size)
  --print(rnds)
  local inputs = {}
  local targets = {}
  for i=1,batchSize do
--    print(i,rnds[i])
    inputs[#inputs + 1] = trainSet[rnds[i]]
    targets[#targets + 1] = testSet[rnds[i]]
--    inputs[#inputs + 1] = trainSet[indices[i]]
--    targets[#targets + 1] = testSet[indices[i]]
--    print("train_size",#trainSet[indices[i]][1]) -- #trainSet[indices[i]][1]这个是第二维的长度
--     print("train_size[1]",trainSet[indices[i]][1][51])
--     print("trainSet",trainSet[indices[i]][1])
  end
  return inputs,targets
end


--char_emds = read_words("chars.train")
--char_tensor = convert2tensors(char_emds)--类型的自动转换
--local inputs = genOneBatchData(char_tensor,20)
--print("inputs",inputs)


--char_emds = read_words("chars.train")
--char_tensor = convert2tensors(char_emds)--类型的自动转换
--word_emds = read_words("words.train")
--word_tensor = convert2tensors(word_emds)--类型的自动转换
--
--local inputs,targets = genBatchData(char_tensor,word_tensor,10)
--print("inputs",inputs)
--print("targets",targets)