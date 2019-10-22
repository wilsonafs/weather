# Weatther

This project was created to perform API tests.


## Tools

This project was developed using cucumber to create executable specifications; HTTparty, which is written in the Ruby programming language, to call the HTTP requests; rspec, Dsl testing tool written in Ruby to test Ruby code and a gem set, to mange and suport all the developing.

## Project's Structure

```
Project
├── features
│   ├── specs
│   │   └── BDD
│   ├── step_definitions
│   │   └── Tests
│   └──suport
│       └── env.rb
├── .gitignore
├── Gemfile
├── Gemfile.lock
└── README.md
```

## Requirements

```
$ sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev  
```

Você precisará ter os itens instalados em sua maquina:  

[ruby](https://www.ruby-lang.org/pt/documentation/installation/)  
[bundle](https://bundler.io/)  


## Installation

Install all of the required gems from your specified sources.

```
$ bundle  
```
It is possible to find some problems installing the gem set, in this case, separately install the gem with trouble and back to bundle command.

## Running the tests

You can run the tests any time. All you need to do is:
```
$ cucumber                                           
```

The cucumber command perform every test in your project at once.

If you want to run a specific test, run:

```
$ cucumber -t @createdtag                             
````

Note: createdtag is the given name to your test suite. Example: @smoke.