package forcomp

object Anagrams {

  /** A word is simply a `String`. */
  type Word = String

  /** A sentence is a `List` of words. */
  type Sentence = List[Word]

  /**
   * `Occurrences` is a `List` of pairs of characters and positive integers saying
   *  how often the character appears.
   *  This list is sorted alphabetically w.r.t. to the character in each pair.
   *  All characters in the occurrence list are lowercase.
   *
   *  Any list of pairs of lowercase characters and their frequency which is not sorted
   *  is **not** an occurrence list.
   *
   *  Note: If the frequency of some character is zero, then that character should not be
   *  in the list.
   */
  type Occurrences = List[(Char, Int)]

  /**
   * The dictionary is simply a sequence of words.
   *  It is predefined and obtained as a sequence using the utility method `loadDictionary`.
   */
  val dictionary: List[Word] = loadDictionary

  /**
   * Converts the word into its character occurence list.
   *
   *  Note: the uppercase and lowercase version of the character are treated as the
   *  same character, and are represented as a lowercase character in the occurrence list.
   */
  def wordOccurrences(w: Word): Occurrences = {
    val orderedLowerCaseList: List[Char] = w.toLowerCase.sorted.toList
    val characterFrequency: List[Int] =
      for (letter <- orderedLowerCaseList.distinct)
        yield (orderedLowerCaseList filter (l => l == letter)).length
    orderedLowerCaseList.distinct zip characterFrequency
  }

  /** Converts a sentence into its character occurrence list. */
  def sentenceOccurrences(s: Sentence): Occurrences = wordOccurrences(s.mkString)

  /**
   * The `dictionaryByOccurrences` is a `Map` from different occurrences to a sequence of all
   *  the words that have that occurrence count.
   *  This map serves as an easy way to obtain all the anagrams of a word given its occurrence list.
   *
   *  For example, the word "eat" has the following character occurrence list:
   *
   *     `List(('a', 1), ('e', 1), ('t', 1))`
   *
   *  Incidentally, so do the words "ate" and "tea".
   *
   *  This means that the `dictionaryByOccurrences` map will contain an entry:
   *
   *    List(('a', 1), ('e', 1), ('t', 1)) -> Seq("ate", "eat", "tea")
   *
   */
  lazy val dictionaryByOccurrences: Map[Occurrences, List[Word]] = dictionary groupBy (word => wordOccurrences(word))

  /** Returns all the anagrams of a given word. */
  def wordAnagrams(word: Word): List[Word] = dictionaryByOccurrences(wordOccurrences(word))

  /**
   * Returns the list of all subsets of the occurrence list.
   *  This includes the occurrence itself, i.e. `List(('k', 1), ('o', 1))`
   *  is a subset of `List(('k', 1), ('o', 1))`.
   *  It also include the empty subset `List()`.
   *
   *  Example: the subsets of the occurrence list `List(('a', 2), ('b', 2))` are:
   *
   *    List(
   *      List(),
   *      List(('a', 1)),
   *      List(('a', 2)),
   *      List(('b', 1)),
   *      List(('a', 1), ('b', 1)),
   *      List(('a', 2), ('b', 1)),
   *      List(('b', 2)),
   *      List(('a', 1), ('b', 2)),
   *      List(('a', 2), ('b', 2))
   *    )
   *
   *  Note that the order of the occurrence list subsets does not matter -- the subsets
   *  in the example above could have been displayed in some other order.
   */
  def combinations(occurrences: Occurrences): List[Occurrences] = occurrences match {
    case Nil => List(List())
    case o :: oo => generator(listMaker(o), combinations(oo))
  }

  /**
   * ``listMaker'' takes a single ``occurrence'', which is of type (Char, Int), and returns
   * a list of occurrences (i.e. a List[Occurrences] = List[List(Char, Int)] that
   * contains the original occurrence and its descendants with lower frequencies. This
   * includes the freq=0 part which is represented by the empty list.
   */
  def listMaker(occ: (Char, Int)): List[Occurrences] = {
    val newVector = for (index <- 1 to occ._2) yield (occ._1, index)
    (for (index <- 0 until newVector.length) yield newVector(index) :: Nil).toList ::: List(Nil)
    /**
     * This fucker requires some explanation:
     * 1) The first for loop coerces automatically to a Vector
     * 2) the next for loop takes each entry and cons with Nil to make a Vector of Lists
     * 3) the Vector[List] is converted to List[List]
     * 4) finally, the empty list List(List()) is included
     */
  }

  /**
   * ``generator'' takes two lists of Occurrences (i.e. two List[List(Char, Int)]]) and returns
   * a list of Occurrences which generates all ``combinations''. This is the heart of the recursion.
   * It is modeled on the simpler:
   * def generator0(set1: List[List[Char]], set0: List[List[Char]]): List[List[Char]] =
   * for (e1 <- set1; e0 <- set0) yield List(e1, e0).flatten
   */
  def generator(occ1: List[Occurrences], occ0: List[Occurrences]): List[Occurrences] =
    for (o1 <- occ1; o0 <- occ0) yield o1 ::: o0

