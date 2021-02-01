/* @author Will Sartin */
public class Ouroboros {
  static int COUNTER=11;
  /**
  * Requirements:
  *  - Write in a single class file.
  *  - Each output program should write the source code of the next program to be executing  to stdout.
  *  - Must include comments in the output source code.
  *  - Must include author tag.
  *  - Should output a single character to stderr.
  *  - Use the provided runner to output your first and last name followed by a new line to a file.
  **/
  public static void main(String[] args) {
    char quoationMark = 34;
    char newLineOrAuthorName = 13;
    if(COUNTER < 23) {
      newLineOrAuthorName = FORMATTING.charAt(COUNTER);
    } else {
      COUNTER = 10;
    }

    System.err.append(newLineOrAuthorName);
    System.out.println(String.format(FORMATTING, String.valueOf(++COUNTER), quoationMark, FORMATTING, quoationMark));
  }

  static final String FORMATTING = "/* @author Will Sartin */ public class Ouroboros { static int COUNTER=%s; /** * Requirements: *  - Write in a single class file. *  - Each output program should write the source code of the next program to be executing  to stdout. *  - Must include comments in the output source code.  *  - Must include author tag. *  - Should output a single character to stderr.  *  - Use the provided runner to output your first and last name followed by a new line to a file. */ public static void main(String[] args) { char quoationMark = 34; char newLineOrAuthorName = 13; if(COUNTER < 23) { newLineOrAuthorName = FORMATTING.charAt(COUNTER); } else { COUNTER = 10; } System.err.append(newLineOrAuthorName); System.out.println(String.format(FORMATTING, String.valueOf(++COUNTER), quoationMark, FORMATTING, quoationMark)); } static final String FORMATTING = %s%s%s;} ";
}
