--训练的工具类
require('nn')
require('torch')
function trainEpoch(module,criterion,inputs,targets)
--获得样本的大小个数
sampleSize = inputs:size(1)
for i=1,sampleSize do
  local idx = math.random(1,sampleSize)
  local input = inputs[idx]
  local target = targets:narrow(1,idx,1)--类似于substring
  
  --前向的步骤
  local lstm_output = module:forward(input)--想办法得到每个lstm的输出??????
  --求均值
  local mean = nn.Sequential():add(nn.Mean(2,2))---这个没谱
  local output = mean:forward(lstm_output)
  --求损失
  local loss = criterion:forward(output,target);
  
  --后向步骤
  local gradOutput = criterion:backward(output,target)
  local gradMean = mean:backward(gradOutput,lstm_output) 
  module:zeroGradParameters()
  local gradInput = module:backward(input,gradMean)
  
  --参数更新
  module:updateParameters(0.05) 
  mean:updateParameters(0.05) 
end

end