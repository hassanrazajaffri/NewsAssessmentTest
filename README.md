# NewsAssessmentTest
# Most Viewed News

HararooAssesment is a sample iOS app  depicting the use of MVVM Unit Testing and Mocking  API Controller. The app uses TMDB APIs to fetch the list of most viewed news 

### MVVM 
The project uses **MVVM** to avoid the problem of Massive View Controller and also facilitate Unit Testing via dependency injection.

### Unit Tests 
The project uses **XCTest** framework to implement unit testing & ensure the features of app are always working and avoid bugs and errors introduced at later stages of development.  **Mock API Controllers** are being used to test the Models and functionalities.

## Project directory structure 

```
├── HararooAssesment

├── UtilityClasses
    └── UIImageVieweExtensions.swift
    └── Colors.swift
    └── Url.swift
    └── GCDBlackForMainThread.swift
    └── UIFontUtilities.swift
    └── StringUtilities.swift
    ├── Contains utility classes to which give help to perform tasks efficiently  
    
├── AppDelegate
    ├── AppDelegate.swift
    
├── Storyboards
    └── Main.storyboard
    └── LaunchScreen.storyboard
    
├── ViewControler
    └── NewsListViewController
        └── View
              └── NewsListViewController.swift
        └── Model
              └── NewsModel.swift
        └── ViewModel
             └── NewsListViewModel.swift
             └── NewsItemViewModel.swift
├── Api Manager
    └── WebServiceError.swift
    └── WebServiceConfiguration.swift
    └── GetNewsListConfigration.swift
    
├── HararooAssesmentTests
    └── NewsListViewControllerTests.swift
    └── NewsDetailsViewControllerTests
    └── GetTrendingMoviesConfiguration.swift
    └── MockAPIController
    └── WebErrorTests.swift
    └── MockAPIControllerWebError.swift
    └── FontTests.swift
    └── StoryBoardTests.swift
    └── NewsListViewModelTests.swift
    └── StringTests.swift
    └── WebServiceTests.swift
    
├── Resources
    ├── Assets.xcassets
    
└── SupportingFiles
	└── Info.plist
```

## How to run the project

1) Get copy of project from git with git clone https://github.com/hassanrazajaffri/NewsAssessmentTest.git  

2) Run/opn HararooAssesment.xcodeproj this project file with double click or in xcode , i have developed it with latest xcode version 13.2
3) Select the device from top nevigator in xcode & press play button in top project navigator OR select product -> Build & run from top bar option

## How to Check Code Coverage Stats

Xcode’s code coverage tracking is disabled by default, so the first thing we’ll do is turn it on. So, go to the Product menu and choose Scheme > Edit Scheme. Next, choose the Test scheme and activate its Options tab. Finally, check the Code Coverage box, so that Xcode will gather code coverage data while your tests are running.

1) Presss CMD + U to run all test cases
2) Presss CMD + 9 to see the Code Coverage  report window in xcode 
3) Select code coverage from front window to see the results

## Access Key to get data from Nytimes 
I registered account on nytimes developer portal to get acccess key for using api data. i registered my account using hassanrazajaffri@gmail.com. 

## In case of any difficulty feel free to drop me message on hassanrazajaffri@gmail.com
