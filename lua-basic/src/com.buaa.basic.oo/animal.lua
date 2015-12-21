-- animal.lua

require 'class'
-- 基类的构造
Animal = class(function(a,name)
   a.name = name
end)

function Animal:__tostring()
  return self.name..': '..self:speak() --返回基类的名字和说话方式
end

--子类的狗构造
Dog = class(Animal)
function Dog:speak() --子类狗的说话方式
  return 'bark'
end

--子类猫的 构造，含参数的构造
Cat = class(Animal, function(c,name,breed)
         Animal.init(c,name)  -- must init base!
         c.breed = breed --品种
      end)
function Cat:speak()
  return 'meow'
end

Lion = class(Cat)

function Lion:speak()
  return 'roar'
end

fido = Dog('Fido')
felix = Cat('Felix','Tabby')
leo = Lion('Leo','African')


print(leo:is_a(Animal));
print(leo:is_a(Cat));
print(leo:is_a(Dog));
print(leo:is_a(Lion));

print(leo:__tostring());

print(leo.breed)