  /**
   * Subtracts occurrence list `y` from occurrence list `x`.
   *
   *  The precondition is that the occurrence list `y` is a subset of
   *  the occurrence list `x` -- any character appearing in `y` must
   *  appear in `x`, and its frequency in `y` must be smaller or equal
   *  than its frequency in `x`.
   *
   *  Note: the resulting value is an occurrence - meaning it is sorted
   *  and has no zero-entries.
   */
  def subtract(x: Occurrences, y: Occurrences): Occurrences = {
    def subtract0(x0: Occurrences, y0: Occurrences): Occurrences = y0 match {
      case Nil => x0
      case y :: yy =>
        val (xChar, xInt) = x0.unzip
        val (yChar, yInt) = y0.unzip
        val index = xChar.indexOf(yChar.head)
        val xNew: List[(Char, Int)] = xChar.zip(xInt.updated(index, xInt(index) - yInt.head))
        subtract0(xNew, yy)
    }
    subtract0(x, y) flatMap dropZero
  }
  /**
   * ``dropZero'' replaces an instance of (*, 0) with the empty list.
   * ``flatMap'' above then takes care of the rest.
   */
  def dropZero(elem: (Char, Int)): List[(Char, Int)] = elem match {
    case (char, 0) => Nil
    case (char, int) => List((char, int))
  }

  /**
   * Returns a list of all anagram sentences of the given sentence.
   *
   *  An anagram of a sentence is formed by taking the occurrences of all the characters of
   *  all the words in the sentence, and producing all possible combinations of words with those characters,
   *  such that the words have to be from the dictionary.
   *
   *  The number of words in the sentence and its anagrams does not have to correspond.
   *  For example, the sentence `List("I", "love", "you")` is an anagram of the sentence `List("You", "olive")`.
   *
   *  Also, two sentences with the same words but in a different order are considered two different anagrams.
   *  For example, sentences `List("You", "olive")` and `List("olive", "you")` are different anagrams of
   *  `List("I", "love", "you")`.
   *
   *  Here is a full example of a sentence `List("Yes", "man")` and its anagrams for our dictionary:
   *
   *    List(
   *      List(en, as, my),
   *      List(en, my, as),
   *      List(man, yes),
   *      List(men, say),
   *      List(as, en, my),
   *      List(as, my, en),
   *      List(sane, my),
   *      List(Sean, my),
   *      List(my, en, as),
   *      List(my, as, en),
   *      List(my, sane),
   *      List(my, Sean),
   *      List(say, men),
   *      List(yes, man)
   *    )
   *
   *  The different sentences do not have to be output in the order shown above - any order is fine as long as
   *  all the anagrams are there. Every returned word has to exist in the dictionary.
   *
   *  Note: in case that the words of the sentence are in the dictionary, then the sentence is the anagram of itself,
   *  so it has to be returned in this list.
   *
   *  Note: There is only one anagram of an empty sentence.
   */

  /**
   * What to say about this bastard...
   * First we construct a helper sentenceAnagramsHelper which accepts Occurrences instead of Sentences
   * Once constructed, it is called on sentenceOccurrences(sentence).
   * The helper checks that the occurrence is non-empty and proceeds to construct all possible combinations
   * For each combination ``elem'' that is in the occurrences list of a valid word from the dictionary
   * and for each distinct anagram ``wordAnagram'' of that occurrence ``elem'' (the dictionaryByOccurrences is a map
   * so we have to convert it from Option[List[...]] to List whereupon we have a List[List[...]] and we
   * need to take the head) the helper is called with new occurrence ``subtract(occurrences, elem)'' and
   * new accumulator ``accumulator.map(List(wordAnagram):::_))''.
   * The first guarantees that on the next pass, we cannot reuse the words we just pulled out.
   * The second begins the construction of a sentence by including the new word in the accumulator
   * The whole for loop is a List[List[Sentence]] which needs to be flattened.
   * Finally, the helper is called on the original sentence and the trivial list of sentences List(List()).
   */
  def sentenceAnagrams(sentence: Sentence): List[Sentence] = {
    def sentenceAnagramsHelper(occurrences: Occurrences, accumulator: List[Sentence]): List[Sentence] =
      if (occurrences.isEmpty) accumulator
      else {
        (for {
          elem <- combinations(occurrences) filter isWord
          wordAnagram <- (dictionaryByOccurrences get elem).toList.head
        } yield sentenceAnagramsHelper(subtract(occurrences, elem), accumulator.map(List(wordAnagram) ::: _))
          ).flatten
      }
    sentenceAnagramsHelper(sentenceOccurrences(sentence), List(List()))
  }

  /**
   * This function accepts an Occurrences list and checks whether there is an entry in the dictionary which matches it.
   * That is, it checks that there is at least one word with that occurrences list.
   */
  def isWord(occurrences: Occurrences): Boolean = !(dictionaryByOccurrences get occurrences).isEmpty

}