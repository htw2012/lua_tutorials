
Config = {hello="Hello Lua",world="World"} --table�Ĺ�����
Config.words = "Hello"
Config.num = 100
Config["name"] = "ZhangSan"

--print(Config["words"])
--print(Config.name)
--print(Config.hello)

for key, var in pairs(Config) do
  print(key,var)
end
print("ɾ��ֵhello")
Config.hello = nil;
print("ֵ�Ĵ�С��"..table.maxn(Config));
for key, var in pairs(Config) do
  print(key,var)
end