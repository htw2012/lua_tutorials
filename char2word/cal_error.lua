--误差计算实用类
function getError(outputs,targets) 
  local error = 0;
  for key, var in pairs(outputs) do
--  	print("key",key)
--  	print("output",var)
--    print("target",targets[key])
    local sub = torch.add(var,-targets[key])
--    print("sub",sub)
    local pow = torch.pow(sub,2)
--    print("pow",pow)
    local sum = torch.sum(pow);
--    print("sum",sum)
    error = error+sum
  end
  return error
end


function getError2(outputs,targets) 
--   local size = #trainSet
--     local size = table.maxn(trainSet)
--  print("element-1",outputs[1])
 print("type-outputs",torch.type(outputs))
  print("type-targets",torch.type(targets))
--  print("output",outputs)
      local size = #(outputs)
   print("dataSize",size)
   local error = 0
   for i=1,size do
       local sum = 0
       local lenJ = (#(outputs[i]))[2]
       print("lenJ",lenJ)
       for j=1,lenJ do
            print("outputs[i][j]",outputs[i][j])
            print("targets[i][j]",targets[i][j])
           sum = sum +(outputs[i][j]-targets[i][j])*(outputs[i][j]-targets[i][j])
       end
      error = error +sum
   end
   return error
end

