# Technology Assessment

This project is an iOS application that displays the most recent articles from the New York Times API. It follows the MVVM-C (Model-View-ViewModel-Coordinator) architecture and applies SOLID principles. The application is built with Swift and SwiftUI.
# Technology Assessment

This iOS application displays the most recent articles from the New York Times API. It follows the MVVM-C (Model-View-ViewModel-Coordinator) architecture, adheres to SOLID principles, and is built with Swift and SwiftUI.

## Project Overview

The project follows the MVVM-C architecture, with responsibilities divided as follows:

- Model: Represents the data structures and entities used in the application.
- View: Displays the user interface and reacts to user interactions.
- ViewModel: Acts as an intermediary between the View and the Model, providing data and handling business logic.
- Coordinator: Handles navigation and flow control in the application.

The Repository design pattern is implemented to retrieve data from the remote database using the New York Times APIs.

## Tech Stack
- Swift
- SwiftUI

## Dependencies
The project relies on the following dependencies:

- Moya: A network abstraction layer built on top of Alamofire.
- AlamofireLogger: A logging framework for Alamofire requests.

## Installation

To install and set up the project, follow these steps:

1. Clone the repository:
   ```shell
   git clone <repository_url>
   cd TechnologyAssessment
   
2. Install iOS dependecy:
   Brefore open the project you have to nake sure you install Ruby and Cocoapods for ios dependencies 
   ```shell
   brew install ruby
   brew install cocoapods
3. Install project dependencies using CocoaPods:
    ```shell
    pod install
    
4. Open the project:
Open the generated TechnologyAssessment.xcworkspace file in Xcode.

5. Run the project:
Press Cmd+R or select Product > Run to build and run the project on a simulator
   
## Unit testing
The project includes unit tests that cover the repository and view model components. To run the tests, follow these steps:

In Xcode, open the TechnologyAssessment.xcworkspace file.

Select the test target you want to run, such as TechnologyAssessmentTests.

Press Cmd+U or go to Product > Test to run the tests

 
