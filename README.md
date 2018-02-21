Test.ai Dashboard Concept
=========================
Hey there! Chances are, if you're reading this, you're a member of the [Test.ai](https://test.ai) team, seeing those are 
the primary people this repo is meant for. If you're just another developer checking out my recent GitHub activity,
you can just go ahead and skip over this repo. I promise you it's nothing too exciting, just a static dashboard concept.

Now if you *are* a member of the Test.ai team, then you're in the right place! You know exactly why you're here! This 
README isn't much, but let's dive in anyway.

## Before We Begin
You'll notice there aren't a ton of build steps here. That's not because I thought this site didn't need them, or that 
they shouldn't be required or whatnot, it was only due to the fact that I was trying to get this site up and running as 
fast as I could. I contemplated building this site like my last project, all in [React](https://reactjs.org/), with JSX classes for each screen element,
all rendered on the server-side, with gzip compression on Babel-transpiled, uglified ES6 code. I personally would 
have *loved* to do this approach, as I always try to strive for tiny, performant web apps. However, my last project took longer than I 
would have liked as a result of taking that route, mostly because I needed to come up with the best way to structure the 
application given what was handed to me, and making the right decision takes time. Also, between setting up Webpack,
Babel, React, Express... well, it takes awhile.

SO, how did I structure this application? Very similar to how I built my brother's website, actually 
([https://conornickerson.com](https://conornickerson.com)). This app uses the [Harp server](harpjs.com) middleware to transpile
CoffeeScript and SASS in real-time on an Express server. I was going to go full-ES6, but seeing it's not transpiled and I'm not 100% sure  
which ES6 features are currently supported by which browsers, I played it safe and wrote CoffeeScript instead. 

As you can probably imagine, I used Harp on my brother's site because he kept insisting on being able to update the site himself
and there was *no way* I was about to try educating a music student on how to compile SASS code by himself. It was tough enough just
trying to teach him how to write proper JSON and CSS. Anyway, in this case, I used it because it saved me from needing 
to implement a separate build system and have a ludicrous amount of dependencies.

In lieu of React this site uses [Vue](https://vuejs.org/), as it does *not* require compilation of any kind. 
While I have not worked with Vue extensively, in this scenario I felt it was a necessary trade-off if I still wanted to 
maintain a component-based infrastructure. To keep things simple, this site also does not use any advanced Vue tools 
such as the [VueX](https://github.com/vuejs/vuex) state management library.

Also, you'll notice this repo has very few commits. It's not that I don't use Git, or only dump huge changes in my Git 
repos, it's just that I forgot to set up Git before starting this project and by the time I finished it was too late. 
If you need a better idea of my Git commit practices just have a look at [my other repos](https://github.com/Nickersoft).

## Directory Structure
This is pretty self-explanatory, but just to have a formal write-up:

Everything you need is in the `src` directory.

- `public` contains everything that will be accessible after the base '/' in the domain
    - `css` contains all SASS styles
        - `components` contains all SASS styles specifically for Vue components or other page elements
        - `util` contains utility SASS code such as mixins, variables, and color scheming
    - `img` contains all images, though there are so few in this repo they aren't organized into sub-directories
- `views` contains [pug](https://pugjs.org/) templates (only one in this repo, actually)        

## Developing This Site
This site uses [nodemon](https://github.com/remy/nodemon) to run a file-watching Node instance, such just run:

```bash
$ npm run dev 
```

The server outputs this info anyway, but just in case you don't like surprises, the server runs on port 3000 
and can be accessed at [localhost:3000](localhost:3000).

## Deploying This Site
Seeing there's no real build step, to deploy (in this case meaning to run in just plain ol' Node), just run:

```bash
$ npm start
```

The server port is the same.

## Docker
The actual site is deployed via Docker, and thus contains a Dockerfile. To build the image, just run:

```bash
$ docker build -t testai .
```

And to run it:

```bash
$ docker run --name testai -p 3000:3000 -d testai
```

