/*
* Enunt: Verificați dacă o listă este un set.
*
* Modelare matematica (cele doua functii sunt in in clasa LinkedList):
*
* functia search(l1...ln, val):
*   false l=[]
*   true  , l1=val
*   search(l2...ln,val)altfel
*
* functia checkIfListIsASet(l1...ln):
*  true l=[],
*false search(l2..ln) ==true
*checkIfListIsASet(l2..ln) altfel
*
* */

fun main() {
    val linkedList = LinkedList()

    println("Cate elemente doriti sa introduceti in lista?")
    val numberOfElements = Integer.valueOf(readLine())

    println("Introduceti elementele:")
    if (numberOfElements != 0) {

        for (i in 0 until numberOfElements) {
            val element = Integer.valueOf(readLine())
            linkedList.insert(element)
        }

        if (linkedList.checkIfListIsASet(linkedList.head)) {
            println("Lista data este un set")
        } else {
            println("Lista data nu este set")
        }

        return
    }
    println("Lista goala!")
}