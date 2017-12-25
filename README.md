# Lab 5 - Flix

Flix is a movies app displaying box office and top rental DVDs using [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: 2 hours spent in total

## User Stories

The following **required** user stories are complete:

- [X] Create a movie model (+2pt)
- [X] Implement the movie model (+2pt)
- [X] Implement property observers (+2pt)
- [X] Create a basic API Client (+2pt)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Other ways to clean up code
2. How to structure projects to emphasize code quality

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/QPjHj04.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## License

Copyright 2017 Benjamin Singer

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


# Lab 3 - Flix

Flix is a movies app displaying box office and top rental DVDs using [The Movie Database API](https://developers.themoviedb.org/3).


Time spent: 2 hours spent in total

## User Stories

The following **required** user stories are complete:

- The following screens use AutoLayout to adapt to various orientations and screen sizes
- [X] Movie feed view (+3pt)
- [X] Detail view (+2pt)

The following **optional** user stories are implemented:

- [X] Dynamic Height Cells (+1)
- [ ] Collection View AutoLayout (+2)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Other constraint options
2. Fixing constraint problems

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/DpSloV7.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

___


# Project 2 - Flix

Flix is a movies app displaying box office and top rental DVDs using [The Movie Database API](https://developers.themoviedb.org/3).

Time spent: 3 hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User can tap a cell to see a detail view (+5pts)
- [X] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView (+5pts)

The following **optional** features are implemented:

- [X] User can tap a poster in the collection view to see a detail screen of that movie (+3pts)
- [ ] In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer (+3pts)
- [ ] Customize the navigation bar (+1pt)
- [ ] User sees an alert when there's a networking error (+1pt)
- [ ] User can search for a movie (+3pt)
- [ ] While poster is being fetched, user sees a placeholder image (+1pt)
- [ ] User sees image transition for images coming from network, not when it is loaded from cache (+1pt)
- [X] Customize the selection effect of the cell (+1pt)
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete (+2pt)

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Clever UI designs for the DetailViewController page
2. Best pods to integrate into project

## Video Walkthrough

[Here's](https://i.imgur.com/k6qSynJ.gif) a walkthrough of implemented user stories.

GIF created with [LiceCap](http://www.cockos.com/licecap/).

___

# Project 1 - Flix

Flix is a movies app using the [The Movie Database API](https://developers.themoviedb.org/3).

Time spent: 4.75 hours spent in total

## User Stories

The following **required** user stories are complete:

- [X] User sees app icon in home screen and styled launch screen (+1pt)
- [X] User can scroll through a list of movies currently playing in theaters from The Movie DB API (+5pt)
- [X] User can "Pull to refresh" the movie list (+2pt)
- [X] User sees a loading state while waiting for the movies to load (+2pt)


The following **additional** user stories are implemented:

- [X] Cells resize based on movie overview label

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Constraint issue - Storyboard throws warning when size of cell depends on ImageView and label
2. Using CollectionView to display movies

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/PdPbVwo.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

* Accidentally used cell's imageView instead of posterImageView. **fixed**
* Getting warning after making cell size dependent on imageView and label. **open**
