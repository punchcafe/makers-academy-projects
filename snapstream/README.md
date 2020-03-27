# SnapStream
**For when Instagram just isn't hipster enough**


An instagram clone made as coursework for the Makers Academy bootcamp.


## Getting Started
#### Pre-requisites 
- You'll need to be running a local postgresql server before getting started.
- You'll need Ruby, [RubyGems](https://rubygems.org/) and [Bundler](https://bundler.io/).
#### Set up
Run:
```
> $ bundle install
> $ rails db:create
> $ rails db:migrate
```
Start a server with:
```
> $ rails server
```

## Notes
- On deployment, this repo is linked to temporary storage. When using cloud services like Heroku, this means every time your dyno goes to sleep, any uploaded photos will be lost.
