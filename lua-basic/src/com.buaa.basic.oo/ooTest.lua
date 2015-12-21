--使用table实现面向对象
function clone(tab)
  local ins = {}
  for key, var in pairs(tab) do
    ins[key] = var
  end
  return ins
end

function copy(dist,tab)
  for key, var in pairs(tab) do
    dist[key] = var
  end
end

People ={}

--function People.sayHi()
--  print("People say hi")
--end

People.sayHi = function (self)
  print("People say hi:"..self.name)
end

People.doThing = function (self)
  print("People doThing:"..self.name)
end

People.new = function (name)
  local self = clone(People)
  self.name = name
  
  return self
end

--local p = clone(People)
--p.sayHi()

local p = People.new("ZhangSan")
--p.sayHi(p)
--p:sayHi()


--- people的子类
Man = {}
Man.new = function (name)
  local self = People.new(name)
  copy(self,Man)
  return self
end

Man.sayHello = function ()
  print("Man say hello")
end

Man.sayHi = function (self)
  print("Man sayHi "..self.name)
end

local m = Man.new("Lisi")
m:sayHi() --使用冒号代表直接传入这个实例
--m:doThing();
m.doThing(m);
