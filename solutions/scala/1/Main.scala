object Main {
  def main(args: Array[String]) {
    task1(10)

    println()
    val line = "()(()()()"
    println("Balancing "+ line)
    task2(line)

    println()
    println("Counting Change ")
    task3()
  }

  def task1( col: Int) {
    println("Pascal's Triangle")
    for (row <- 0 to col) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
  }



  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || c == r) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def iterate(chars: List[Char], bal: Int): Boolean = {
      if (chars.isEmpty) bal == 0
      else if (bal < 0) false
      else chars.head match {
        case '(' => iterate(chars.tail, bal + 1)
        case ')' => iterate(chars.tail, bal - 1)
        case _ => iterate(chars.tail, bal)
      }
    }

    iterate(chars, 0)
  }


  def task2(line: String) {
    print(balance(line.toCharArray.toList))
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def count(m: Int, c: List[Int]) : Int = {
      if (c.isEmpty) 0
      else if (m - c.head == 0) 1
      else if (m - c.head < 0) 0
      else countChange(m - c.head, c) + countChange(m, c.tail)
    }
    count(money, coins.sorted)
  }

  def task3(): Unit ={
    val l = List(2,3)
    print(countChange(5, l))
  }
}
