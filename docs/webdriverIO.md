# WebdriverIO Plugin

> A WebdriverIO reporter plugin to create [Delta reports](https://github.com/delta-reporter/delta-reporter)


## Installation


The easiest way is to keep `@delta-reporter/wdio-delta-reporter-service` as a devDependency in your `package.json`.

```json
{
  "devDependencies": {
    "@delta-reporter/wdio-delta-reporter-service": "^1.1.1",
  }
}
```

You can simple do it by:

```bash
npm i @delta-reporter/wdio-delta-reporter-service
```

## Configuration


Delta reporter WebdriverIO plugin consists of a mix between a [WebdriverIO Service](https://github.com/webdriverio/webdriverio/tree/master/packages/webdriverio) and [Reporter](https://github.com/webdriverio/webdriverio/tree/master/packages/wdio-reporter), so it needs to be declared as a reporter and as a service in config file.


```js
const DeltaReporter = require('@delta-reporter/wdio-delta-reporter-service/lib/src/reporter');
const DeltaService = require("@delta-reporter/wdio-delta-reporter-service");

let delta_config = {
  host: 'delta_host',
  project: 'Project Name',
  testType: 'Test Type'
};

exports.config = {
  // ...
  reporters: [
    [DeltaReporter, delta_config]
  ],
  // ...
  services: [new DeltaService(delta_config)],
  // ...
}
```


## Add screenshots and videos

Screenshots can be attached to the report by using the `sendFileToTest` command in afterTest hook in wdio config file. The parameters are `type`, `file` and `description`:
- `type`: Can be `img` or `video`
- `file`: Path to the file to be uploaded
- `description`: Optional value that will be displayed in the media container in Delta Reporter


As shown in the example above, when this function is called, adn the test is failing, a screenshot image will be attached to the Delta report.


```js
 afterTest(test) {
    if (test.passed === false) {
      const file_name = 'screenshot.png';
      const outputFile = path.join(__dirname, file_name);

      browser.saveScreenshot(outputFile);
      browser.sendFileToTest('img', outputFile);
    }
  }
```


Below is an example of all pieces needed in wdio config file to use this plugin along with [Video Reporter](https://github.com/presidenten/wdio-video-reporter), so that Delta Reporter is showing screenshots and videos of failed tests:



```js
var path = require('path');
const fs = require('fs');
const video = require('wdio-video-reporter');
const DeltaReporter = require('@delta-reporter/wdio-delta-reporter-service/lib/src/reporter');
const DeltaService = require("@delta-reporter/wdio-delta-reporter-service");

// ...

function getLatestFile({ directory, extension }, callback) {
  fs.readdir(directory, (_, dirlist) => {
    const latest = dirlist
      .map(_path => ({ stat: fs.lstatSync(path.join(directory, _path)), dir: _path }))
      .filter(_path => _path.stat.isFile())
      .filter(_path => (extension ? _path.dir.endsWith(`.${extension}`) : 1))
      .sort((a, b) => b.stat.mtime - a.stat.mtime)
      .map(_path => _path.dir);
    callback(directory + '/' + latest[0]);
  });
}

let delta_config = {
  host: 'delta_host', // put your Delta Core url here
  project: 'Project Name', // Name of your project
  testType: 'Test Type' // eg., End to End, E2E, Frontend Acceptance Tests
};

// ...

exports.config = {
  // ...
  reporters: [
    [DeltaReporter, delta_config]
  ],
  // ...
  services: [new DeltaService(delta_config)],


  // ...


  afterTest(test) {
    if (test.passed === false) {
      const file_name = 'screenshot.png';
      const outputFile = path.join(__dirname, file_name);

      browser.saveScreenshot(outputFile);
      browser.sendFileToTest('img', outputFile);

      getLatestFile({ directory: browser.options.outputDir + '/_results_', extension: 'mp4' }, (filename = null) => {
        browser.sendFileToTest('video', filename, 'Video captured during test execution');
      });
    }
  }

  // ...

}
```

## Usage

For each test run, there are two main cases:

- Local run: No need to do anything, you can just run your wdio command (`./node_modules/.bin/wdio ./wdio.conf.js`), so your test results appear in Delta Reporter in real time.

- CI run: please go to [Jenkins](cicd.md) section to dive into the details.
