package org.example
//def user = [
//        id   : 101,
//        name : "Christian",
//        role : "QA"
//]
//
//user.email = "test@example.com"
//user.age = 26
//println user

def scanner = new Scanner(System.in)
def scores = [
        A:1, B:3, C:3, D:2,
        E:1, F:4, G:2, H:4,
        I:1, J:8, K:5, L:1,
        M:3, N:1, O:1, P:3,
        Q:10, R:1, S:1, T:1,
        U:1, V:4, W:4, X:8,
        Y:4, Z:10
]
print "Enter A Word:"
def word = System.console()?.readLine()?: new Scanner(System.in).nextLine()

static def ScrabbleScore (word, scores){
    word
        .toUpperCase()
        .toCharArray()
        .collect{ scores[it.toString()] ?:0}
        .sum()

}
println "${word.toUpperCase()} = ${ScrabbleScore (word, scores)} points"

print "Press Enter to continue..."
scanner.nextLine()



