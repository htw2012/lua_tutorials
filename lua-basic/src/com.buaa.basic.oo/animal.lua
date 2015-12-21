-- animal.lua

require 'class'
-- ����Ĺ���
Animal = class(function(a,name)
   a.name = name
end)

function Animal:__tostring()
  return self.name..': '..self:speak() --���ػ�������ֺ�˵����ʽ
end

--����Ĺ�����
Dog = class(Animal)
function Dog:speak() --���๷��˵����ʽ
  return 'bark'
end

--����è�� ���죬�������Ĺ���
Cat = class(Animal, function(c,name,breed)
         Animal.init(c,name)  -- must init base!
         c.breed = breed --Ʒ��
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