Ubuntu 12.04 LTS 安装JDK

1. 下载对应版本的JDK，我这里使用的是JDK7-linux 32位版本的： jdk-7u7-linux-i586.tar.gz.  我把该文件放到/home/linuxidc/Downloads/ 下面。（linuxidc是我的用户名:)）

2. 解压。

    cd /home/linuxidc/Downloads         //进入jdk文件所在目录

    tar -zxvf jdk-7u7-linux-i586.tar.gz     //执行此命令后我们会发现改路径下面多了一个文件夹：jdk1.7.0_07, 这个就是我们解压后得到的文件。

    sudo mv jdk1.7.0_07 /opt/          //将jdk1.7.0_07整个文件夹一起移动到 /opt/下面， 因为一般安装的文件都都喜欢放到/opt/下面，这个看个人喜好了。

3. 修改环境变量:

    sudo gedit /etc/environment      //这里我修改的是这个文件，当然也可以修改~/.bashrc 或者~/.profile，关于这些区别我就不在这里叙述了，感兴趣的朋友可以google them~

    再第一行的末尾加上：

    ${JAVA_HOME}/bin


    在文件末尾加上

    export JAVA_HOME=/opt/jdk1.7.0_07
    export JRE_HOME=${JAVA_HOME}/jre
    export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib


    修改前：

    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"


    修改后：


    PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:${JAVA_HOME}/bin"
    export JAVA_HOME=/opt/jdk1.7.0_07
    export JRE_HOME=${JAVA_HOME}/jre
    export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib


    然后执行 source ~/.bashrc

4. 修改系统默认的jdk为我们刚刚安装的jdk， 因为系统中可能存在其他已经安装的jdk.


    sudo update-alternatives --install /usr/bin/java java /opt/jdk1.7.0_07/bin/java 300

    sudo update-alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_07/bin/javac 300

    sudo update-alternatives --install /usr/bin/javah javah /opt/jdk1.7.0_07/bin/javah 300

    sudo update-alternatives --install /usr/bin/jar jar /opt/jdk1.7.0_07/bin/jar 300

5. 该到了测试我们的安装成果的时候啦:

    java -version


   linuxidc@linuxidc:~$ java -version
   java version "1.7.0_07"
   Java(TM) SE Runtime Environment (build 1.7.0_07-b10)
   Java HotSpot(TM) Server VM (build 23.3-b01, mixed mode)

至此，jdk的安装就已经结束啦，希望各位朋友也能够成功！