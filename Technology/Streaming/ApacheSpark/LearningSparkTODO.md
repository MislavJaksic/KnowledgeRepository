## Learning Apache Spark, Spark, O'Reilly, Karau, Konwinski

Apache Spark is a set of APIs that distribute tasks across multiple computers in a cluster.

### Overview

A driver program is a part of every Spark application that launches parallel operations on a cluster.  
SparkContext object is a connection to the computing cluster.  
Executors are nodes that do the computing.  
SparkConf is an object that configures your application.  
Resiliant distributed dataset (RDD) is Spark's way to abstract data, it is an immutable distribution of objects. RDDs are split into partitions.  
RDDs are created by loading a dataset or by giving the context a list of objects.  
RDDs have two operations: actions and transformations.  
Transformations create new RDDs from the previous one. They return a RDD.  
Actions compute a result based on a RDD. They do not return a RDD.  
All RDDs are created only when they are used in an action to prevent memory overflow and storage inefficiency.  
Intermediate RDDs are recomputed every time you run an action on them, so if you would like to use the same RDD in multiple actions, use RDD.persist() to store it in memory (or RDD.cache()).  
Lineage graph is a way Spark keeps track of all the intermediate RDDs.  

Passing functions to Spark: (in Python) lambda expressions, top level functions or user defined functions.  
Spark sends the whole object to the worker node, so don't send more then you have to. If there is a field, just extract it first.  

### Common transformations

map() function takes a function and applies it to every element of the RDD. It returns the changed RDD as a result.  
flatMap() function takes a function and applies it to every element, however, if it were to split an element (such as a list) into multiple parts, they would all be returned as separate elements.  
filter() function takes a condition and returns only the elements of the RDD that pass the condition.  

### Common actions

reduce() takes a function and applies it to two elements, then to the result and another element until there is only a single variable left. Examples are summing and concatenating.  
fold() is just like reduce, but also takes an invariant value, 0 for adding, 1 for multiplying, empty list for concatenation.  
aggregate() takes a zeroValue, a function which works with data in a node (seqOp) and a function that combines the result from many nodes (combOp). Used when you need to return a different data type from the one in the RDD.  
collect() stores the whole RDD in memory, commonly used when doing unit tests.  
take(n), top() and takeSample() samples the first n elements of a RDD.  
foreach() performs an action on every element in a RDD without returning a result.  
count() and countByValue() count the number of occurrences.  

### Persistence (caching)

RDDs are not stored in memory, they are instead computed from scratch every time we invoke an action. We can use persist() to keep it in memory and unpersist() when we no longer need it.

### Key/Value pairs (page 47)
