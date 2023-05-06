# PVE
## iso镜像下载 ：
* [官网](https://www.proxmox.com/en/downloads)
* [镜像下载](https://mirrors.tuna.tsinghua.edu.cn/proxmox/iso)

## pve磁盘扩容：
##### 查看分区：
```sh
lvdisplay
```
##### 1.进入shell，或者ssh连接。然后通过以下指令删除local-lvm逻辑卷 pve/data，会有提示你是否确定删除，记得按y：
```sh
lvremove pve/data
```
##### 将local扩容(把空闲磁盘分配到pve/root)：
```sh
lvextend -l +100%FREE -r pve/root
```
##### 3、在管理界面删除掉local-lvm就可以了(数据中心-存储，然后点到local-lvm，再点击删除就可以了)：


## 替换apt软件源 ：
##### 更新证书：
```sh
sudo apt install apt-transport-https ca-certificates
```
##### 通用软件源(/etc/apt/sources.list)：
```sh
cp /etc/apt/sources.list /etc/apt/sources.list_back
echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释" > /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free" >> /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free" >> /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free" >> /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free" >> /etc/apt/sources.list
echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list
echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free" >> /etc/apt/sources.list
echo "OK"
```
##### pve软件源(/etc/apt/sources.list.d/pve-enterprise.list)：
```sh
cp /etc/apt/sources.list.d/pve-enterprise.list /etc/apt/pve-enterprise.list_back
echo "deb https://mirrors.tuna.tsinghua.edu.cn/proxmox/debian bullseye pve-no-subscription" > /etc/apt/sources.list.d/pve-enterprise.list
```
##### 更新：
```sh
sudo apt-get update
```
##### 修改 CT Templates (LXC容器)源：
```sh
cp /usr/share/perl5/PVE/APLInfo.pm /usr/share/perl5/PVE/APLInfo.pm_back
sed -i 's|http://download.proxmox.com|https://mirrors.tuna.tsinghua.edu.cn/proxmox|g' /usr/share/perl5/PVE/APLInfo.pm
```
```sh
cp /usr/share/perl5/PVE/APLInfo.pm /usr/share/perl5/PVE/APLInfo.pm_back
sed -i 's|http://download.proxmox.com|https://mirrors.tuna.tsinghua.edu.cn/proxmox|g' /usr/share/perl5/PVE/APLInfo.pm
```
##### LXC仓库为国内源：
```sh
grep -rn "download.proxmox.com" /usr/share/perl5/PVE/*
sed -i.bak "s#http://download.proxmox.com/images#https://mirrors.ustc.edu.cn/proxmox/images#g" /usr/share/perl5/PVE/APLInfo.pm
wget -O /var/lib/pve-manager/apl-info/mirrors.ustc.edu.cn https://mirrors.ustc.edu.cn/proxmox/images/aplinfo.dat
```
```sh
grep -rn "download.proxmox.com" /usr/share/perl5/PVE/*  #查找设定下载源的文件
sed -i.bak "s#http://download.proxmox.com/images#https://mirrors.ustc.edu.cn/proxmox/images#g" /usr/share/perl5/PVE/APLInfo.pm
wget -O /var/lib/pve-manager/apl-info/mirrors.ustc.edu.cn https://mirrors.ustc.edu.cn/proxmox/images/aplinfo-pve-6.dat
```

##### 重启后生效：
```sh
systemctl restart pvedaemon.service
```


## 直通修改：
##### pcie直通：
```txt
shell里面输入命令：

nano /etc/default/grub

找到GRUB_CMDLINE_LINUX_DEFAULT="quiet"，修改为
GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on pcie_acs_override=downstream"
```
##### Intel：
```txt
shell里面输入命令：

nano /etc/default/grub
在里面找到：

GRUB_CMDLINE_LINUX_DEFAULT="quiet"
然后修改为

GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on"
在更新一下

update-grub

dmesg | grep -e DMAR -e IOMMU
重启一下

reboot
```
##### AMD：
```txt
shell里面输入命令：

nano /etc/default/grub
在里面找到：

GRUB_CMDLINE_LINUX_DEFAULT="quiet"
然后修改为

GRUB_CMDLINE_LINUX_DEFAULT="quiet amd_iommu=on"

在更新一下

update-grub

dmesg | grep -e DMAR -e IOMMU
重启一下

reboot

新增所需模块
修改文件/etc/modules,加入如下的行

nano /etc/modules
vfio
vfio_iommu_type1
vfio_pci
vfio_virqfd
执行命令来更新initramfs

update-initramfs -u -k all.
```