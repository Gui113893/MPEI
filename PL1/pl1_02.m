experiencias = rand(3, 10000)

lancamentos = experiencias > 0.5

resultados = sum(lancamentos)

sucessos = resultados == 2

probSimulacao = sum(sucessos)/10000



N = 1e5
p = 0.5
k = 2
n = 3
lancamentos = rand(n, N) > p
sucessos = sum(lancamentos) == k
probSimulacao = sum(sucessos) / N
