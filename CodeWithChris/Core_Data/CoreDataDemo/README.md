## Code with Chris Core Data Tutorial 

This is a five video tutorial on Core Data in iOS Development. [Access Tutorial Playlist here](https://www.youtube.com/watch?v=6XASUd7h5-s&list=PLMRqhzcHGw1aDYKmCuqXQ_IqpWpJlpoJ3)

### Lesson 1 - Core Data Basics

In the first video, he talked about the basic of Core Data. 

#### Why Core Dataa?

**Benefits**
- Apple's First Party Framework and works well with Apple's other framework and APIs
- Eliminates the use of third-party libraries and SDKs

**Drawbacks**
- Not an online (remote) data storage aka it is a local storage

#### Interactions 

**Traditional Database** 
- Insert, Create, Update, Delete (call functions) 

**Core Data**
- Use SQL underneath 
- No need to explicitly call Insert, Create, Update, Delete 
- Automatically Core Data does those

#### How to setup?

- Define entities and attributes
- Generate classes from them 
- Get a reference to the Persistent Container
- From Persistent Container, get a ManagedObject Context; through that, create and stores objects etc...


### Lesson 2 - Set up Core Data in New Xcode Project and in existing Xcode Project 

In Codegen, there are three categories. 

1. Manual/None - A user has full control over the Core Data and able to fully customize the generated classes (Generate two files, when built)
2. Class Definition - Core Data generates classes for a user behind the scene; no modifying or changing
3. Category/Extension - Generate half and able to customize the code 

### Learn more about Core Data
- [Apple Developer Documentation - Core Data](https://developer.apple.com/documentation/coredata)
- [Apple Developer Documentation - Core Data Programming Guide: What is Core Data?](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/index.html#//apple_ref/doc/uid/TP40001075-CH2-SW1)
