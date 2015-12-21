
Config = {hello="Hello Lua",world="World"} --table的构造器
Config.words = "Hello"
Config.num = 100
Config["name"] = "ZhangSan"

--print(Config["words"])
--print(Config.name)
--print(Config.hello)

for key, var in pairs(Config) do
  print(key,var)
end
print("删除值hello")
Config.hello = nil;
print("值的大小："..table.maxn(Config));
for key, var in pairs(Config) do
  print(key,var)
end