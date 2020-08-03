# Expand-Shrink-IconButton for Flutter
Easy to impletement, animated expand/shrink IconButton, meant for use with lists in Flutter.

<p align="center">
  <img src="https://github.com/HartP97/Expand-Shrink-IconButton-for-Flutter/blob/master/expand-shrink-icon.gif">
</p>

## How to use:

Easiest way to get started is to copy the `ExpandShrinkButton class` from my [main.dart](https://github.com/HartP97/Expand-Shrink-IconButton-for-Flutter/blob/master/main.dart) to your existing project, for example to one of resource frontend files and import that file in any page you want to use it! 

## Adjustable Attributes

#### buttonSize:
- defines the overall size of the button in px

#### animDurationInMilSec
- define the animation duration of the icon in milliseconds

#### isExpanded
- boolean that has to be passed which decides whether the shrinked or expanded veryion of the logo is displayed
- `isExpanded = true;` -> displays two big tiles
- `isExpanded = false;` -> displays three small tiles

#### fillColor
- color that fills the inside of a tile, in the example above it is set to transparent

#### borderColor
- borderColor of each tile

#### onTap
- function that can be passed and gets triggered when the button receives a single tap
- this is the point where we should switch `isExpanded` between `true` and `false`

#### padding
- padding between icon and buttonSize
- the higher the padding, the smaller the icon inside the button will appear (buttonSize will stay the same


## To-Do
- [ ] show example with list view expanding and shrinking
- [ ] let user decide over thickness of border
- [ ] let user adjust the backgroundColor
- [ ] catch if padding is higher than button size
- [ ] add doc description for each attribute
- [ ] let user choose to add a borderRadius or not
