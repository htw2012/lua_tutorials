--͸����һ�ִ������һ�ַ�ʽ��������class
require 'class' --�ǵõ���
Account = class(function(acc,balance)
              acc.balance = balance
           end)

function Account:withdraw(amount)
   self.balance = self.balance - amount
end

-- can create an Account using call notation!
acc = Account(1000)
acc:withdraw(100)
print(acc.balance)