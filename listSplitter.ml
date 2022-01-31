(* 
Function mySplit takes a list of pairs as input and splits them into two different lists.
It utilizes two recursive helper functions: heads and tails. 

Function heads takes a list of pairs and pulls out the first item of a pair and creates a list of first items

Function tails takes a list of pairs and pulls out the second item of a pair and creates a list of second items

sType signature is:  ('a * 'b) list -> 'a list * 'b list 
*)

let rec mySplit l = 
    let rec heads l = 
        match l with
            |[] -> []
            |(x,y)::t -> x:: heads t
        in
    let rec tails l = 
        match l with 
            |[] -> []
            |(x,y)::t -> y :: tails t
        in
    match (heads l, tails l) with
        |([],[]) -> ([],[])
        |(h::t, f::b)-> (heads l, tails l);;

(* 
Function myTwoEnds takes one list and returns the head of the list and the last item of the list in option form.
It utilizes one recursive helper function getTail. Function getTail pulls out the last item of a list.
Type signature is: 'a list -> ('a * 'a) option
 *)

let myTwoEnds l = 
    let rec getTail l = 
    match l with 
        |[] -> None
        |[h] -> Some h 
        |h::t -> getTail t in 
    match (l, getTail l) with 
        |([],_)  -> None
        |([h],_) -> Some (h,h)
        |(h::t, Some n) -> Some (h, n) ;;

(*
Function myRLEEncoder takes a list and compresses it into RLE form, 
i.e. a list of tuples where each tuple matches the format (#number of occurrences of a given element, element).
It utilizes two recursive helper functions: counter and cutOff.
Function counter takes a list and outputs the number of times the first element is repeated consecutively.
Function cutOff removes the portion of a list that has identical elements repeated consecutively. 
Type signature is 'a list -> (int * 'a) list
*)

let rec myRLEEncoder l = 
    let rec counter l = 
        match l with 
            |[] -> 0
            |[h] -> 1
            |h::n::t -> if h = n then 1 + counter (n::t) else 1
        in 
    let rec cutOff l = 
        match l with 
            |[] -> []
            |[h] -> []
            |h::n::t -> if h = n then cutOff (n::t) else (n::t)
        in
    match l with 
        |[] -> []
        |h::t -> ((counter l), h) :: myRLEEncoder (cutOff l);;

(*
Function my RLEDecoder takes a list in RLE (i.e. a list of tuples) as input and decompresses it 
into a list where each element is repeated an amount of times specified in its tuple. 
It utilizes two recursive helper functions: multiply and myAppend. 
Function multiply takes an element m and an integer m and creates a list with m repeated n times. 
Function myAppend takes two lists and appends them together.
Type signature is (int * 'a) list -> 'a list
 *)

let rec myRLEDecoder l = 
    let rec multiply m n = 
        if n = 0 then [] else (m :: (multiply m (n-1)))
        in
    let rec myAppend l a =
        match l with 
            |[] -> a
            |h:: t -> h::(myAppend t a)
        in
    match l with
        |[] -> []
        |(x,y)::t -> myAppend (multiply y x) (myRLEDecoder t);;

