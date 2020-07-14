# Delta Reporter Documentation

Admin Panel: https://github.com/delta-reporter/delta-reporter/settings (GitHub Pages) section

### How to make changes to the docs:

To make changes to the docs, clone the repo on your local, make your changes in the /docs folder. 

### How to push changes to Github Pages:
 
 All docs changes are pushed to `gh-pages` branch, which then is used for retrieving the data.
 
 Install mkdocs on your local by running `pip3 install mkdocs` and `pip3 install mkdocs-material` 

 In the root folder run `mkdocs build`, then `mkdocs gh-deploy -t material`. It will ask you to authenticate using GitHub, as it needs to push changes to gh-pages branch. Use your git username and auth token to login.

Behind the scenes, MkDocs will build your docs and use the ghp-import tool to commit them to the gh-pages branch and push the `gh-pages` branch to GitHub.
More info here: https://www.mkdocs.org/user-guide/deploying-your-docs/#github-pages


All your changes will be visible on https://delta-reporter.github.io/delta-reporter/ in a minute. All code changes are stored on `gh-pages` branch.
You will also need to push your changes to master, so that next person who clones the repo has the updated docs version.


## How to edit the documentation (local development):

- To build the doc on your local run `mkdocs serve` and go to http://localhost:8000/ 

- To edit the pages go to /docs, the homepage is index.md


* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.