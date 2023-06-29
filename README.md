## SCD
Summer Course Design, 若依项目二次开发

## 项目说明

### 项目框架

#### 文档结构

<div>
|--SCD
    总项目名 Summer Course Design
    <br/>
&nbsp&nbsp&nbsp&nbsp|--DataBase
    数据库
    <br/>
&nbsp&nbsp&nbsp&nbsp|--RuoYi-exam
    RuoYi项目
    <br/>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp|--ruoyi-ui
    前端项目
    <br/>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp|--RuoYi-Vue
    后端项目
    <br/>
&nbsp&nbsp&nbsp&nbsp|--readme.md
    说明文档
    <br/>
</div>

### 开发环境配置

#### 软件安装

<form>
<a href="https://www.jetbrains.com/toolbox-app/">
    JetBrains ToolBox
</a>
<br>
前端部署： <br>
WebStorm： ./RuoYi-exam/ruoyi-ui<br>
后端部署：<br>
IntelliJ IDEA Ultimate： ./RuoYi-exam/RuoYi-Vue<br>
数据库部署：<br>
DataGrip: ./DataBase<br>
</form>

<form>
<a href="https://www.oracle.com/java/technologies/downloads/#java8">
JDK1.8
</a>
Java开发工具包 
<br/>
<a href="https://nodejs.org/zh-cn/download">
Node.js 
</a>
JavaScript运行时环境
<br/>
<a href="https://github.com/MicrosoftArchive/redis/releases">
Redis
</a>
NoSQL数据库
<br/>
<a href="https://dev.mysql.com/downloads/installer/">
    MySQL
</a>
数据库集成开发环境
<br/>
<a href="https://maven.apache.org/download.cgi">
Apache Maven
</a>
软件项目管理及自动构建工具
</form>



#### 启动服务

- 启动Redis服务：

<code>redis-server.exe redis.windows.conf </code>

![image-20230628194425604](https://github.com/FeiSkyDeC/SCD/assets/74658213/d8db752a-9ede-40c9-a838-a4f02a1bce31)


打开Redis客户端：

<code>redis-cli.exe -h 127.0.0.1 -p 6379</code>

并使用ping命令检测客户端与服务器的连通性：
![image](https://github.com/FeiSkyDeC/SCD/assets/74658213/c5538152-6a1b-4590-a6cd-f23113f320f7)

- 后端启动 (使用IntelliJ IDEA Ultimate运行 <strong>RuoYi-Vue </strong>项目)

![image-20230628200632873](https://github.com/FeiSkyDeC/SCD/assets/74658213/49e17dbc-a761-4756-8142-4446155cb2a9)

- 前端运行(使用WebStorm的控制台 运行 <strong>ruoyi-ui</strong>项目)
![image-20230629150308060](https://github.com/FeiSkyDeC/SCD/assets/74658213/a3c1faaa-4f72-4c43-b125-b5aa6338f77c)


<p>
    前端运行后，浏览器将打开管理系统页面如下：
</p>

![image-20230628200709374](https://github.com/FeiSkyDeC/SCD/assets/74658213/5795e6ce-984a-4cea-b8bf-087f88668f27)

登录
![image-20230628200753066](https://github.com/FeiSkyDeC/SCD/assets/74658213/dfb142e5-0498-424a-b568-9f53c6cda0b1)


此时，将 <strong>RuoYi项目</strong> 部署到本地机中。

### 项目开发要求

- SpringBoot + Vue3 框架
- HTML+CSS+JavaScript 语言
- GitHub 项目汇总
- Markdown 语法

### 学习资源

<form>
    <a href="https://learner.blog.csdn.net/article/details/88926242">SpringBoot + Vue3</a>
    <br/>
    <a href="http://doc.ruoyi.vip/ruoyi-vue/">RuoYi 前后端分离文档</a>
    <br/>
    <a href="https://markdown.com.cn/basic-syntax/">
    Markdown 语法</a>
    <br/>
    <a href="https://docs.github.com/zh/get-started/quickstart/hello-world">
    GitHub 快速入门</a>
    <br/>
</form>




