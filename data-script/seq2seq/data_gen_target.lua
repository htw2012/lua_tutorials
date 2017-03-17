require 'mobdebug'.start()
require 'table_utils'
require 'data_tools'

local folder = "dir/"
local vocabulary_fn = folder..'vocabulary_cn'
local inv_vocabulary_fn = folder..'inv_vocabulary_cn'
local filtered_sentences_fn = folder..'dec_out_seq_cn'
local filtered_sentences_indexes_fn = folder..'dec_out_seq_indexes_cn'
local src_filename = folder..'target.txt'-- 原始文章
local should_reverse = false

local fd = io.lines(src_filename)
local words_count = {}
local words = {}
local vocab_size = 1500

local size = 0
local line = fd()
while line do
  line = replaceDelimiter(line)
  local sentence = {}
  for _, word in pairs(split_cn(line, " ")) do
    if not word2omit(word) then
      sentence[#sentence + 1] = word
    end
  end
  for _, word in pairs(sentence) do
    if words_count[word] then
      words_count[word] = words_count[word] + 1
    else
      words_count[word] = 1
      words[#words + 1] = word
    end
  end
  size = size+1
  line = fd()
end

print("size",size)
--按照词频进行统计
local function compare(a, b)    
    if words_count[a] > words_count[b] then    
        return true    
    end
end
table.sort(words, compare)


local vocabulary = {}
local inv_vocabulary = {}

for i = 1, vocab_size do 
  vocabulary[i] = words[i]
  inv_vocabulary[words[i]] = i
end

vocabulary[#vocabulary + 1] = 'UNK'
inv_vocabulary['UNK'] = #vocabulary
vocabulary[#vocabulary + 1] = 'EOS'
inv_vocabulary['EOS'] = #vocabulary

--词汇表的保存
table.save(vocabulary, vocabulary_fn)
table.save(inv_vocabulary, inv_vocabulary_fn)

--to check x is in l or not
local function in_array(x, l)
  for i = 1, #l do
    if l[i] == x then
      return true
    end
  end
end
  

--原始文件的写入
local src_fd = io.open(filtered_sentences_fn, 'w')
--索引文件的写入
local idx_fd = io.open(filtered_sentences_indexes_fn, 'w')

--长度统计的记录
local filtered_sentence_lengths = torch.zeros(size)

local fd = io.lines(src_filename)
local line = fd()
local i = 0
while line do
  line = replaceDelimiter(line)
  local sentence = {}
  for _, word in pairs(split_cn(line, " ")) do
    if not word2omit(word) then
      sentence[#sentence + 1] = word
    end
  end
  
  i=i+1  
--  print("doing",i)
  local filtered_sentence = {} --原始数据进行追加
  for k = 1, #sentence do
    local word = sentence[k]
    if in_array(word, vocabulary) then
      filtered_sentence[#filtered_sentence + 1] = word
    else
      filtered_sentence[#filtered_sentence + 1] = 'UNK'
    end
  end
  --数据是否翻转
  if should_reverse then 
    filtered_sentence = table.reverse(filtered_sentence)
  end
  filtered_sentence[#filtered_sentence + 1] = 'EOS'
  --原始句子
  src_fd:write(table.concat(filtered_sentence, ' ') .. '\n')
  --记录长度
  filtered_sentence_lengths[i] = #(filtered_sentence)

  --索引文件行
  local sentence = {}
  for _, word in pairs(filtered_sentence) do  
    sentence[#sentence + 1] = inv_vocabulary[word]
  end
  idx_fd:write(table.concat(sentence, ' ') .. '\n')
  line = fd()
end

print("done word size",i)
print(torch.mean(filtered_sentence_lengths), torch.std(filtered_sentence_lengths), torch.min(filtered_sentence_lengths), torch.max(filtered_sentence_lengths))




