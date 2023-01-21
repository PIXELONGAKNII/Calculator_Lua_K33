--By PIXELON K33

local functions = {
  ["+"] = function(a, b) return a + b end,
  ["-"] = function(a, b) return a - b end,
  ["*"] = function(a, b) return a * b end,
  ["/"] = function(a, b) return a / b end,
  ["^"] = function(a, b) return a ^ b end
}

local function eval(str)
  local stack = {}
  for token in string.gmatch(str, "[%d%.]+|[%+%-%*/%^]") do
    if functions[token] then
      local b, a = table.remove(stack), table.remove(stack)
      table.insert(stack, functions[token](a, b))
    else
      table.insert(stack, tonumber(token))
    end
  end
  return stack[1]
end

print("Calculadora em Lua")
print("Digite 'sair' para cancelar")

while true do
  print("Insira uma expressão matemática:")
  expressao = io.read()
  
  if expressao == "sair" then
    break
  end

  valor = eval(expressao)
  print("Resultado: " .. valor)
end
