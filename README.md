# Spy Alley

![Spy Alley Box](https://images-na.ssl-images-amazon.com/images/I/51ZJk5l0iKL._AC_UL320_SR280,320_.jpg)

Spy Alley is a multi-player board game that plays like a mixture between Clue and Monopoly. At the beginning of the game, each player picks a secret spy identity. The objective of the game is to be the last remaining player with an unknown identity.


## Set Up

![Spy Alley Score Card](http://1.bp.blogspot.com/-iRktDJivhSk/VErOpFjH6NI/AAAAAAAAJHI/J4di6txucJE/s1600/DSCN0745.JPG)

Each player chooses a game marker and receives a score card,a bank (equal to $10 times the number of players), and chooses a spy identity. The spy identity is to be kept secret.


## Gameplay

The game is played on a rectangular board. The perimeter of the board contains different action game spaces. Those spaces will call for or offer the player to do one of the following:

- Collect money
- Pay money
- Purchase spy items
- Receive a move card
- Receive a free gift
- Make another move

![Spy Alley Board](https://images-na.ssl-images-amazon.com/images/I/7138aqOEoXL._SY741_.jpg)

The game is played with a standard six-sided dice. During each player's turn, she will either roll the dice or use a move card (if she has one) to move her marker. Some of the space actions are optional, while some are compulsory. Instructions for how to play each space are included in the json.

In addition to the spaces around the perimeter, there is a route that cuts through the center of the board called "Spy Alley". Spy alley is where all of the spy embassies are located. An important note about spy alley is that, for the most part, entering into spy alley is optional (with the exception of if the player ends her turn on the Spy Alley space).

There are two ways to win the game. The player whose turn it is can be the last player standing, or they can collect all of the spy item pegs for their identity and land on their embassy in Spy Alley.

Spy items are aquired by either purchasing after landing on an appropriate space or after landing on a "Free Gift" space.

During any player's turn, they may guess the identity of any of the other players. If the guesser is incorrect, they are eliminated from the game and the player whose identity was incorrectly guessed can either choose to assume the eliminated player's identity or keep their own. Whomever stays in the game will also receive all of the eliminated player's move cards, gift cards (if unused), money, and spy items.

There is one space in Spy Alley, the Spy Eliminator space, that if you land on it, will allow you to take a free guess for all players also in Spy Alley. If you guess incorrectly while on the Spy Eliminator space, you will still keep all of your items and remain in the game. You can only guess other players who are in Spy Alley from the Spy Eliminator space.

This game involves deception, so it is often not the best idea to try to collect and purchase only items that are associated with your identitiy. For instance, if you land on a space that allows you to purchase Code Books, you may want to purchase more than one so as to not draw attention to your identity.


## The Application

You are building an application that will allow you to play with multiple players, either human or computer. You want to be able to make a move, draw cards when prompted, decide whether or not to make purchases, mark your board, and guess other player's identities.


## Data

We have started you out with json files of the board spaces, the move card deck, and the free gift deck. Feel free to update these data structures if you need to, or challenge yourself by working within these parameters.

There is a Board Printer and a Score Card Printer already prepared which you can view by running `runner.rb`. You will need to make some adjustments to these classes as you build in your functionality.


## Resources

Check out this [Spy Alley Youtube introduction video](https://www.youtube.com/watch?v=w3G1LUITeAY)

[Official Spy Alley Rule Book](http://www.rectorsquid.com/Spy_Alley_Rules.pdf)

