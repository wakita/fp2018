#!/usr/bin/env phantomjs

const fs = require('fs');
const page = require('webpage').create();
const system = require('system');

const document_url = 'http://localhost:8080/fp2018/tmp/' + system.args[1] + '.html';
const jquery_url = 'http://localhost:8080/fp2018/dev/jquery-3.2.1.min.js';
const script_url = 'http://localhost:8080/fp2018/dev/kw.js';
const html = system.args[2];

console.log(document_url, script_url, html);

const jquery_tag = '<script src="' + jquery_url + '"></script>';
const script_tag = '<script src="' + script_url + '"></script>';

page.open(document_url, function(status) {
  if (status === "success") {
    page.includeJs(jquery_url, function () {
      page.includeJs(script_url, function () {
        try {
          const result = page.evaluate(function () { return convert(); });
          const content = page.content.replace(jquery_tag, '').replace(script_tag, '');
          fs.write(html, content, 'w');
        } catch (e) {
          console.log('error:', e);
        } finally {
          phantom.exit();
        }
      })
    });
  } else {
    console.log('Failed to open', document_url, status);
    phantom.exit();
  }
});
