testx-pop3-keywords
=====

A library that extends testx with keywords for testing PDF files. This library is packaged as a npm package

## How does it work
From the directory of the art code install the package as follows:
```sh
npm install testx-pdf-keywords --save
```

After installing the package add the keywords to your protractor config file as follows:

```
testx.addKeywords(require('testx-pdf-keywords'))
```

## Keywords

| Keyword                | Argument name | Argument value  | Description | Supports repeating arguments |
| ---------------------- | ------------- | --------------- |------------ | ---------------------------- |
| check text in pdf      |               |                 | check that the specified text exists in the PDF file |  |
|                        | file           | full path to the pdf file; one of *file*, *url* or *link* has to be specified || No |
|                        | url           | URL of the pdf file; one of *file*, *url* or *link* has to be specified || No |
|                        | link           | link to the pdf file; one of *file*, *url* or *link* has to be specified || No |
|                        | expect1(2, 3...) | expected text to find in the pdf || Yes |
| check text not in pdf  |               |                 | same as *check text in pdf*, but checks that the specified text is NOT in |  |
