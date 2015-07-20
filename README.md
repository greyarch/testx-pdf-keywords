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
| check text in pdf      |               |                 | download the pdf at the given url and checks that the specified text exists in it |  |
|                        | url           | URL of the pdf file || No |
|                        | expect1       | expected text to find in the pdf || Yes |
| check text not in pdf  |               |                 | download the pdf at the given url and checks that specified text is not in it |  |
|                        | url      | URL of the pdf file || No |
|                        | expect1       | expected text to NOT find in the pdf || Yes |
