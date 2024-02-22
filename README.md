# authapp

A flutter project!

Uses Bloc with clean code architecture.

If you want to analyse and see vulnerabilities in the code run `flutter analyse`.

As the endpoints are in http, the network requests may not work as expected,
therefore I strongly recommend checking the app in debug mode.

To run the app in debug mode use  ----    `flutter run`

To run the app in release mode use --- `flutter run --release`

#Note you have to run `flutter pub get` to add all the dependencies.

Explanation on the chosen state management solution : 

Bloc is by far the most powerful state management tool introduced by google.

It is highly dependable and provide high performace for the application.

It gives high readability, scalability and maintainability feature for any application.

Applicable to any kind of application.

For the purpose of clean navigation I have also used Go Router, which is the most recommended tool these days.

To ensure the responsiveness of the application I have used flutter screen utils.

For demonstration purpose, I used flutter secure storage as a way to mention the way of storage of tokens.

The application is analysed and resulted in "No issues" to be fixed.


#Lastly, The provided documentation for the change password endpoint was not complete, 
I am ready to accomodate any changes that may have to be done as a result of a change in 
this specific endpoint. 

Thank you!