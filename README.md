# Common Lisp on Heroku -- Example Project

This project is an example of how to use the [Heroku Common Lisp Buildpack](https://github.com/mtravers/heroku-buildpack-cl).  See the buildpack repository for more information and credits.

### This is the Hunchentoot branch.

## Instructions:
First, get yourself set up with a [Heroku account and tools](http://devcenter.heroku.com/articles/quickstart).

Then [fork this project](/mtravers/heroku-cl-example/fork_select) (and optionally modify it with your own content).

Next, create your own Heroku application using CL Buildpack:

    heroku create -s cedar --buildpack http://github.com/mtravers/heroku-buildpack-cl.git

And deploy:

    git push heroku

That's it!

## More details:

There are currently 2 branches. *Master* has Huchentoot specific code and *aserve* has AllegroServe specific code.
Currently https://github.com/jsmpereira/heroku-buildpack-cl let's you run Hunchentoot with SBCL and CCL and AllegroServe(portableaserve) with CCL.

There is a pending issue with [acl-compat](https://github.com/mtravers/portableaserve/tree/master/acl-compat) bundled with portableaserve preventing use with SBCL. Look [here](https://github.com/mtravers/wuwei/issues/10) for more information.

The file heroku-setup.lisp gets loaded at compile time, and needs to load any Lisp files or packages required.

Thanks to [Mike Travers](https://github.com/mtravers) for getting Common Lisp on Heroku.
