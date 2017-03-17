--模型的工具类
require 'torch'

--读取训练数据
count =0
function read_words(fn)
--  debug.debug()
  fd = io.lines(fn)
  sentences = {}
  line = fd()
  while line do
    sentence = {}
    curResult = string.split(line, "\t")
----    print("curResult",curResult)
    for _, word in pairs(curResult) do
--        去除最后一个
        sentence[#sentence + 1] = word
    end
--    
--    for i=1,50 do --这里写死了...
--       sentence[#sentence + 1] = curResult[i]
--    end
    sentences[#sentences + 1] = sentence
    line = fd()
    count = count+1
  end
  return sentences
end

num = 0
function convert2tensors(sentences)
  l = {}
  for _, sentence in pairs(sentences) do
    t = torch.zeros(1, #sentence)
    for i = 1, #sentence do 
--    print("curSent",i,sentence[i])
      t[1][i] = sentence[i]
    end
    l[#l + 1] = t
    num = num +1
  end
  return l  
end

--这里实现了
----word_emds = read_words("file.test")
--word_emds = read_words("chars.train")
--print("type",torch.type(word_emds))
--print("#",#word_emds)
--print("count",count)
--print("word_emds[1]",word_emds[1])
--print("word_emds[1][11]",word_emds[1][11])
--print("===================================")
--word_tensor = convert2tensors(word_emds)--类型的自动转换
--print("type",torch.type(word_tensor))
--print("#",#word_tensor)
--print("num",num)
--print("word_tensor",word_tensor[1])
