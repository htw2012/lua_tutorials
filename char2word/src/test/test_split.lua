--function string.split(str, delimiter)
--  if str==nil or str=='' or delimiter==nil then
--    return nil
--  end
--  
--    local result = {}
--    for match in (str..delimiter):gmatch("(.-)"..delimiter) do
--    print(result,match)
--        table.insert(result, match)
--    end
--    return result
--end

result = string.split("5 45 1 2 3 4"," ")
print("==================================")
print(result)
print("==================================")
print("type:",torch.type(result))  --type为table
for key, var in pairs(result) do
	print(key,var)
end
x = torch.randn(4)
print("type:",torch.type(x))  --type为torch.DoubleTensor

ds = {}
ds.size = 1000
ds.input = torch.LongTensor(ds.size,rho)
ds.target = torch.LongTensor(ds.size):random(nClass)
