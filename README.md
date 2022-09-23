# Functional Paradigm with Scheme
## Dobble con Scheme
                  
Functional Paradigm                         
Programming Language: Scheme                              
Developer: Bastián Escribano - @vastien                      
University of Santiago of Chile                        
Computer Science Department                
April, 2022.                  
                
## Introduction
In computer science, functional programming is a programming paradigm where programs are constructed by applying and composing functions. It is a declarative programming paradigm in which function definitions are trees of expressions that map values to other values, rather than a sequence of imperative statements which update the running state of the program.        
                        
In functional programming, functions are treated as first-class citizens, meaning that they can be bound to names (including local identifiers), passed as arguments, and returned from other functions, just as any other data type can. This allows programs to be written in a declarative and composable style, where small functions are combined in a modular manner.                                                                
                                                    
Functional programming is sometimes treated as synonymous with purely functional programming, a subset of functional programming which treats all functions as deterministic mathematical functions, or pure functions. When a pure function is called with some given arguments, it will always return the same result, and cannot be affected by any mutable state or other side effects. This is in contrast with impure procedures, common in imperative programming, which can have side effects (such as modifying the program's state or taking input from a user). Proponents of purely functional programming claim that by restricting side effects, programs can have fewer bugs, be easier to debug and test, and be more suited to formal verification.
                                                                                                        

## Scheme
Scheme is a dialect of the Lisp family of programming languages. Scheme was created during the 1970s at the MIT AI Lab and released by its developers, Guy L. Steele and Gerald Jay Sussman, via a series of memos now known as the Lambda Papers. It was the first dialect of Lisp to choose lexical scope and the first to require implementations to perform tail-call optimization, giving stronger support for functional programming and associated techniques such as recursive algorithms. It was also one of the first programming languages to support first-class continuations. It had a significant influence on the effort that led to the development of Common Lisp.                                                    
                                                    
The Scheme language is standardized in the official IEEE standard and a de facto standard called the Revisedn Report on the Algorithmic Language Scheme (RnRS). A widely implemented standard is R5RS (1998). The most recently ratified standard of Scheme is "R7RS-small" (2013). The more expansive and modular R6RS was ratified in 2007. Both trace their descent from R5RS; the timeline below reflects the chronological order of ratification.                                                    
                                                                                                        
## Dobble - Spot It!
Dobble is a game in which players have to find symbols in common between two cards. It was the UK’s best-selling game in 2018 and 2019.
In 1976, inspired by Kirkman's schoolgirl problem, French mathematics enthusiast Jacques Cottereau devised a game consisting of a set of 31 cards each with six images of insects, with exactly one image shared between each pair of them. In 2008, journalist and game designer Denis Blanchot found a few of the cards from the "game of insects" and developed the idea to create Dobble.                                                    
                                                    
Dobble was released in France in 2009, and in the UK and North America in 2011 under Blue Orange Games. In 2015, the French board game company Asmodee acquired the rights to Dobble and Spot It!.
                                                    
The special way that symbols are arranged on Dobble cards can be understood using geometry. If we represent each card by a line, and each symbol by a point where two lines intersect, then the properties of Dobble are that:
                                                                                                        
any two lines intersect at exactly one point, and
any two points are joined by exactly one line.
This geometric structure is an example of a finite projective plane.

If there are 3 points in each line this creates a structure known as the Fano plane. This represents a simpler version of Dobble with 3 symbols on each card, 7 cards and 7 symbols.

In general, a finite projective plane with n points on each line has n2-n+1 points and lines.

To represent the real game of Dobble, each line must join 8 points. This results in a structure with 57 lines and 57 points (82-8+1=57), corresponding to 57 cards and 57 symbols. However, the game works fine with fewer cards too, and Dobble is marketed with 55 cards in the deck (but 57 different symbols). A junior version of Dobble is marketed with 6 symbols per card, 30 cards, and 31 different symbols (62-6+1=31).

<p align="center">
<img width="400" src="https://i.postimg.cc/qvbwfjTm/Fplane.png" alt="Fano plane">
</p>


## Install

### Requirements
* [Dr.Racket 6.11 o superior](https://download.racket-lang.org/)         
* [Git](https://git-scm.com/downloads)

  ### Use

        Clone https://github.com/vastien/scheme-dobble-simulator/
        
        Windows
        
                $ cd Desktop
                $ mkdir functionalParadigm
                $ cd functionalParadigm
                $ git clone https://github.com/vastien/scheme-dobble-simulator/
                
        Unix (Linux and MacOS) 
        
                $ mkdir functionalParadigm
                $ cd functionalParadigm
                $ git clone https://github.com/vastien/scheme-dobble-simulator/

        Open the .rkt file with Dr.Racke. Then execute.
        
## License
[MIT](https://choosealicense.com/licenses/mit/)
