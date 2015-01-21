mkcsb
====

This is a csd to csb generator using edge cocos2d-x.

## Description

If you use edge cocos2d-x sometimes broken cocosstudio csb file.
This tool use "editor-support/cocostudio/FlatBuffersSerialize.h" to generate csb without Cocos Studio.

## Environment

- OSX only.

## BUILD

```
$ git submodule update --init --recursive --depth 1
$ cd cocos2d-x
$ ./download-deps.py
$ cd ..
$ make
```

# USAGE

```
$ mkcsb PATH/TO/YOUR/COCOSSTUDIOPROJECT/cocosstudio
```

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author

[okeya.k.k](http://oke-ya.com/)
[yalab](https://github.com/yalab)
