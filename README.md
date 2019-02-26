# Cinemate
Cinemate is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [x] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthough GIF

<img src="http://g.recordit.co/nKkLjxHB5o.gif" width=250><br>

### Notes
Describe any challenges encountered while building the app.
- One major challenge I faced was getting the poster to modal to the viewcontroller with the webview. Adding the functionality with the show seguw was easy, but since using modal removes the navigation controller, adding a back button with a working webview was difficult. 

## Cinemate Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [x] (1pt) Run your app on a real device.

### App Walkthough GIF
<img src="http://g.recordit.co/stAkbHN1uB.gif" width=250><br>

### Notes
Describe any challenges encountered while building the app.
- Configuring auto-layout to make sure that the app worked on all screen sizes.
- Improving the aesthetic of the table view.
- Registering my device and running the app on a real phone.
