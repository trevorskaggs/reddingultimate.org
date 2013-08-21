reddingultimate.org
===================

This project is the website for the Redding Ultimate Association, hosted at reddingultimate.org.
The site is built with [Nesta](http://netstacms.org) and is hosted on [Heroku]().
For now, if you want to update the site you'll have to go through Pete, as **gadomski/reddingultimate.org** is the canonical source for the Heroku site.
In the future, if we need to, we can migrate the owner to an organization.


Making Changes
--------------

Please feel free [fork]() this site and open up a [pull requestt]() with any changes.
Pete will review them and push them up as soon as possible.

To run a local copy of the the site, you'll need to install Nesta per the instructions [on their site]() and clone a copy of the repo to your system.
Once you've got the code, you'll need to initialize and update the submodules and then start the server:

```bash
git submodule update --init
shotgun config.ru
```

You will then be able to access your local copy at http://localhost:9393.


Questions? Comments? Concerns?
------------------------------

Just email Pete and he can s help sort you out.