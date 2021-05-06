# Kranocyte heroku of all cells
This repo contains the trigger files for heroku to show several datasets [here](https://kranos-sub.herokuapp.com/).

## How to build the app
In case you want to build this app from scratch or another one based on these files, you need to do the following.

1. First, you need to create an account in heroku, and create an app. Get this app name because you'll need it later. In this case, the name of the app is `kranos-sub`.
2. In the local repo, do `heroku login`.
3. Since we are running a container, we'll set the stack from `heroku-20` (default) to `container`: `heroku stack:set container`. This is **important** because otherwise we won't build the app.
4. Do `git add` and `git commit` to the files you want. In this case **it is necessary to add** `Dockerfile` and `heroku.yml`.
  * `Dockerfile` will create the container from which the app will be launched.
  * `heroku.yml` runs the commands to create the app. The commands are run on the container built before. 

From this part you can follow in two ways.

### Use heroku as remote
To push the changes you can create a heroku remote, and push the changes.

5. `heroku git:remote -a <APPNAME>`. In this case, it is `heroku git:remote -a kranos-sub`.
6. `git push heroku master` (or the name of the branch)

### Use github as remote
5. First, link the remote to github: `git remote add origin <REMOTE GIT>`.
6. Then, push `git push origin master`.
7. To build the app in heroku, you'll need to set a connection between heroku and github. To do that, on the `Deploy` tab of your project, in `Deployment method` select *GitHub* and connect the app to the repo. With that, each time you push in GitHub Heorku will build your app.

This option is handy because you can keep only the GitHub remote instead of having to push to Heroku and GitHub.

## Building and testing the app
The first the is to build the container based on `Dockerfile`. You can see the building process with `heroku logs`, or in the `Activity` tab in the app.

Once the container is built, the contents in the `heroku.yml` file are run, and the app should be visible. 

## Running commands in the container/app
Sometimes the commands from `heroku.yml` give errors, and the app is not built. Instead of making small changes to the `heroku.yml` file and building each change from scratch, you can test the commands from the console by running `heroku run <COMMAND>`, or going to `More > Run console` in the web.
