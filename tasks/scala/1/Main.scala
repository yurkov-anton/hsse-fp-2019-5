import scala.collection.immutable._ 

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
    println(balance(List('(')))
    println(balance(List('(', ')')))
    println(countChange(10, List(5,2,1)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || r == c) 1
    else pascal(c - 1, r - 1) + pascal(c, r - 1)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    val counts = 0
    def loop(acc: Int, temp: List[Char]): Boolean = {
      if (acc < 0) false
      else if (temp.isEmpty && acc == 0) true
      else if (temp.isEmpty && acc > 0) false
      else if (temp.head == '(') loop(acc + 1, temp.tail)
      else if (temp.head == ')') loop(acc - 1, temp.tail)
      else loop(acc, temp.tail)
    }
    loop(counts,chars)
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    if (coins.isEmpty || money < 0) 0
    else if (coins.tail.isEmpty && (money % coins.head == 0)) 1
    else countChange(money, coins.tail) + countChange(money - coins.head, coins)
  }
  
//Output:
/*
Pascal's Triangle
1 
1 1 
1 2 1 
1 3 3 1 
1 4 6 4 1 
1 5 10 10 5 1 
1 6 15 20 15 6 1 
1 7 21 35 35 21 7 1 
1 8 28 56 70 56 28 8 1 
1 9 36 84 126 126 84 36 9 1 
1 10 45 120 210 252 210 120 45 10 1 
false
true
10
*/
}
