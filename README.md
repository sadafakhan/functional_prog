## Description

A sampling of OCaml functions implemented during a Discrete Math / Functional Programming course. 

### `anagramCounter`

`anagramCounter` takes a list of characters and computes how many possible anagrams (not bound by dictionary restrictions) can be created from that list. It comprises the following subfunctions: 

* `myLength`: calculates the length of a given list. 
* `myFactorial`: calculates the factorial of a given integer. 
* `factorialize`: calculates the product of multiple different factorials, with each factorial defined by an element in a given list.
* `removeElem`: removes all occurrences of a given element from a given list. 
* `eachFinder`: calculates the number of times a given element occurs in a given list.
* `deElementize`: takes a list of elements and calculates the number of times each unique element in the list occurs and outputs this in the form of another list.

### `listSplitter`

`listSplitter` consists of four primary functions, all of which use recursion: 

* `mySplit`: takes a list of pairs as input and splits them into two different lists. 
* `myTwoEnds`:  takes one list and returns the head of the list and the last item of the list in option form.
* `myRLEEncoder`: takes a list and compresses it into RLE form, i.e. a list of tuples where each tuple matches the format (#number of occurrences of a given element, element).
* `myRLEDecoder`: takes a list in RLE (i.e. a list of tuples) as input and decompresses it  into a list where each element is repeated an amount of times specified in its tuple. 

