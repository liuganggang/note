// -g 就是全局的意思
// 安装 express 包
npm install express -g

// 到项目中 安装包, 要不然 require 不到
$ cd /path/to/the/project
$ npm install <package name>
var express = require( 'express' );

// 卸载 包
npm uninstall <package name> -g

// 移除项目使用的包
$ cd /path/to/the/project
npm uninstall <package name> -g

// 搜索 包
npm search express

// 列出全部 包.
$ npm ls -g
// 列出全部 包的详细信息.
$ npm ls -gl
// 列出项目中的包
$ cd /path/to/the/project
$ npm ls
// 列出项目中的包 详细信息
$ cd /path/to/the/project
$ npm ls -l
// 更新全局的包
$ npm update -g
// 更新项目中的包
$ cd /path/to/the/project
$ npm update


// package.json 项目安装管理

$ cd /path/to/the/project
$ touch package.json

{
  "name": "your app name",
  "version": "0.0.1",
  "private": true,
  "dependencies": {
    "express": ">=2.5.0",
    "jade": ">= 0.16.4",
    "mongoose": ">=2.3.10"
  }
}

// 执行安装
$ npm install -l

// 安装的同时，将信息写入package.json中
npm install <name> --save

//项目路径中如果有package.json文件时，直接使用npm install方法就可以根据dependencies配置安装所有的依赖包
//这样代码提交到github时，就不用提交node_modules这个文件夹了。

// npm init  会引导你创建一个package.json文件，包括名称、版本、作者这些信息等

npm remove <name>移除

npm update <name>更新

npm ls 列出当前安装的了所有包

npm root 查看当前包的安装路径

npm root -g  查看全局的包的安装路径

npm help  帮助，如果要单独查看install命令的帮助，可以使用的npm help install







































