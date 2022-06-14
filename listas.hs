{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Move guards forward" #-}
{-# HLINT ignore "Use camelCase" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Redundant ==" #-}
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# HLINT ignore "Use null" #-}

contavizinhosiguais :: [Char] -> Int
contavizinhosiguais [] = 0
contavizinhosiguais (x:xs) | length (x:xs) == 1 = 0
                           | x == head xs = 1 + contavizinhosiguais xs
                           | otherwise = contavizinhosiguais xs

somalista :: [Int] -> Int
somalista [] = 0
somalista (x:xs) = x + somalista xs

impares :: [Int]
impares = [1,3..100]

pares :: [Int]
pares = [10,12..100]

imparesn :: Int -> [Int]
imparesn 0 = []
imparesn n = [x | x <- [1,3..n]]

multi3e5 :: Int -> [Int]
multi3e5 n = [x | x <- [1..n],mod x 3 == 0,mod x 5 ==0]

tq :: Int -> [(Int,Int)]
tq n = [(x,x*x) | x <-[1..n]]

indices :: [(Int,Int)]
indices = [(x,y) | x <- [1..3],y <-[1..4]]

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
listafib :: Int -> [Int]
listafib 0 = []
listafib n = [fib x | x <- [1..n]]

fatores :: Int -> [Int]
fatores n = [x | x <- [1..(div n 2)], mod n x == 0]

auxnumperfeito :: Int -> [Int]
auxnumperfeito num = [ x | x <- [1 .. num-1], ((mod num x) == 0) ]
eh_perfeito :: Int -> Bool
eh_perfeito n | (sum (auxnumperfeito n)) == n = True
              | otherwise = False
listanumperfeito :: Int -> [Int]
listanumperfeito n = [x | x <- [1..n],eh_perfeito x == True]

concatena :: [[Int]] -> [Int]
concatena l = [y | x <- l,y <- x]

type Funcionario = (String, Float)

-- Base de dados
folha :: [Funcionario]
folha = [("Ana", 772.25), ("Jose", 2375.0), ("Caui", 1778.5)]

--Função auxiliar que descompacta um funcionario e retorna somente seu salario
salario :: Funcionario -> Float
salario (_, sal) = sal

-- =================================
-- 1 quanto gasta mensalmente em salarios?
--Usando somente os conceitos de lista (feito em sala)
gastoMensal :: [Funcionario] -> Float
gastoMensal (x:xs)
    |xs == [] = salario x
    |otherwise =  salario (x) + gastoMensal (xs) 

acimasalario :: Float -> [Funcionario]
acimasalario n = [(x,y) | (x,y) <- folha, y > n]

diff :: Float -> [Funcionario]
diff n = [(x, abs(y-n)) |(x,y) <- folha]
aproxsalario :: Float -> Float
aproxsalario n = minimum [y |(_,y) <- diff n]

maissalario :: [Funcionario] -> Float
maissalario (x:xs) | xs == [] = 0
                   | salario x > 1100 && salario x < 2203 = (salario x)*0.09 + maissalario xs
                   | salario x > 2203 && salario x < 3505 = (salario x)*0.12 + maissalario xs
                   | salario x > 3505 && salario x < 6433 = (salario x)*0.14 + maissalario xs
                   | salario x > 6433 = (salario x)*0.22 + maissalario xs
                   | otherwise = maissalario xs