function fact(n)
  if n==0 then
    return 1
  else
    return fact(n-1)*n
  end
end
print("enter a number:")
a = io.read("*number") --¶ÁÈ¡Ò»¸ö×Ö
print(fact(a))
