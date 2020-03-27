
# Table of Contents
* [I can make anything](#make-anything)
    * [I can TDD anything](#tdd-anything)
    * [I can program fluently](#program-fluently)
    * [I can debug anything](#debug-anything)
    * [I can model anything](#model-anything)
    * [I can refactor anything](#refactor-anything)
    * [I have a methodical approach to solving problems](#methodical-approach)
* [I help my teams succeed](#teams-succeed)
    * [I use an agile product development process](#agile-process)
    * [I write code that is easy to change](#easy-to-change)
    * [I can justify the way I work in a business context](#buisness-context)
    * [I can grow collaboratively](#grow-collaboratively)
* [I am equipped for long term growth](#longterm-growth)
    * [I manage my own well-being](#well-being)
    * [I can learn anything by myself](#learn-anything)

# I can make anything<a name="make-anything" />

## I can TDD anything<a name="tdd-anything" />
### What does it mean to be able to do this?
It means that no matter the problem, I can set a testing metric by which I define success. I then recursively divide the task into smaller tests which are failing which need to succeed. When I reach a test I can pass, I solve it in the easiest way possible. I add more tests to make sure the code is robust and catching edge cases, and solve for green again. Then I set about trying to solve the rest. I've written about it in kind of a weird and ambiguous way, but that's because I think of TDD as a methodology rather than just an exclusively code-based discipline. The same principles could be applied to building a house; our first testing metric is whether we can *see* the frame of the house with our eyes;
`expect(house).to respond_to(show)`
 That's failing so we build the frame. Then we want it to be able to keep out rain, so we build a roof. The test passes if:
```
 cloud.rain_on(house)
 expect(house.floor).to_eq(:dry)
```
Being able to TDD *anything* is confidence and experience in using TDD to steer the development *of* anything.
### Evidence and explanation

#### [TDDing a Kata Video](https://www.youtube.com/watch?v=LwrQk8YVEEQ&feature=youtu.be)
I recorded a 20 minute video of me TDDing a codewars kata. There's a few shaky moments, mainly with syntax because it was my first time on Ruby in a while. I kept it all because I wanted to keep the video unpolished, to see how my process works under some modicum of pressure. Being able to observe myself, I find this video really compelling evidence to myself that I can TDD well.
* **a note**: I treated the function as a feature test over a unit test because the scope of the kata. It feels like the developed method is the highest level of the project, and thus the feature we're trying to implement.

#### My TDD process
In concrete, programming terms:
##### Style 1:

1. Write a feature test to test the output I want to see on my hypothetical app.
2. Write the simplest test to get a green light, without implementing new features or units. If this is impossible, go to step 3.
4. Write more tests to test the feature at different angles. Change code to pass these tests Go to step 1 for a new feature.
3. Write a new unit test which tests the output I want to see on this hypothetical function.
5. Write the simplest code to pass this. if impossible, think of a new functionality and go back to 4.
6. Rinse repeat expanding recursively into red tests until we start coming up and passing green tests.

##### Style 2:

Style 2 I discovered after I did a mock pairing interview session. The kata in question required substantial stubbing just to write the first feature test. Under pressure, my mind mixed TDDing with feature implementation. Instead of trying to write one feature test to encapsulate all the functionality at once, I wrote a simple feature test, passed it, and then implemented the next bit as I would implement a new iterative feature.

This differs from style one in terms of building features iteratively up (still TDDing however, not like my takeaway challenge debacle) instead of recursive tests extending down. It's effectively the same as Style 1, except you break a problem down into step-by step features you want to implement, and then approach each feature in style 1 fashion, adding it to the application.



#### Example repos
##### [BlackLitFunction](https://github.com/punchcafe/BlackLitFunction/)
This repo has been developed top-down from capybara feature tests to individual unit tests, and refactored over Agile sprint iterations as the feature requirements changed.
##### [Bowling Challenge](https://github.com/punchcafe/bowling-challenge/) + [Thermostat Challenge](https://github.com/punchcafe/js_thermostat)
These both demonstrate TDDing in a non-ruby language.

##### [TDDing a Kata video](https://github.com/punchcafe/TDD_demonstration)
Here you can see my approach to feature testing a command line application.

#### Commit Histories
Commit histories which document the RGR TDD feature cycles:
* [Bowling Challenge](https://github.com/punchcafe/bowling-challenge/commits/master)
* [Rock, Paper, Scissors Challenge](https://github.com/punchcafe/rps-challenge/commits/master)
* [Black Lit Function](https://github.com/punchcafe/BlackLitFunction/commits/master)

#### Coach comments
* Alice said my testing on the bookmark challenge was good.
##### Sam Jones feedback session
* *"Looks good at a high level"*
* *"Testing demonstrated understanding of when **not** to test"*
* *"Sounded like your process of refactoring the tests to implement admin asymmetry was sensible"*

### Feedback
I spent a large part of the first 4 weeks struggling with the core principles of TDD, but I found through a process of a question, feedback from a coach, processing in my brain, new question, rinse and repeat I was able to get a more instinctive understanding. For this section, I've included feedback on *my* TDDing in the evidence section, but I think the more compelling stuff is what I learnt through that coach question feedback loop. I can't remember it here perfectly but I'll paraphrase:

#### Kat (week 1) behaviour v state
Kat's feedback in the first week really helped me get to grips with trying to test behaviour over state. As a budding TDDer who understands the code they are writing, it's easy to slip into habits of writing tests to glassbox test the internal workings of your code. For example, one test from my early Boris Bikes days:
```
it "throws error if release_bike is called on 0 bike station" do
  subject.docked_bikes=[]
  expect {subject.release_bike}.to raise_error
```
In this test we mess with the internal state of our `docked_bikes`. We've mixed testing behaviour and state because this now inherently requires our docked bikes to be an array. Using an array is **how we make it work**, not **what we make it do**. Testing behaviour over testing state is testing what it's doing as opposed to how it's doing it. I find it helps to imagine that behavioural tests are like someone using an API we've written. They only have time to look at the abstractions, like our method names and our outputs. The rest should be kept well out of sight. A similar test at the end of the week for the weekend challenge demonstrates a better understanding of this:
```
it "planes in TAKEOFF no longer are in PLANES" do
  allow(subject).to receive(:weather_report) { :sunny }
  pointer = Plane.new
  subject.land(pointer)
  subject.takeoff(pointer)
  expect(subject.planes.include?(pointer)).to eq(false)
end
```
We only use outputs, abstracted methods and inputs. Meaning that I could change the internal structure of these methods but as long as they behaved correctly, our tests would pass.
#### Kat (week 2) Getting by without testing state
Once I had gotten to grips with the concept of not testing state, it became a lot harder to think of ways to test certain functionalities. At certain points, it got to the point where I wanted to write functions just to help in testing. Another conversation with Kat helped me understand that a) I shouldn't be writing production code for my tests' sake, and that b) If what you're trying to test for isn't do-able with the interfaces you've developed, is it a relevant thing to test? This second point stuck with me because it helped me understand how TDD, Behavioural testing and Abstraction are all very, very linked. Thinking in terms of just your methods, and how you want to test it, you set yourself up in the mindset to make a thoroughly abstracted API.
#### Sophie (week 2) London School of TDD v Chicago School of TDD
In Boston they don't stub anything, apparently. In London we stub all unit tests, meaning that each unit test should be able to work with no external dependencies. Catching breakdown of interfacing between units is left to the feature and integration tests. I respect this view point, and during my time at Makers it's been the philosophy I've stuck to. I do however think there's a lot to be said for both schools of thought.
#### Alice (week 3) Testing state v testing output
This idea of not testing actual values put my mind down a bit of a rabbit hole where I started to mix up testing things with `to eq()` as too literal and constrained to state. It was a conversation with Alice which cleared things up for me. The exact words escape me but the take away impression was that we write tests knowing they can be re written. If you're testing the *output* of something, then it's fine to write what we expect that output to look like, be it an array, string, whatever. Testing the state of the output by specifying the form it's going to be in *isn't* the same as testing the state anywhere internally in a method or object. As format of output changes, so too does can our tests.
#### Sophie (week 3) Top-down TDDing
Sophie's feedback I remember a little clearer than the rest because of how hysterically crushing it was. I had spent the weekend working on the takeaway challenge, planning it all out, then implementing it TDD style, unit by unit. I explained I had planned it from the top down but built it from "the bottom up". Her response was "yeah that's kinda the *opposite* of what we want you to do". This was a great learning curve though, as it reminded me of what I had been told in week 1, but had lost somewhere on the self-learning track. TDD should always be approached top down. This is a lot easier to see when we have applications with a visual testing framework like capybara, but for a command line app it's easy to lose sight of. Make your plans, sure, but write your tests from the very top view of the house. The top level tests should represent what you want the end goal functionality to look like. That way, all your code and subsequent tests are *driven* to satisfying that initial test, and in turn realising the initial idea. Hey it's *almost* like it's in the name of TDD and it just took me 3 whole weeks to figure out.
#### Alice (week 4) Alice Pilgrim's School of TDD vs the World
During week 4's Bookmark Challenge, I wrote a [`DBinterface` class](https://github.com/punchcafe/28-1_bookmarkmanager/blob/master/lib/dbinterface.rb) to delegate all handling of SQL requests. In keeping with the London School of TDD I stubbed all interactions this class made to the Ruby gem `PG`.
```ruby
describe DBinterface do
  subject { DBinterface.new("somedb") }
  before (:each) do
    @payload = double("payload")
    @connection = double("connection object",
      :connect => true,
      :close => true,
      :exec => @payload)
     PG.stub(:connect).and_return @connection
  end

  it "returns the payload for a successful connection" do
    expect(subject.sqlreq("SOMEREQ")).to eq(@payload)
  end

  it "throws error if not given a string" do
  expect { DBinterface.new(:somesym) }.to raise_error TypeError

  end
  it "throws error if can't connect" do
    PG.stub(:connect).and_return(false)
    expect{ subject.sqlreq("SOMEREQ") }.to raise_error("No connection")
  end
end
```
This sparked a talk with Alice. While the above tests do test the unit functionality, they don't test our database. The impression I got from our talk was that this instance was a bit of an exception to the rule, because "we have no other way of testing our database". I found it particularly interesting because it means there's room in TDD for personal interpretation. I could see her logic, and trusted it despite it going against what was supposed to be a hard and fast rule. This was a bit of a mile stone for me in terms of setting aside old university physics habits of having to know the absolute answer, and being comfortable going on something I can assert to be reasonable.

#### E **ddd** (week 6) TDDing and the domain model
I had been struggling for a while understanding how TDD, in all it's geodesic minimalist glory, works with a domain model. Generally speaking I always thought domain models should try and map out the entire picture from day one, before one goes about implementing it. I approached Ed to ask him about it and his feedback was simple; your domain model updates and iterates too. This felt like the final piece of the TDD puzzle, especially when framed in the context of that week's challenge. Week 6 was the first exposure to team projects and Agile development. While developing the Makers BnB app in Agile style, the overarching links between TDD, domain modelling, planning and iterative development were crystallised. They are all kind of limbs of one big, growing, organic blob.

## I can program fluently<a name="program-fluently" />

### What does it mean to be able to do this?
I think of this as a two fold thing. I can primitively program fluently is the base step. The next would be I can program fluently in *Ruby*, or something.

* I can primitively program fluently:
    * I can describe what I want a program to do in concise, imperative sentences.
    * I can translate those sentences into quasi-code, showing an understanding of how computers *generally* handle data and process things.
* I can program fluently in *Ruby*
    * I can translate my quasi-code into lines of Ruby code.
    * I understand the nuances of the language I'm understanding, to be properly utilising it's language.
    * When creating my project, syntax and ruby structure aren't blockers in making my program.

### Evidence and explanation

#### [Codewars Kata](https://github.com/punchcafe/SelfStudy/tree/master/Codewars)
While these examples are all *pre* makers and thus lack certain refinement, I feel they display a good fluency in primitive programming, where I use *ruby* interpret my imperative solutions to these problems.

#### [Twitter Challenge](https://github.com/punchcafe/chitter-challenge)
For this challenge, I used an ORM, and designed the web app to fit an MVC format. This extension of programming principles to manage information flow across several different environments, I believe, requires a fluency in programming to be able to apply the underlying concepts of coding (shifting data around and doing stuff to it) to a multi-paradigm app.

#### [Bowling Challenge](https://github.com/punchcafe/bowling-challenge/commits/master)
For this weekend challenge, I wanted to lean in to ES5's funky quirks and program more imperatively, less OOP for a fun weekend (what do you mean that's not your idea of a fun weekend?). It shows a good fluency of how to use core computing concepts to express my solution, as opposed to abstractifying it all away.

#### [TDDing a kata Video](https://www.youtube.com/watch?v=LwrQk8YVEEQ&feature=youtu.be)
This is a good example in real time of me using Ruby and rspec after not using it for a while. Despite that I feel this video shows a confidence in fluency. There are a few syntax look ups, but they are concise because I know exactly what I need from my code.

### Feedback
I find it difficult to think of what constitutes feedback for this particular sector. I feel that asking a coach to look at your program and tell you if you're doing OK goes in the face of the approach we've been taught about self-validated learning. Outside of that it's somewhat difficult to gather feedback organically as part of the course and not specifically for this portfolio, so instead I'm going to focus on personal feedback and milestones.
* helping people in my cohort - *Ruby* I was often asked to help people de-bug or explain a concept. I could often drop in on their code and help guide them through where and issue was occurring. This re-affirmed that I have at least some solid level of fluency.
* helping people in my cohort - *JavaScript* This was a big break through for me. Since JS is quite different from Ruby, being able to begin to help other people in my cohort with issues deeper than syntax felt like a milestone. Programming fluently and understanding the underlying nuances of the syntax your handling go hand in hand. Being able to pick up JS in quite a short time and be able to help some of my cohort with their nuancey code troubles felt like I was getting close to "agnostic" code fluency.
* Ellie has always been very encouraging about my programming fluency.

## I can debug anything<a name="debug-anything" />
### What does it mean to be able to do this?
This one is interesting for me. To me I see a distinction between being able to *successfully* debug anything, and debug anything. If you can *successfully* debug anything, congratulations. You may be the second coming of christ. My interpretation of being able to *debug anything* is having an approach to debugging which allows you to systematically close in on a bug through process of logical elimination. "I can debug anything" means that give me buggy code and I can set out one step at a time and slowly close in on the creepy crawly. Not being able to debug anything would be randomly trying to change code and indiscriminately searching for bugs anywhere in the code. And probably a good amount of crying. I mean there's crying in both ways, but still.
### Evidence and explanation
All projects tend to have the need to be able to debug anything, however as evidence for debugging goes it's a little bit harder to gather. Mostly because by the time a project has been finished, the bugs have been murdered. That being said, some direct anecdotal evidence would be:

#### My process
1. Tighten the loop: use the visible error to deduce as best as possible the general area of the bug. See it? go to 3. don't see it? On to number 2 with you!
2. Get visibility: Follow the flow the code while logging objects and method results, effectively testing any assumptions. Use the occurrence of any discrepancies in this visibility as your basis of a new, more specific visible error. Refer back to 1.
3. Found it? fix it.

#### [TDDing a kata](https://www.youtube.com/watch?v=LwrQk8YVEEQ&feature=youtu.be)
This one has a few examples of me following the flow and debugging a simple console app. Since the scope of the project was small, there isn't much of a chance to demonstrate getting visibility. This is due mostly to once the fact that once the *loop* has been tightened, the issue becomes evident.

#### [Debugging 1 + Debugging 2](https://github.com/punchcafe/skills-workshops/commit/86f196c56f5998e80325d4c3616efec15e0c7ffd)
successfully debugged (except you, geocoder) the exercises in Kat's week 1 and 3 debugging workshops.

#### Erin & Elliot SPA challenge
This is great example of systematic debugging. Week 7's challenge is to develop a single page javascript application. Erin and Elliot we're finding that their implementation of a js module wasn't implementing their listener functionality, and actions on elements weren't being detected. I offered helping them get to the root of the cause, but since I have minimal experience in JS, it really forced me to implement *closing the loop, and getting visibility*. We logged through the listener to see if it was being triggered at all. It wasn't. We traced it back to the first time it was being implemented. It was being implemented inside a module, with a `this` keyword. We console logged what `this` was at that stage and discovered that it wasn't what they thought. That enabled us to re-evaluate the scope we where in. It became apparent that there had been some complication, probably because they were implementing it in a module, there was an assumption that `this` would refer to the export of the module. We instead explicitly linked it to the `prototype` of the constructor, and then the tests started passing.

#### [Makers BnB](http://punchbnb.herokuapp.com)
When building the back end of this I was using the standard familiar debugging processes of looking for error messages on rspec, and testing the rackup. When working on front end however, I was faced with the interesting challenge of implementing the *loop + visibility* methodology on debugging css. CSS doesn't give the same convenient error messages or print statements, so I had to apply the concepts differently, especially as it was my first CSS project. Tightening the loop became a process of deduction, by editing the surrounding elements and changing background colours to grasp where the structure was going wrong. Getting visibility became about playing with properties of the glitchy element to test where the assumptions I was making broke down. The same methodology, just implemented in a totally different environment.

### Feedback
After a morning mobbing during week 7, I asked my team mates for their feedback on the way I approached debugging our single page app.

#### Feedback from Jay
>Luca followed a good process that heavily utilised console printing to tighten the loop, thus removing most outliers or areas of code that could not be causing the bug.

#### Feedback from Nikhil
>you have a really good mind for debugging, you were able to mentally run the program and spot where issues might be coming from before I was even able to see what was going on!


## I can model anything<a name="model-anything" />
### What does it mean to be able to do this?
Being able to model anything is the process breaking down a real world object or system, and represent it as collection of it’s properties and interactions with other things. Being able to model anything to build in a programming language is the same thing, but understanding what those properties and interactions look like in terms of data structures and methods, as well as knowing how to group them and encapsulate responsibility. A good model shouldn't be overly intricate, but instead a network of abstracted things exchanging high-level information.
### Evidence and explanation
#### [Airport Challenge](https://github.com/punchcafe/airport_challenge)
The model answer was a little different to what I implemented, but I thought my modelling of the Airport challenge is a good example of minimalist modelling. In the scope of the challenge it made sense to model airplanes and airports as kids trading Pokemon cards in the glorious year of our lord 1998. Planes were modelled as pretty much empty objects with a simple designation. The entirety of the heavy lifting was handled by the Airport class, which would act as though it were simply trading it's planes with other airports and sky objects.

#### [Takewaway Challenge](https://github.com/punchcafe/takeaway-challenge)
For this challenge I modelled the dish, menu, basket, order and displaying functionalities as different and abstracted classes. I understood the importance of separation of model from run time, and was able to not fall into the common pitfall of having hard-coding in my model. I feel this is very important because a good model should represent the *template* structure and functionality of a system, as opposed to a rigid model which maps only a selection of pre defined interactions and specific objects.
#### [Bowling Challenge](https://github.com/punchcafe/bowling-challenge)
This example is a little different, as it's an example of modelling a system (a bowling scorecard) as different states of a pre-existing data structure (an array). Usually, we do the reverse of this process by using clusters of data structures and methods to abstractly represent a system. I took this approach as a chance to embrace JavaScript's more technical feel than Ruby, and challenge myself with a more imperative coding style I hadn't used since university days. It's not good practice, but it's something I wanted to play around with. As far as *modeling anything* goes I think this demonstrates ability by showing that I can do it in more than one way, and model within stricter limitations.
#### [Makers BnB](https://github.com/jesslns/Makers_BnB)
Modelled the user/property paradigm and implemented it in the project. Later on I worked with my team to model being able to make a request and having a booking.
#### Astrophysics Final Project
For my final year at university, I had to develop software which could automatically detect stars in the frame of a CCD shot, and measure their luminosity. This required a mathematical model, but also implementation of this model in order to create a locating algorithm. In order to be able to model anything, you need to understand what implications and limitations your estimations have when you build the model, and be able to use them. During my project, I had to ensure that my model accounted for certain issues like faulty pixels in a camera, general background noise

### Feedback
* Got a shout out from Jess in appreciations after showing her how to model game turns as an object in the Battle week 3 challenge.
* Team thought my model for properties and users was good during the week 6 challenge.
* Not literal feedback, but learnt during the bowling challenge that if a model isn't working for you, it's OK to scrap it all and start again.
* An excellent exercise (all credit to Nikhil) during week 6. Before implementing bookings and requests, I drew my database models on the white board to explain to everyone. Before I started, Nikhil asked that the team try and explain my model to me. What was really cool was in doing so, they made me realise a flaw in my model. It illustrated to me that it's important to keep the development of a model collaborative, and use little techniques like Nik's to sniff out any places a model could be improved.

## I can refactor anything<a name="refactor-anything" />
### What does it mean to be able to do this?
Being able to understand exactly what a piece of code is doing so as to be able to replicate it in different syntax. Beyond that it means being able to step back from your coding momentum to evaluate your code, and see if it's staying true to *good code*. Defining *good code* is checking that it's adhering to various clean code principles, like being SOLID, SRPish, DRY, and RESTful.
### Evidence and explanation
#### [Bookmark Manager Encapsulation Refactor](https://github.com/punchcafe/28-1_bookmarkmanager/commit/f93de552e15f6efcaccdfbe0a3565651d6a99772)
The link in the title is the subsequent commit from [this commit](https://github.com/punchcafe/28-1_bookmarkmanager/commit/f06234e3ac42fdc4ba36870b27e71d3deb97659a). Here I've used my process of extracting a class to refactor all database querying to one Single Responsibility class.
#### Extracting a Class (my process)
I developed this step by step process during the oyster card challenge. It helps with the sometimes overwhelming feeling of trying to extract a class which feels deeply embedded:
* Draw a class diagram of the current class, and the new encapsulated class you want to extract into.
* Draw lines to indicate what instance variables and methods are being transferred.
* Create the new class, but don't write anything in it yet. Create an empty instance of that class in the parent class.
* Move all functions to be encapsulated into the new class by **cutting** them (not copying) from the original class.
* Watch all your tests explode
* Change all old calls of `self.method` to `self.encapsulated_class_obj.method`.
* Watch your tests still die as there are instances you've missed. Refactor any defunct calls in your tests.
* Congrats you did it. Have a snack in celebration.

#### [Makers BNB - RESTful routes](https://github.com/jesslns/Makers_BnB/commit/ad9a9152180c8bbfe5d9dffee2e163c8b08669bf)
This piece of evidence demonstrates me coming in and refactoring someone else's code. The server routing wasn't adhering to RESTful principles so I refactored it to be more RESTful. I am contemplating doing all future RESTful refactors in bed to be more in keeping with the energy of the practice.

#### Black Lit Function
From iteration one to iteration 2 I implemented the role of admin, so had to refactor everything to reflect this. This included refactoring routes, tests and databases. I can't make the repo public but please ask me for more information if you're curious.

### Feedback
* Alice said she thought my implementation of a class for handling SQL requests was good.

* Walkthrough refactoring's became more intuitive, implying that my process is developing in the right direction

#### Sam J on *black lit function* refactoring
>“Sounded like your process of refactoring the tests to implement admin asymmetry was sensible”

>“Separation of concerns on point”


## I have a methodical approach to solving problems<a name="methodical-approach" />
### What does it mean to be able to do this?
Trying to solve a new problem from scratch is very daunting, and can seem impossible if you try it head on. Having a methodical approach simply means you have a system you feel confident in for approaching and overcoming problems.
### Evidence and explanation
#### My System
My system of approaching problems is sort of analagous to TDD, except instead of tests, it's problems. Let the initial problem guide you into breaking it into recursive small problems, until you can start solving your way back up the recursive tree. The main skill in this process isn't solving stuff, but knowing how to break problems down into smaller ones.
![](/readme_images/problemsolving.png)


#### [R P S challenge](https://github.com/punchcafe/rps-challenge/tree/master/lib) (OOP approach)
In OOP methodical problem solving often takes the form of breaking down a system into it's various classes, based on responsibility. SRP is a good way to tackle a problem since you only have to work out how one object does one thing at any one time.
In the Rock Paper Scissors challenge, I had one problem to solve; players need to be able to play Rock, Paper, Scissors in single player or 2-player. In order to do this, I broke down RPS into objects which had a single responsibility; handling a specific aspect of the game. This then meant the problem was broken into something which can run the game and something which can take in player input. This problem was still a little too big, so each problem was broken down further. In the end, the initial problem of *making a RPS game* was broken into:
* A system which can run a game of RPS
    * A system which can track turns
    * A system which can determine a winner from two moves
* A system which can take player input
    * A system to take human input
    * A system to mimic human input

From this, I implemented the `Turn`, `Game`, `Player`, `Computer` classes respectively.
#### [TDDing a kata video](https://www.youtube.com/watch?v=LwrQk8YVEEQ&feature=youtu.be)
This kata shows me TDDing. TDDing is it's own form of methodical problem solving, by breaking the problem down into a series of tests which define success, and working on passing each individually.
#### [Sudoku Solver](https://github.com/punchcafe/SelfStudy/blob/master/Codewars/sudokusolver.rb)
This was pre-makers but still shows my process. The challenge was to build something which can solve a Sudoku board by brute forcing it. I initially broke this down into two problems:
* creating a system that can check if a sudoku board is correct
* creating a system that can brute force every combination of possible solutions to a sudoku problem

This then subsequently broke down into further problems:
* creating a system that can check if a sudoku board is correct
    * Creating a system to iterate through each square in the sudoku board
    * creating a method that can check if a number appears twice in a single row.
    * creating a method that can check if a number appears twice in a single column.
    * creating a method that can check if a number appears twice in a single 9x9 block.
* creating a system that can brute force every combination of possible solutions to a sudoku problem
    * Create a method that can generate all the possible permutations of a single row
        * Create a method to find missing numbers
        * Create a method to generate all possible ordered combinations of those numbers
        * create a method to place each combination of missing numbers back in the original row in the missing spaces.
    * Create a method which can cycle through all possible combinations of all possible row permutations

I was able to make something which worked, but it's far too slow. There's a lot of repetition and processing for combinations which aren't correct. This means there's a new problem: **make a system which can solve a Sudoku board in a reasonable timescale**. As such, in the future I will re-adjust the problem splitting into:
* creating a system that can check if a sudoku board is **partially** correct
* creating a system that can brute force every combination of possible solutions to a sudoku problem **dynamically**.

Using a partial checker to rule out false combinations early, I'll be able to design a combination generating algorithm which doesn't generate *every* combination. This saves time by not generating all the subsequent branches of combinations which are caught early to be false.

#### Zelda games
I'm really good at them.

### Feedback
#### Astrophysics final project
Got a first in my last project due to both reviewers being impressed by my methodical approach to creating an algorithm capable of locating stars in a ccd camera frame.

#### Talk with sam about Sudoku Solver + Bowling Challenge
Got good feedback that my sudoku solving methods were a good approach. Also good feedback on my bowling challenge solution, however he noted it could be more reader friendly.

#### Oyster Card: chapter 14
During the oyster card challenge I ended up doing chapter 14 3 times. However it was a good chance to explain the process of solving touching in and touching out by breaking it down in terms of the objects involved. My confidence solving it also makes me think my methodical approach is on the right track.

# I help my teams succeed<a name="teams-succeed" />

## I use an Agile product development process<a name="agile-process" />
### What does it mean to be able to do this?
If my team uses an Agile process, I’d describe it as pretty similar to being able to evolve. The development process consists of incremental but complete loops; each iteration a functional product, but more complex than the last. Slowly, generation by generation, the process evolves into the final target. This gives us an advantage over non-agile process, because like evolution, we can adapt to the shifting environment. In evolution that shifting environment can be anything from a new predator on the block to a literal shifting environment. In the developer world it’s more along the lines of clients changing their minds, certain parts becoming obsolete, or just generally a change in specification. In the agile process, I have a tree of iterative generations to branch off from if my latest and greatest product version has just been rendered extinct by a meteorite (metaphorically, hopefully.)

In terms of me the individual, It means being able to plan develop and deliver as part of a team in these short plan/sprint cycles. It means being able to use standups, meetings, planning sessions and check-ins with my team to make sure we’re all converging on the same point.
### Evidence and explanation
#### [**Makers BnB week challenge**](https://github.com/jesslns/Makers_BnB)
The purpose of this project was to develop an AirBnB clone in a week with a team of five of us. Our group, Nikhil, Jess, Diptis, Thomas and I worked over the week in alternating roles. On monday we had a meeting to discuss what we wanted to finish with on Friday. Then we had a series of subsequent meetings to decide how much progress we wanted each iteration to make toward that goal. We then split responsibilities into a 3 and 2 man team. During each iteration's development process we would have three standups each day. This enabled everyone to stay pretty in-sync while working separately. We also had mini-seminars when one person implemented a technology the others were unfamiliar with. As a team of full-stack developers (instead of strict roles) it was important that everyone involved understood the technologies being used. Below I've listed links to the commits at each iterative stage. If you're feeling really keen, go ahead and fork, set it up according to the read me and see the different stages.
* [**first iteration**](https://github.com/jesslns/Makers_BnB/commit/39cdf88ab9442c9cb7dbd8a8e8d21354851e6930)
* [**second iteration**](https://github.com/jesslns/Makers_BnB/commit/add0d73f292bac1bb4c904d5e7ae30b1f22a9a94)
* [**third iteration**](https://github.com/jesslns/Makers_BnB) (unfinished as of writing)

#### [**Black Lit Function: Agile approach**](https://github.com/punchcafe/makers_portfolio/blob/master/BlackLitFunction_development_process.md#stage-2-agile-approach)
For this project, I used the agile development process across week long sprints. This was a solo project so there isn't the team-work aspect, but I did find that the week sprints made it easier to time manage while also doing the course.

#### [**Single Page Javascript application**]
Refined week 6's processes by choosing the team track in week 7. We built on the experience of week 6 by solidating certain practices and making things stricter:
- Established the formatting early: how git management would be done, pull request formatting and so on.
- Strict standups 3 times a day, with a slackbot reminder
- Strict formatting of standups to what went well, what went badly, what's next and blockers. Any other dialogs are to be had off-screen.
- Use of *Prettier* linter to keep team code in sync.
- Stack, Ongoing and Completed Trello ticket system.
- Trello card completion had to be accompanied by a formatted pull request
- Planning sessions at the top of each iteration, and clear goal for each iteration detailed.
- Mobbing sessions held in bigger spaces (like the living room), where everyone can be engaged.


### Feedback
* A retrospective with the team and Sam J indicated that we had followed good procedure, as well as gave points to consider for next time.

* Agreement from Nikhil (a reoccurring team mate from week 6) that week 7's changes really improved our workflow.

## I write code that is easy to change<a name="easy-to-change" />
### What does it mean to be able to do this?
Simply, it means that changing bits of code should have a minimal knock-on effect on having
to refactor the rest of it. I imagine that there's a variety of ways to make easy to change code
but for me personally, it's modularisation and abstraction. If I can abstract my code behind function
names, and make different functionalities as encapsulated and modular as possible, I'm on the right track to making code easy to change.

In terms of implications, easy to change code is extremely useful when you are iteratively changing and refactoring code like in TDD or Agile development.

### Evidence and explanation
#### [**A pre-makers project with my old company**](https://github.com/punchcafe/project001)
I'll start with an example of a project I did a few years back with an old boss in japan. This is **not** a good example. Instead I want to reflect on how I've gotten a better hold on these concepts by looking at pre-Makers work. The functionality here is fine, and it *is* pretty modular, but if you actually look at it it's one nightmarish pipeline of module to module to module. You always need prior knowledge of the format the module you import is going to spit out, and it's not intuitive based on the names. There's going to be a strong ripple on effect if I change even one stepping stone in the pipeline of horrors.
#### [**Takeaway Challenge**](https://github.com/punchcafe/takeaway-challenge/tree/master/lib)
(This link refers to the Model, not the entire repo.)This example is the week 2 weekend challenge. This was after being exposed to some of the concepts which make code easier to change. The responsibilities are encapsulated into classes, meaning the only dependencies between them are the abstracted interactions. As a result of encapsulation, the modularisation is pretty strong, meaning if I need to change internal aspects of one class, the subsequent need to refactor shouldn't be massive.
#### [**Rock, Paper, Scissors webapp**](https://github.com/punchcafe/rps-challenge/tree/master/lib)
(This link refers to the Model, not the entire repo.) Everything is separated into encapsulated and concise classes, and there's strong SRP. There's one method which is 10 lines long but the rest are abstracted into short 5 lines or under methods.
### Feedback
#### Feedback from Jess
I asked Jess for feedback on whether or not I wrote code which was *easy to change* during out week 6 project.
>I didnt really "change" your code. Your code is very readable, well structured, easy to to understand/follow, which makes the transition of roles easy :). I also like how you seperate the navbar into another erb, which helps making the index.erb very programmar/teammate-friendly!
although i didnt change your code, the structure, i.e. codes are refactored, encapsulated, readable, I would feel comfortable if I would have to change anything in the future!

#### Feedback from Tom
>I didn't really change your code, more used your code from which to write new code
>But doing that was very straightforward and clear
So maybe not the same question, but to the above, I would say yes :thumbsup:

## I can justify the way I work in a business context<a name="buisness-context" />
### What does it mean to be able to do this?
It means you can clearly communicate to the team around you *why* you are going to implement something, or why you're approaching a problem a certain way. It's vital in terms of the cohesion of a team. If I can't justify what I'm doing to you, I can't expect you to be able to build off of it.
### Evidence and explanation
#### [Makers BNB - active record](https://github.com/jesslns/Makers_BnB/commit/1a85c3ac974db579a6e72064401e7acb5c198b9b)
The link above is to a commit where a team member implemented a new feature off groundwork I had done initially. During the Makers B&B clone challenge, I guided the team to using in active record. I initially planned the architecture of the Database, while keeping in mind the direction I expected it to grow. Going through this planning session with the team, I diagrammed the flow and then made sure everyone grasped what I intended to do. After implementing the Database and connecting it to the application through active record, the group met for a 20-30 minute session where I demonstrated how Active Record worked, and how it fit in to the landscape of the project we were all working on. For the 3rd agile iteration of our application, I moved to front end development, and team members who had until this project not touched active record set off to implement the remaining Database functionality. I feel this ability for them to go off an continue implementing what I had started is strong evidence for me being able to justify myself.
#### [Makers BNB - RESTful routes](https://github.com/jesslns/Makers_BnB/commit/ad9a9152180c8bbfe5d9dffee2e163c8b08669bf)
The link above refers to a commit where I refactor our sinatra app's routes to be more restful. A few of my team members had missed week 4's details on restful routes, so before implemting it on our project the group gathered for a quick 10 minute white boarding session. During this session I explained the principles behind RESTful routes, and why they are adopted. Then I explained how we would implement them in our project. We spent some time discussing what this meant for us, why we are going to do it, and *how*. Once everyone felt comfortable, we went ahead and made changes.

#### [Single Page Java Application: Mobbing sessions](https://github.com/makerlonerangers/)

* [Screen recording of Mobbing session](https://drive.google.com/file/d/1kujNVuzB6Vb9HSoevwkq3xIdHDE4UwUY/view)

During this team project, we did a *lot* more mobbing and pairing than in the BnB exercise. I rarely drove throughout the project, but helped implement various features, including the interactive vanilla JS front end functionality. To be able to do this from a back seat position while working collaboratively requires everyone to be on the same page about what you're asking the driver to implement. The mobbing sessions require being able to explain and justify what you want to implement to your team before not even *you* implements it, meaning it needs to be reasonable and eloquent.

### Feedback

#### Diptis' Feedback
>I really appreciated the coaching sessions you gave to us all on RESTful APIs and Active Record. This proved to me your deep understanding on the topics such that you can confidently explain it and answer all our follow-up questions.

>I really benefited from our pairing sessions and watching you build up the navbar was insightful. When I was actually doing some coding later on I found your advice to be excellent, guiding me to a solution and refactoring to improve on that.


## I can grow collaboratively<a name="grow-collaboratively" />

### What does it mean to be able to do this?
This one's a little long winded but bare with me. Everyone is unique, and develops their technical ability in different ways and at different paces. Sometimes I think there's a idea that you are as good as *your* ability. In reality, single people don't build huge things, teams do. As such it's not how good you are, but how good you are as part of your *team*. Being able to grow collaboratively is about understanding that great coders don't make a great team. If I can grow collaboratively it means I can make the effort to understand myself and the people around me. With this understanding, I can continually work on developing myself so that the team I'm part of is it's best possible self.
### Evidence and explanation
#### Makers BnB
* I realised I could apply my teaching experience to give short demonstrations in front of white boards for getting my team on the same page with tech they were uncertain of.
* On day 3 asked everyone what their personal goals were for the week, to make sure we were going at the right pace and allocating the right work.
* My balance with Nikhil worked exceptionally well. To follow the DISC definitions, for the first few days I took a more D approach, while Nikhil was a confident S. A mutual respect enabled me to be quite driven, but knowing he had my back in ensuring our team mates weren't falling through the cracks.
What was interesting was that usually when I assume a D role, a certain amount of that pace and forward motion gets lost while profusely making sure everyone is in agreement. When working with Nikhil, I was able to let myself loose a little more, knowing he was there to catch it for me.
* Regularly asked people for feedback on how I was as a team member. I tried to foster a totally honest no-holds barred tell me anything environment.
#### Single Page application
* Much more goal-oriented group, with similar skill levels to my own. Got to experience team dynamics where everyone is driven to make something.
* Changed my teaching/guider approach and worked to more strict standards.
* Using the projector and a mystery science theatre approach, learned really good mobbing practices where the team is much more involved.
* Learnt from the frustration of mob debugging that it's not for me. So much of debugging is following your own flow and deductions that mobbing is actually very counter productive. Instead, I developed a new rule of thumb that a new bug while mobbing is timeboxed to 5 minutes, after which everyone clones the repo and works separately.


### Feedback
#### Diptis' feedback
>I loved the enthusiasm, drive and vision you brought from the first moment on the project and that continued throughout.
I really appreciated the coaching sessions you gave to us all on RESTful APIs and Active Record. This proved to me your deep understanding on the topics such that you can confidently explain it and answer all our follow-up questions.
You had the awareness of respecting the optimal project team dynamics and taking a step back from being the leader at the important time when we needed to map out the business logic. That was a crucial meeting which benefited the project and the teamwork.
I really benefited from our pairing sessions and watching you build up the navbar was insightful. When I was actually doing some coding later on I found your advice to be excellent, guiding me to a solution and refactoring to improve on that.
On a personal level, I really enjoyed our non-work chats. Always growth mindset in effect when I talk with you dude! :smiley::man_city:

>OK  enough of the smoke up the bottom - one thing I'll say as constructive feedback, in the context of this task and regarding the front-end, I realise you wanted to test new CSS stuff and make buttons revel on mouseover etc..,   but that needs to be countered against the need of the project and other priorities    i.e.  get the thing to basically work with simple UI, make it pretty later and discuss with us if something should be done.
All cool though  open sandwich finished :) :man_city:  :butterfly:

The last bit of Diptis' feedback is really helpful, as it's something to take into future teams.

#### Nikhil's feedback

>Working with you on MakersBnB was a pleasure. You were self aware enough from the beginning to give us the instruction manual for how to best work with you. It was also really good to have you jumping into the leadership position and guiding the project along. Even the fact that you addressed the individual goals of people in the team and changed the plans to reflect that shows a great deal of self-awareness. It was a shame not to have paired with you!

# I am equipped for long term growth<a name="long-term" />

## I manage my own wellbeing<a name="well-being" />
### What does it mean to be able to do this?
For this one, I'm going to answer entirely from a subjective perspective. As Dana says,
if it works for you then it works. For me, being able to manage my own wellbeing means balance. Checking in with oneself to make sure you're aware of when you're careening towards being overwhelmed or burnt out. For me specifically, I have a tendency to get lost in a project where it begins to be all I think about and all I want to focus on. Putting the project down for a day, or leaving it an incomplete point was often a source of anxiety.
### Evidence and explanation

#### Strict weekend challenge work hours
Knowing what I'm like, I chose to try adopting a strict stance from week one that I would only allow myself one working day to work on the weekend challenge. Initially this felt very uncomfortable, as I didn't like turning in work I thought I could improve upon. I realised going forward however, that these weekend challenges are a war of attrition. Since it's a new project every weekend, It becomes apparent that if you take an "I'll just finish this project and *then* rest" approach, you'll burn out really quickly. Sticking to this strict one-day rule evidences (to me at least) that I have become comfortable setting down the incomplete to create balance in my outside-work-life.
#### Seeking help when needed
When I was getting overwhelmed by something, I reached out to Dana to talk about it. I don't want to go into more detail than that.


### Feedback
#### A chat with a dev friend which validated my approach
>**Punch Cafe [10:42 AM]**
yeah
its weird i really need downtime sometimes to let my brain reset
otherwise i get all fuzzy and spaced out

>**monolithic-adam [10:44 AM]**
Don’t worry it happens to the best of us. All you can do is relax and allow your brain to reset.
If you ever work for a place that doesn’t allow that run for the hills

#### Chat With Dana
Re-iterated I was doing OK, and these systems were working for me.

## I can learn anything by myself<a name="learn-anything" />
### What does it mean to be able to do this?
I'd say being able to learn anything means you're equipped with two things; a systematic
approach to learning the unknown and the knowledge that learning something is an exponential
process. With these two things, you can confidently set out to learn *anything*, from machine code to yoga.

### Evidence and explanation
#### [My *Learn Anything* Process](https://github.com/punchcafe/makers_portfolio/blob/master/learn_anything_process.md)
Take a look! I document my general approach to learning anything. Please read it, I wrote it specifically for this. Don't let my efforts be in vain. Oh please god.
#### [Week 5 Thermostat Challenge](https://github.com/punchcafe/js_thermostat)
Week 5's challenge revolved around learning JavaScript from scratch. By the end of the week I had made a working thermostat (albeit visually disgusting). It's decent evidence of the learning process in action.
#### Japanese Proficiency N3
  This was one of my first experiences teaching myself something from scratch. I employed the methods above and over a couple of years managed to get to an OK level. While it's not coding-relevant, the
  experience has given me hindsight which carries over to learning anything new. I think the first thing you really learn from scratch off your own volition is an massive milestone for everyone. Learning anything, methodical approach or not, takes a lot of time. That's why your first *win* gives you the patience and confidence your efforts will pay off in subsequent endeavours.
### Feedback
I think feedback for this is a little unique, as really good feedback for this skill is being able to do something you couldn't before, as opposed to someone saying you've gotten better. Here I've specified personal feedback which indicates to me I can learn anything.
* The concept of learning a new language, concept or whatever is no longer daunting. Rather, it's exciting.
* Being able to help successfully debug Javascript in group situations served as strong feedback to indicate my process was helping me assimilate JavaScript into being instinctive understanding.
* Being able to speak to My old host family in japan after 6 years. (I stayed with them on an exchange when I was 18 and at the time couldn't speak any Japanese.)
