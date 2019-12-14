# NoGo

Hackerman

Emma Bilodeau,
William Carson,
Stephanie Cuterez,
Delaney Dow,
Isabelle Goode

App developed for EC327 final project

https://www.youtube.com/watch?v=vlV-N4shQmg&feature=youtu.be

Have you ever wanted to avoid someone, but you are always in the same area at the same time? Well if that’s a problem you face, NoGo is the right app for you. NoGo is an Android app designed to work as a social networking app with a map. It displays other users in the app with a marker and lets you know when they start to get closer to you. It helps avoid people by marking them as someone you do not like, or it can serve to notify you when people you like are near. It also has two different modes to be in, either play mode or work mode. When someone is in work mode it means they do not want to be bothered and when someone is in play mode they choose to be notified with updates. 

To build this project, we used the flutter application developement tool integrated with Android studio. The flutter SDK must first be installed, and then fully integrated with android studio. Flutter is a powerful software developement kit that has many built in files to ensure that the application assembly process is seamless and intuitive, and therefore there is a built in feature within flutter and android studio that creates many of these files by default when a new flutter project is created. However, most of this code was done in the android.app directory, where many of the original files were added and integrated together. Although flutter is coded in the dart programming language, there are also some portions of the program that were developed (and modified by the Hackerman team) in Java, and the dart programming language itself closesly resembles Java. To build the app, dart files are created, and the files are coded using widgets, which are central to the dart programming language. Widgets have several built in properties, and were more useful for app developement than the creation of classes in another programming language, althoug the outcome is essentially the same. Lastly, another key component of the app developement process was modifying many of the built in files, most notably the pubspec files, the AndroidManifest files, and the build.gradle files. Within our application we implemented the google maps API and incorporated images. To do so, we needed to also modify the aforementioned files, which are essential to the back-end developement of the application. the build.gradle files, in particular, needed to be modified to include and install specific flutter packages that were essential to the linking of the back and front end code. While the application developement process for NoGo was much more complex in reality, this paragraph provides the general overview for understanding and replication. 
