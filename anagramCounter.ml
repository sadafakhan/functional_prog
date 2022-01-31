
(* 
Function anagramCount takes a list of characters and computes how many possible anagrams can be created from that list.
It utilizes the helper functions myLength, myFactorial, factorialize, removeElem, eachFinder, and deElementize.

myLength calculates the length of a given list. 

myFactorial calculates the factorial of a given integer. 

factorialize calculates the product of multiple different factorials, with each factorial defined by an element in a given list.

removeElem removes all occurrences of a given element from a given list. 

eachFinder calculates the number of times a given element occurs in a given list.

deElementize takes a list of elements and calculates the number of times each unique element in the list occurs and outputs this in the form of another list.
*)

let anagramCount l = 
let rec myLength l = 
    match l with
        |[] -> 0
        |h::t -> 1 + myLength t
in
let rec myFactorial n = 
    if n <= 1 then 1 else n * myFactorial (n - 1)
in
let rec factorialize l = 
    match l with 
        |[] -> 0
        |[h] -> myFactorial h
        |h::t -> myFactorial h * factorialize t
in
(* let rec findElem p l = 
    match l with 
        |[] -> false
        |h::t -> if h = p then true else findElem p t
in *)
let rec removeElem p l = 
    match l with 
        |[] -> []
        |h::t -> if h = p then removeElem p t else h :: removeElem p t
in
(*let rec myDeduplicate l = 
    match l with 
            |[] -> []
            |[h] -> [h]
            |h::t -> if findElem h t then h :: myDeduplicate (removeElem h t) else h :: myDeduplicate 
in *)
let rec eachFinder l e = 
    match l with
        |[] -> 0 
        |h::t -> if h = e then 1 + eachFinder t e else eachFinder t e 
in
let rec deElementize l = 
    match l with 
        |[] -> []
        |[h] -> [1]
        |h::t -> eachFinder l h :: deElementize (removeElem h t)
in
    match l with 
        |[] -> 0 
        |h::t -> myFactorial(myLength l) / factorialize(deElementize l)
;;