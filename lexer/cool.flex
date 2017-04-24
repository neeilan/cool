/*
 *  The scanner definition for COOL.
 */

/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.  Don't remove anything that was here initially
 */
%{
#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>

/* The compiler assumes these identifiers. */
#define yylval cool_yylval
#define yylex  cool_yylex

/* Max size of string constants */
#define MAX_STR_CONST 1025
#define YY_NO_UNPUT   /* keep g++ happy */

extern FILE *fin; /* we read from this file */

/* define YY_INPUT so we read from the FILE fin:
 * This change makes it possible to use this scanner in
 * the Cool compiler.
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
	if ( (result = fread( (char*)buf, sizeof(char), max_size, fin)) < 0) \
		YY_FATAL_ERROR( "read() in flex scanner failed");

char string_buf[MAX_STR_CONST]; /* to assemble string constants */
char *string_buf_ptr;

extern int curr_lineno;
extern int verbose_flag;

extern YYSTYPE cool_yylval;

/*
 *  Add Your own definitions here
 */

%}

/*
 * Define names for regular expressions here.
 */

DARROW          =>
COMPARISON      ==
ASSIGNMENT      =
INTEGER         [0-9]+
TYPEID          ([A-Z]+)[A-Za-z0-9_]*
OBJID           ([a-z]+)[A-Za-z0-9_]*

/*
 * Keywords - true/false are case sensitive
 */
CLASS           (c|C)(l|L)(a|A)(s|S)(s|S)
ELSE            (e|E)(l|L)(s|S)(e|E)
FALSE           false
FI              (f|F)(i|I)
IF              (i|I)(f|F)
IN              (i|I)(n|N)
INHERITS	    (i|I)(n|N)(h|H)(e|E)(r|R)(i|I)(t|T)(s|S)
ISVOID		    (i|I)(s|S)(v|V)(o|O)(i|I)(d|D)
LET			    (l|L)(e|E)(t|T)
LOOP            (l|L)(o|O)(o|O)(p|P)
POOL            (p|P)(o|O)(o|O)(l|L)
THEN		    (t|T)(h|H)(e|E)(n|N)
WHILE		    (e|W)(h|H)(i|I)(l|L)(e|E)
CASE		    (c|C)(a|A)(s|S)(e|E)
ESAC		    (e|E)(s|S)(a|A)(c|C)
OF              (o|O)(f|F)
NEW			    (n|N)(e|E)(w|W)
ISVOID		    (i|I)(s|S)(v|V)(o|O)(i|I)(d|D)
NOT			    (n|N)(o|O)(t|T)
TRUE            true


%%

 /*
  *  Nested comments
  */


 /*
  *  The multiple-character operators.
  */
{DARROW}		{ return (DARROW); }

/*
{DIGIT} {
    cool_yylval.symbol = inttable.add_string(yytext);
    return DIGIT_TOKEN;
}
*/


 /*
  * Keywords are case-insensitive except for the values true and false,
  * which must begin with a lower-case letter.
  */


  {}


 /*
  *  String constants (C syntax)
  *  Escape sequence \c is accepted for all characters c. Except for 
  *  \n \t \b \f, the result is c.
  *
  */


%%
