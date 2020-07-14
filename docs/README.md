# Delta Reporter Documentation

Docs available here: https://delta-reporter.github.io/delta-reporter/
We are using `GitHub Pages` to host our docs + `mkdocs-material` markdown for the look and feel https://squidfunk.github.io/mkdocs-material/getting-started/

## How to make changes to the docs:

To make changes to the docs, clone the repo on your local, checkout the `master` branch. Then make required changes in the /docs folder: 
index.md - is a homepage file
You can create new files in this folder if you wish to have a new section on the docs tree. Just add a file with .md extension and it should work. 
You can also update existing files.


### How to push the changes live:
 
 All docs changes are pushed to `gh-pages` branch, which then is used for retrieving the data.
 
 1) Install mkdocs on your local by running `pip3 install mkdocs` and `pip3 install mkdocs-material` 

 2) In the root folder run `mkdocs build`, then `mkdocs gh-deploy -t material`. It will ask you to authenticate using GitHub, as it needs to push changes to gh-pages branch. Use your git username and auth token to login.

Behind the scenes, MkDocs will build your docs and use the ghp-import tool to commit them to the gh-pages branch and push the `gh-pages` branch to GitHub.
More info here: https://www.mkdocs.org/user-guide/deploying-your-docs/#github-pages


*NOTE*, It takes few minutes for the docs to update. 
All your changes will be visible on https://delta-reporter.github.io/delta-reporter/ in a minute. All code changes are pushed automatically and stored on `gh-pages` branch.

3) You will also need to push your changes to `master` branch yourself, so that next person who clones the repo has the updated docs version.

### How to make changes to docs config

These docs are served by Github Pages and is configurable in delta-reporter repo -> Settings -> GitHub Pages section 