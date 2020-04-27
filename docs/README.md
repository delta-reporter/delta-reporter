# Delta Reporter Documentation

Admin Panel: https://github.com/delta-reporter/delta-reporter/settings (GitHub Pages) section

### How to push changes to Github Pages:
 
 Run `mkdocs gh-deploy -t material`

Behind the scenes, MkDocs will build your docs and use the ghp-import tool to commit them to the gh-pages branch and push the `gh-pages` branch to GitHub.
More info here: https://www.mkdocs.org/user-guide/deploying-your-docs/#github-pages


## ReadTheDocs 

https://delta-reporter.readthedocs.io/en/latest/

Admin panel: https://readthedocs.org/projects/delta-reporter/


## How to edit the documentation (local development):

- To build the doc on your local run `mkdocs serve` and go to http://localhost:8000/ 

- To edit the pages go to /docs, the homepage is index.md


* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.