# CI\CD configuration

You can use Delta Reporter with any CI\CD tool in the market.

All you need is to follow this process:

1. Create a launch in Delta Reporter, and store its id as the environment variable `DELTA_LAUNCH_ID`
2. Run your tests! `DELTA_LAUNCH_ID` will be read by any Delta Reporter client available (Unit tests, Integration, End to End). And the results for each one, are going to be saved as a test run for the same launch.
3. When all your tests have finished, terminate the launch


## Jenkins Example

In the job running a set of specific tests, you will have to define `DELTA_LAUNCH_ID` as a parameter, this way you can pass the same `DELTA_LAUNCH_ID` to several upstream jobs running tests.


Then inside your stage you will need to initialize `DELTA_LAUNCH_ID` by calling a `/api/v1/launch` endpoint by POST, then running your tests with `DELTA_LAUNCH_ID=${DELTA_LAUNCH_ID}` pre-pending. The initialization is done once, so when you are running multiple test types in the same build (say, UI tests, API tests, Unit tests), those tests are gathered under one "Launch" on Delta Reporter.

At the end, we call `/api/v1/finish_launch` to finish the launch and end the process.

Below is an example of code for config file for Jenkins job:

```groovy
// ...
  parameters {
      string defaultValue: '', description: 'Launch ID sent by a pipeline, leave it blank', name: 'DELTA_LAUNCH_ID', trim: false
  }

// ...

  stage('Run WDIO tests') {
    environment {
      DELTA_LAUNCH_ID = ""
    }
    steps {
      container('jenkins-node-worker') {
        script {
          try {
            DELTA_LAUNCH_ID=sh(script: "curl -s --header \"Content-Type: application/json\" --request POST --data '{\"name\": \"${JOB_NAME} | ${BUILD_NUMBER} | Wdio Tests\", \"project\": \"Your project\"}' https://delta-core-url/api/v1/launch | python -c 'import sys, json; print(json.load(sys.stdin)[\"id\"])';", returnStdout: true)
          } catch (Exception e) {
              echo 'Couldn\'t start launch on Delta Reporter: ' + e
          }
          
          sh "DELTA_LAUNCH_ID=${DELTA_LAUNCH_ID} TEST_TYPE='Frontend Acceptance Tests' ./node_modules/.bin/wdio ./wdio.conf.js"
        }
      }
    }
    post {
      always {
        container('jenkins-node-worker') {
          script {
            try {
              // Finish launch on Delta Reporter
              sh "curl -s --header \"Content-Type: application/json\" --request PUT --data '{\"launch_id\": ${LEGACY_DELTA_LAUNCH_ID}}' https://delta-core-url/api/v1/finish_launch"
            } catch (Exception e) {
              echo 'Couldn\'t finish launch on Delta Reporter for legacy: ' + e
            }
          }
        }
      }
    }  
  }
```

## Github Actions Example


Below is an example of code for a Github Action:

```yaml
name: Delta Reporter Launch Demo
jobs:
  tests:
    name: Tests
    steps:
    - name: Create Delta Launch
      id: delta_launch_creation
      run: |
        DELTA_LAUNCH_ID=$(curl -s --header "Content-Type: application/json" --request POST --data '{"name": "Demo Launch '"${GITHUB_SHA:0:7}"'", "project": "Delta Reporter"}' https://delta-core-url/api/v1/launch | python -c 'import sys, json; print(json.load(sys.stdin)["id"])';)
        echo $DELTA_LAUNCH_ID
        echo ::set-output name=delta_launch_id::${DELTA_LAUNCH_ID}
    - name: Notify test results
      uses: actions/github-script@v4
      env:
        DELTA_LAUNCH_ID: ${{ steps.delta_launch_creation.outputs.delta_launch_id }}
      with:
        script: |
          github.issues.createComment({
                issue_number: context.issue.number,
                owner: context.repo.owner,
                repo: context.repo.repo,
                body: `Launch ${process.env.DELTA_LAUNCH_ID} has started, check tests results in real time [here](https://delta-core-url/testruns/${process.env.DELTA_LAUNCH_ID})`
              })
    - name: Run tests
      env:
        DELTA_LAUNCH_ID: ${{ steps.delta_launch_creation.outputs.delta_launch_id }}
      run: |
        echo "DELTA LAUNCH ID $DELTA_LAUNCH_ID"
        DELTA_LAUNCH_ID=${DELTA_LAUNCH_ID} ./vendor/bin/phpunit
        echo "Exit code $?"
    - name: Finish test launch
      env:
        DELTA_LAUNCH_ID: ${{ steps.delta_launch_creation.outputs.delta_launch_id }}
      run: |
        curl -s --header "Content-Type: application/json" --request PUT --data '{"launch_id": ${DELTA_LAUNCH_ID}}' https://delta-core-url/api/v1/finish_launch
```
