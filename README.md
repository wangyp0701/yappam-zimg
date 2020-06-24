# yappam-zimg
[![wercker status](https://app.wercker.com/status/6a490a7d994041886dd2783ffa6dbc03/s/master "wercker status")](https://app.wercker.com/project/byKey/6a490a7d994041886dd2783ffa6dbc03)

[北京雅邦网络技术发展有限公司](http://www.yappam.com)

* 基于centos镜像制作，zimg v3.2.0 支持webp格式图片

```bash
启动方式：docker run -it -d -p 4869:4869 -v /data/zimg/:/zimg/bin/img --name zimg wangyp0701/zimg
```

*  [helm](https://helm.sh) 安装到k8s

```bash
 helm repo add ali https://apphub.aliyuncs.com/experimental
 helm repo update
 helm install zimg ali/zimg
 ```




