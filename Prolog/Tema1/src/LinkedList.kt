class LinkedList {
    var head: Node? = null

    fun insert(data: Int) {
        val node = Node(data)
        node.next = head
        head = node
    }

    private fun search(head: Node?, data: Int): Boolean {
        if (head == null) {
            return false
        }
        return if (head.data == data) {
            true
        } else {
            search(head.next, data)
        }
    }

    fun checkIfListIsASet(node: Node?): Boolean {
        if (node == null) {
            return true
        } else {
            if (search(node.next, node.data)) {
                return false
            }
            return checkIfListIsASet(node.next)
        }
    }

    fun searchAndChange(node: Node?, counter: Int, i: Int, value: Int) {
        if (node==null){
            println("Out of range!")
            return
        }

        if (counter == i) {
            node.data = value
            return
        }

        return searchAndChange(node.next, counter + 1, i, value)
    }

    fun print(node: Node?){
        if (node==null){
            return
        }
        println(node.data)
        print(node.next)
    }
}