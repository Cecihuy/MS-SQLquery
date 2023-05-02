/*
Unique Index is used to enforce uniqueness of key values in the index
Note: By default, PRIMARY KEY constraint, creates a unique clustered index
UNIQUENESS is a property of an Index, and both CLUSTERED and NON-CLUSTERED indexes can be UNIQUE
*/

CREATE UNIQUE NONCLUSTERED INDEX UNIX_tblEmployee_FirstName_LastName
	ON tblEmployee(FirstName, LastName);

/*
Difference between Unique Constraint and Unique Index
There are no major differences between a unique constraint and a unique index. In fact,
when tou add a unique constraint, a unique index gets created behind the scenes.
*/

/*
When should tou be createing a Unique constraint over a unique index?
To make our intentions clear, create a unique constraint, when data integrity is
the objective. This makes the objective of the index very clear. In either cases,
data is validated in the same manner, and the query optimizer does not
differentiate between a unique index created by a unique constraint or
manually created.

Userful points to remember:
1. By default, a PRIMARY KEY constraint, creates a unique clustered index,
where as a UNIQUE constraint creates a unique Non-Clustered index. These
defaults can be changed if tou wish to.

2. A UNIQUE constraint or a UNIQUE index cannot bo created on an existing
table, if the table contains duplicate values in the key columns. Obviously, to
solve this, remove the key columns from the index definition or delete or update
the duplicate values.
*/