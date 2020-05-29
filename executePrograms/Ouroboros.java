/* @author Will Sartin */ 
public class Ouroboros {  
	/** Requirements: 
	 *  - Write in a single class file. 
	 *  - Each output program should write the source code of the next program to be executing  to stdout. 
	 *  - Must include comments in the output source code.  
	 *  - Must include author tag. 
	 *  - Should output a single character to stderr.  
	 *  - Use the provided runner to output your first and last name followed by a new line to a file. 
	 */ 
	public static void main(String[] args) {
		System.out.println(String.format(FORMATTING, intro, comments, main, quoationMark, FORMATTING, quoationMark, quoationMark, intro, quoationMark, quoationMark, comments, quoationMark, quoationMark, main, quoationMark));
	} 
	
	static final String FORMATTING = "%s %s %s static final String FORMATTING = %s%s%s; static char quoationMark = 34; static String intro = %s%s%s; static String comments = %s%s%s; static String main = %s%s%s;"; 
	static char quoationMark = 34; 
	static String intro = "/* @author Will Sartin */ public class Ouroboros { "; 
	static String comments = "/** * Requirements: *  - Write in a single class file. *  - Each output program should write the source code of the next program to be executing  to stdout. *  - Must include comments in the output source code.  *  - Must include author tag. *  - Should output a single character to stderr.  *  - Use the provided runner to output your first and last name followed by a new line to a file. */"; 
	static String main = "public static void main(String[] args) {System.out.println(String.format(FORMATTING, intro, comments, main, quoationMark, FORMATTING, quoationMark, quoationMark, intro, quoationMark, quoationMark, comments, quoationMark, quoationMark, main, quoationMark));}";
}