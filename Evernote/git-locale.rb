升级git 后发现 shell提示变成中文了，
原因是新版本支持了locale 国际化。

会根据系统 $LANG 自动翻译。

查看git安装源代码
/usr/local/Cellar/git/2.26.1_1/share/locale

➜  locale ls
bg     ca     de     el     es     fr     is     it     ko     pt_PT  ru     sv     tr     vi     zh_TW  zzh_CN

找到 zh_CN 包 改成 zzh_CN。 就默认成英文的了。

但是最好还是别改源代码， 升级国际化自然是好事。
目前还不习惯中文。临时改一下
