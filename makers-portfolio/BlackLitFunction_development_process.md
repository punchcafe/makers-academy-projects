### Foreword
This was a project undertaken in week 5 of the Makers Course. After doing the bookmark manager week
challenge, I realised I had all the resources necessary to build a website for a
friend who co-hosts a podcast, *Black Lit Function*. By week 5, we've already been
taught the majority of the new skills we're guided to learn at Makers, so I thought
it would be a good opportunity to consolidate on those skills, and document the process.
### Sinatra over Rails
As of writing this, I have only had exposure to Sinatra. Since the scope of this application
is fairly small, I felt comfortable using Sinatra. I didn't want this project to push me to
learn new things, as the Makers course already provides enough opportunity for that. Rather,
I wanted a project to give me an opportunity to put into practice all the concepts students
have been introduced to as one cohesive portfolio piece, while simultaneously making a website
for some people doing some cool work.
## Stage 0: client discussion and user stories
After a few skype sessions, the *Black Lit Function* podcast cohost (who from now I'll just
call the co-host) settled on these user stories.

```
As a fan,
  So I am able to enjoy my favourite podcast,
I want to see all available podcast episodes.

As a fan,
  So I can geek out,
I want to be able to buy my favourite podcast's merchandise

As a fan,
  so i can listen on my favourite platforms
I want to be able to click a sound cloud spotify link on episodes

As a fan,
  So I can understand my favourite podcast,
I want to be able to read a mission statement

As a fan,
  So i can make recommendations to my favourite podcast hosts,
I want to be able to get contact information from a specific page.

As a creator,
  So I can share new content
I want to upload new podcast details

As a creator,
  So I can update information,
I want to be able to overwrite information.

As a creator,
  So I know my information is safe,
I want to make sure my data is safely protected
```
## Stage 1: Tech
Following the model of the Bookmark editor challenge, I decided to use tech which
I was familiar with. Again, rather than not wanting to learn something new this was
so I could really consolidate what I knew.

- **app**: Ruby/Sinatra
- **testing**: Rspec/Capybara
- **Database**: Postgresql
- **ORM**: Active Record
- **hosting**: Heroku

## Stage 2: AGILE approach
As this project is to be undertaken in free time between the course, I thought it would
be good to make week long sprints where I implement different iterations. It's a little bit
longer but it means I can pace myself better, as well as potentially implement new tech
learned further on the course.

Currently, the planned iterations are:
```
Iteration one:
  free for all crud capable web application *
Iteration two:
  Admin portal for application crud management
Iteration three:
  Pretty admin portal
Iteration four:
  Pretty consumer side
```
Iterations with a `*` at the end indicate that the iteration has been completed as of
the time of writing.

#### `Iteration one`
Since I don't want to expose the architecture, I can't show too much of development here.
That being said, please feel free to ask if you want to see the repo!

I started by setting up the various environments, then writing the very first feature
test. This was a TDD top down approach using capybara.

```ruby
feature 'See episodes' do

  scenario 'user can see episode title' do
    visit('/')
    expect(page).to have_content('Here is Episode Zero of our podcast where we')
  end

  scenario 'have link to spotify'
  scenario 'have link to soundcloud'

  scenario "has episode description"

end
```
That led to setting up the database, and linking it to Postgresql, and active record.
Before I could green light this test I had to unit test in an `Episode` class. That test
looked like

```ruby
describe Episode do
  before (:each) do
    database_wiper
  end
  it 'can create an episode object' do
    episode = Episode.new(
      imageurl: "http://someimage",
      body: "description of the episode",
      spotify: "http://www.spotifylink.com",
      soundcloud: "http://www.soundcloud.com",
      tags: ":sci-fi, :horror",
      authorid: "1"
    )
    expect(episode).to be_kind_of(Episode)
  end
  it 'can persist episode object' do
    episode = Episode.create(
      imageurl: "http://someimage",
      body: "description of the episode",
      spotify: "http://www.spotifylink.com",
      soundcloud: "http://www.soundcloud.com",
      tags: ":sci-fi, :horror",
      authorid: "1"
    )
    expect(Episode.all).to include(episode)
  end
end
```
This class has an external dependency (active record), which I chose not to stub.
During the bookmark manager challenge, I did stub all database helper module dependencies.
I spoke to one of the coaches, Alice, about this. She reasoned that while usually you
want to stub external dependencies, in this case the `Episode` class is the only way to
test the functionality of our database. As such it's probably better to make an exception.
After thinking about this I agreed with her, and as such it's not stubbed here. It is,
however, abstracted. As such I think it's fair to say that it becomes a vital test
of the whole application. If I choose to use a different ORM for example, my tests are
still testing fundamental database interactions of my ruby application.

Anyway, commit history proceeds like this in Red Green Refactor steps, (unless the
problem is too big to be solved without introducing new aspects and thus new tests).
If you'd like to see, please let me know!

By the end of week 5, the first iteration of a very simple CRUD web application was complete:

INSERT IMAGE
