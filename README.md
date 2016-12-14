######################################
<h1> Database Queries - Examples of Simple Queries </h1>
######################################
<pre>This section provides several examples of queries based on the concepts that
have been discussed via problems located within the pdf's.
The hour begins with the simplest query you can issue, and builds upon the initial
query progressively. You use the EMPLOYEE_TBL table.</pre>

#######################################################################
<h2>Selecting all records from a table and displaying all columns:</h2>
#######################################################################
<pre>SELECT * FROM EMPLOYEE_TBL;</pre>

##############################################################################
<h2>Selecting all records from a table and displaying a specified column:</h2>
##############################################################################
<pre>SELECT EMP_ID
FROM EMPLOYEE_TBL;</pre>

####################################################################
<h2>Selecting all records from a table and displaying a specified column.
You can enter code on one line or use a carriage return as desired:</h2>
####################################################################
<pre>SELECT EMP_ID FROM EMPLOYEE_TBL;</pre>

#######################################################################################
<h2>Selecting all records from a table and displaying multiple columns separated by commas:</h2>
#######################################################################################
<pre>SELECT EMP_ID, LAST_NAME
FROM EMPLOYEE_TBL;</pre>

######################################
<h2>Displaying data for a given condition:</h2>
######################################
<pre>SELECT EMP_ID, LAST_NAME
FROM EMPLOYEE_TBL
WHERE EMP_ID = '333333333';</pre>

#############################################################
<h2>Displaying data for a given condition and sorting the output:</h2>
#############################################################
<pre>SELECT EMP_ID, LAST_NAME
FROM EMPLOYEE_TBL
WHERE CITY = 'INDIANAPOLIS'
ORDER BY EMP_ID;</pre>

#################################################################################
Displaying data for a given condition and sorting the output on multiple columns,
one column sorted in reverse order:
#################################################################################
<pre>SELECT EMP_ID, LAST_NAME
FROM EMPLOYEE_TBL
WHERE CITY = 'INDIANAPOLIS'
ORDER BY EMP_ID, LAST_NAME DESC;</pre>

#############################################################################
Displaying data for a given condition and sorting the output using an integer
in the place of the spelled-out column name:
#############################################################################
<pre>SELECT EMP_ID, LAST_NAME
FROM EMPLOYEE_TBL
WHERE CITY = 'INDIANAPOLIS'
ORDER BY 1; </pre>

#############################################################################
Displaying data for a given condition and sorting the output by multiple
columns using integers, the order of the columns in the sort is different than
their corresponding order after the SELECT keyword:
#############################################################################
<pre>SELECT EMP_ID, LAST_NAME
FROM EMPLOYEE_TBL
WHERE CITY = 'INDIANAPOLIS'
ORDER BY 2, 1; </pre>

#############################################################################
When selecting all rows of data from a large table, the results could render
a substantial amount of data returned.

Counting the Records in a Table

A simple query can be issued on a table to get a quick count of the number of
records in the table or on the number of values for a column in the table. A
count is accomplished by the function COUNT. Although functions are not
discussed until later in this book, this function should be introduced here
because it is often a part of one of the simplest queries that you can create.

The syntax of the COUNT function is as follows:
#############################################################################
<pre>SELECT COUNT(*)
FROM TABLE_NAME;</pre>

#############################################################################
The COUNT function is used with parentheses, which are used to enclose the
target column to count or the asterisk to count all rows of data in the table.

Counting the number of records in the PRODUCTS_TBL table:
#############################################################################
<pre>SELECT COUNT(*) FROM PRODUCTS_TBL;

COUNT(*)
----------
    9


1 row selected.</pre>

####################################################################
Counting the number of values for PROD_ID in the PRODUCTS_TBL table:
####################################################################
<pre>SELECT COUNT(PROD_ID) FROM PRODUCTS_TBL;

COUNT(PROD_ID)
---------------
       9


1 row selected.

Interesting note: Counting the number of values for a column is the same as
counting the number of records in a table, if the column being counted is NOT NULL
(a required column). However, COUNT(*) is typically used for counting the
number of rows for a table.</pre>

###################################################################################
Selecting Data from Another User's Table

Permission must be granted to a user to access another user's table. If no permission
has been granted, access is not allowed. You can select data from another user's table
after access has been granted (the GRANT command is discussed in Hour 20, "Creating and
Using Views and Synonyms") to select from another user's table. To access another user's
table in a SELECT statement, you must precede the table name with the schema name or
the username that owns (created) the table, as in the following example:
####################################################################################
<pre>SELECT EMP_ID
FROM SCHEMA.EMPLOYEE_TBL;</pre>

#############################################################################
NOTE

If a synonym exists in the database for the table to which you desire access,
you do not have to specify the schema name for the table. Synonyms are alternate
names for tables, which are discussed in Hour 21, "Working with the System Catalog."
Column Aliases

Column aliases are used to rename a table's columns for the purpose of a particular
query. The PRODUCTS_TBL illustrates the use of column aliases.
#############################################################################
<pre>SELECT COLUMN_NAME ALIAS_NAME
FROM TABLE_NAME;</pre>

The following example displays the product description twice, giving the second column an alias named
PRODUCT. Notice the column headers in the output.

select prod_desc,
    prod_desc product
from products_tbl;

PROD_DESC                 PRODUCT
------------------------- ------------------------
WITCHES COSTUME           WITCHES COSTUME
PLASTIC PUMPKIN 18 INCH   PLASTIC PUMPKIN 18 INCH
FALSE PARAFFIN TEETH      FALSE PARAFFIN TEETH
LIGHTED LANTERNS          LIGHTED LANTERNS
ASSORTED COSTUMES         ASSORTED COSTUMES
CANDY CORN                CANDY CORN
PUMPKIN CANDY             PUMPKIN CANDY
PLASTIC SPIDERS           PLASTIC SPIDERS
ASSORTED MASKS            ASSORTED MASKS
KEY CHAIN                 KEY CHAIN
OAK BOOKSHELF             OAK BOOKSHELF


11 rows selected.

Column aliases can be used to customize names for column headers, and can also be used to reference a
column with a shorter name in some SQL implementations.
