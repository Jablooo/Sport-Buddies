# Gym Buddies
Create a two-sided-marketplace using Ruby on Rails and deploying it.

- Programmes used: Trello, GitHub, RubyonRails, http://dbdesigner.net, mockplus, Heroku
- Gems used: bootstrap, stripe, shrine, shrine-cloudinary, devise, figaro

Heroku - https://sport-buddies.herokuapp.com/

## Problem
1. As someone who has moved around a lot it is hard to establish a new group of friends who play the same sports as you in a new city/country. You don't have the network of friends to call upon for different sports that you may play, tennis squash football, you don't want to commit to joining a club and having the 3 times a week commitment training/matches but just want to casually play every so often.

2. I also don't always move with my sport equipment as I don't know how long I will be living in this city.

## Solution
Creating a dashboard for people to meet people in their area who want to play sport with them.

Secondary dashboard for selling and renting sports equipment.
eg I have a surf board in my garage or an old tennis racquet that someone could borrow and I make money off it.

- [x] User Stories
- [x] ERD
- [x] Wireframes
- [x] User flow
- [x] Happy and sad paths

## User Stories
[Link to Trello User Stories](https://trello.com/b/pndMIfVo/term-2-two-sided-market-place)

#### Donut
1. As a new USER I want to set up new equipment to sell
2. As an experienced USER I want to be able to save other USERS to make it easier to find them
3. As an experienced USER I want to be able to contact other USERS through the app
4. As a potential USER I want to see sport equipment and people in my area before signing up

#### Sprinkle
1. As a new COACH I want to be able to set up classes for students to attend
2. As a BUDDY I want to be able to find & contact COACHES for lessons
3. As a USER I want to have a profile without having to provide a photo
4. As a Buddy I want to rate the COACH for the lesson

## Wireframes
![Wireframes](/docs/img/wireframe1.png)
![Wireframes](/docs/img/wireframe2.png)

## ERD
![Final ERD](/docs/img/ERD.png)

## User flow
![New User](/docs/img/Userflow1.png)
![Existing User](/docs/img/Userflow2.png)

## Colour Palette
![colours](/docs/img/Colour_Palette.png)

## Happy/Sad Paths
![Happy/Sad Paths](/docs/img/Happysad1.png)
![Happy/Sad Paths](/docs/img/Happysad2.png)

## Issues Encountered
1. Issues with ERD design on how best to create the sport table connection. Attempted various ways but lost a lot of time with has_and_belongs_to_many tables.
![ERD Issue](/docs/img/ERD_issue.png)

2. Initial issues with seeding heroku database.
3. Issues creating tabs on homepage which called partials below to be rendered on same page depending on which option you press.

## Future Upgrades
1. Addition of Coaches functionality
2. Addition of geocoder for people near by to automatically be found
3. Addition of skill level to sport beginner, intermediate, pro
