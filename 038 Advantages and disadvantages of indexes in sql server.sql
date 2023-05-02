/*
DISADVANTAGES OF INDEXES
Additional Disk Space: Clustered Index does not, requira any additional storage. Every
Non-Clustered index requires additional space as it is stored separately from the table.
The amount of space required will depend on the size of the table, and the number and
types of columns used in the index.

Insert Update and Delete statements can become slow: When DML(Data Manipulation
Language) statements(INSERT,UPDATE,DELETE)modifies data in a table, the data in all
the indexes also needs to be updated. Indexes can help, to search and locate the rows,
performance of data modifications.

What is a covering query-If all the columns that you have requested in the SELECT
clause of query, are present in the index, then there is no need to lookup in the table
again. The requested columns data can simply be returned from the index.

A clustered index, always covers a query, since it contains all of the data in a table. A
composite index is an index on two or more columns. Both clustered and non-clustered
indexes can be composite indexes. To a certain extent, a composite index, can cover a
query.
*/

-- better watch video part 35,36,37,38 for indexes