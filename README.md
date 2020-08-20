# Flutter Clean Architecture + MVVM

Simple of flutter using Clean Architecture and MVVM

## Structure
1. Data 
- model : Data objects
- remote : APIs
- repository : connect to remote
2. Domain
- That is use case baby (connect with repo)
3. Presentation
- ViewMode : talks to use cases, init instante of any object, not know about the View, Organizes data and holds View State
- View : that is UI baby, just observes changes to ViewModel
