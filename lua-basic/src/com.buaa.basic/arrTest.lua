--arr = {1,2,3,4,"Hello"}
--
--for key, var in pairs(arr) do
--  print(key,var)
--end

arr = {}

for var=1, 10 do
  table.insert(arr,1,var) --�ڵ�һ��λ���в���
end

for key, var in pairs(arr) do
  print(key,var)
end
print(table.maxn(arr)) --������鳤��

table.insert(arr,7,100) --��������Ԫ������ƶ��������Ǹ���

for key, var in ipairs(arr) do
  print(key,var)	
end
print(table.maxn(arr)) --������鳤��

