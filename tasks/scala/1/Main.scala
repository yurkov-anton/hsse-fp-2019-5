// package recfun
//import common._
import scala.collection.immutable._  

object Main {
  def main(args: Array[String]) {
    // println("Pascal's Triangle")
    // for (row <- 0 to 10) {
    //   for (col <- 0 to row)
    //     print(pascal(col, row) + " ")
    //   println()
    // }
    //println(balance(List('(', ')', '(', 'x', ')')))
    //println(countChange(5, List(3,2)))
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int = {
    if (c == 0 || r == 0) 1
    else pascal(c - 1, r - 1) + pascal(c - 1, r)
  }

  /**
   * Exercise 2 Parentheses Balancing
   */
  def balance(chars: List[Char]): Boolean = {
    def r(acc: Int, chars: List[Char]): Int = chars match {
      case '('::xs   => r(acc+1, xs)
      case ')'::xs   => r(acc-1, xs)
      case x::xs     => r(acc, xs)
      case List('(') => acc+1
      case List(')') => acc-1
      case List()    => acc
    }
    return r(0, chars) == 0
  }

  /**
   * Exercise 3 Counting Change
   * Write a recursive function that counts how many different ways you can make
   * change for an amount, given a list of coin denominations. For example,
   * there is 1 way to give change for 5 if you have coins with denomiation
   * 2 and 3: 2+3.
   */
  def countChange(money: Int, coins: List[Int]): Int = {
    def r(last: Int, current: Int): Int = {
      current match {
        case 0 => 1
        case x if x < 0 => 0
        case _ => coins.filter(_ >= last).fold(0){(acc, i) => acc + r(i, current-i)}
      }
    }
    return r(-1, money)
  }
}
