
/*
*Enunt: (b) Inlocuiți al i-lea element al unei liste cu o valoare v.
*
*Modelare matematica:
*
* functia searchAndChange(l1..ln,counter,i, value):
*
* [] , l=[],
* val U l2 ...ln daca(counter=i)
* l1 reunit searchAndChange(l2..ln,counter+1,i,value) altfel,
*
* functia print(l1..ln):
* return, l=[]
* altfel,println(l1), print(l2..ln)
*/

fun main(){

    val linkedList = LinkedList()

    println("Cate elemente doriti sa introduceti in lista?")
    val numberOfElements = Integer.valueOf(readLine())

    println("Introduceti elementele:")
    if (numberOfElements != 0) {
        for (i in 0 until numberOfElements) {
            val element = Integer.valueOf(readLine())
            linkedList.insert(element)
        }

        println("Inainte de apelarea functiei aceasta este lista")
        linkedList.print(linkedList.head)

        println("Introduceti pozitia elementului ce il doriti schimbat:")
        val i=Integer.valueOf(readLine())

        println("Inroduceti noua valoare:")
        val value=Integer.valueOf(readLine())

        linkedList.searchAndChange(linkedList.head,1,i,value)
        println("Dupa apelarea functiei, aceasta este lista")

        linkedList.print(linkedList.head)

        return
    }
    println("Lista goala!")
}