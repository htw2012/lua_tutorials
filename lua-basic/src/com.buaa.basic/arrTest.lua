--arr = {1,2,3,4,"Hello"}
--
--for key, var in pairs(arr) do
--  print(key,var)
--end

arr = {}

for var=1, 10 do
  table.insert(arr,1,var) --在第一个位置中插入
end

for key, var in pairs(arr) do
  print(key,var)
end
print(table.maxn(arr)) --输出数组长度

table.insert(arr,7,100) --其他后面元素向后移动，而不是覆盖

for key, var in ipairs(arr) do
  print(key,var)	
end
print(table.maxn(arr)) --输出数组长度

