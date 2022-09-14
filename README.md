## Introduction
This package is developed for basic features that almost every app will have in Swivt technologies. We keep this to save time and effort of developer and project as well. This packages specially solves the authentication feature and saves 80% of coding time from this feature, as well as user related things. This packages uses clean architecture pattern with BLoC as a state management solution. 

## Project Overview
- core
- DI 
- features
- shared

If you are new developer at Swivt, please make sure to go through exploring files and folder inside initial project. You should be clear on all the functions, methods, widgets and utils used as well as the purpose of code. It is made in such a way that it should be work out of box in any project and made customizeable as well. If you are confused and doesn't seem to be customize what is needed then please connect with the sr. team lead instead of modifing yourself inside code or before taking decision of using alternative way. ** DI ** short for Dependency Injection , has classes which we inject at the begining of the project which are dependent in each other. It uses getIt and injectable together to make code clean through using only annotation. getIt instace is passed from project to super_module package. ** shared ** is not related to code but only created to share common files between team such as configs, scripts, etc.


## Clean Architecture (features)
As per project architecture we have divided into 3 categories:
1. Presentation Layer
2. Domain Layer
3. Data Layer

### Presentation Layer
- It contains BLoC and should be used for UI business logic only such as type conversion for api or sending what data is needed to UI only. 

### Domain Layer
- It should contain the business logic such as conversion of data types to model and should also contain advanced logic as well. It should be dependent with application layer other than the network layer. changing of network data should not effect this layer.  It will also have contract for the network layer.

### Data Layer
- Data layer should contain the data which only comminutes with network such as data mapping and error handling task are executed.

## Usage
- initalize BLoC provider in UI 
** For Example **
` ExampleBloc exampleBloc = getIt<ExampleBloc>();
exampleBloc..add(YourEvent());
' 


## Following are the few boiler-plate features that this packages includes.

### Auth
### User
### Address
### Cart
### Wishlist
### Firebase
