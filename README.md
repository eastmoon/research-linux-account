# Linux 帳號設定調研

用戶管理 ( 或稱帳號管理 ) 是任何授權系統 ( 非開放式服務 ) 的基礎設計，因此，了解一個系統的帳號管理服務也能同時了解受到整個系統的核心運作邏輯。

## 用戶 ( User )

在 Linux 系統中，一個用戶包括兩個數據：

+ 用戶 ( User ID、UID )
    - ```useradd``` ：建立用戶
    - ```passwd``` ：設定用戶密碼
    - ```usermod``` ：修改用戶資料
    - ```userdel``` ：刪除用戶
+ 群組 ( Group ID、GID )
    - ```groupadd``` ：建立群組
    - ```gpasswd``` ：管理群組
    - ```groupmod``` ：修改群組資料
    - ```groupdel``` ：刪除群組

其數據有以下特性：

+ 用戶建立時，會同時建立一個用戶同樣名稱的群組
    - 用戶預設會建立一個家目錄 ```hoem/<user name>```，此目錄權限預設為用戶與群組皆為建立的用戶名稱
    - 用戶預設是無法登入帳號，若不透過設定用戶密碼，則該用戶無法切換、也無法登入
    - 用戶即使設瞭密碼也可以透過設定執行 ```/sbin/nologin``` 另其成為無法登入狀態
+ 在建立群組時，並不會同時產生一個同名的用戶
+ 用戶除了原始群組外，可以透過管理者加入其他群組
+ 群組可以不包括任何用戶

## 權限 ( Permission )

在 Linux 系統中，一切物件皆受有其權限資料，其資料結構如下：

![Linux permission demo](doc/img/linux-permission-01.png)

```
-rwxr-xr-x.  1    root     root       0    Jan  7 08:37 .dockerenv
[    1    ][ 2 ][   3   ][   4   ][   5   ][     6    ][    7    ]
[   權限  ][連結][ 用戶 ][  群組 ][檔案容量][ 修改日期 ][  檔名   ]
```

第一欄中的 10 個字符，便是此物件的權限資料，其分別表示為：

```
<物件型態 (1)><用戶權限 (3)><群組權限 (3)><其他用戶權限 (3)>
```

+ 物件型態，此編碼是用來標示該物件的資料類型
    - ```-``` ：標示為檔案
    - ```d``` ：標示為目錄
    - ```l``` ：標示為連結 ( link )
    - ```b``` ：標示為裝置檔中可儲存周邊設備，如 USB 等動態存取設備
    - ```c``` ：標示為裝置檔中的序列埠設備，如鍵盤、滑鼠等一次性讀取設備
+ 用戶權限，此編碼是表示此物件擁有用戶的操作權限，分為讀取 ( ```r``` )、寫入 ( ```w``` )、執行 ( ```x``` )
+ 群組權限，此編碼是表示此物件擁有群組的操作權限，分為讀取 ( ```r``` )、寫入 ( ```w``` )、執行 ( ```x``` )
+ 其他用戶權限，此編碼是表示此物件對其他用戶的操作權限，分為讀取 ( ```r``` )、寫入 ( ```w``` )、執行 ( ```x``` )

第三攔、第四欄分別表示此物件的擁有用戶與群組，在此標記的用戶受用戶權限影響操作權，群組受群組權限影響，而不再群組內的其他用戶受其他用戶權限影響。

而對於物件的權限的調整，常用的指令如下：

+ ```chgrp``` ：改變檔案所屬群組
+ ```chown``` ：改變檔案擁有者
+ ```chmod``` ：改變檔案的權限

## 文獻

+ Linux 教學文獻
    - [第五章、Linux 的檔案權限與目錄配置](https://linux.vbird.org/linux_basic/centos7/0210filepermission.php)
    - [第六章、Linux 檔案與目錄管理](https://linux.vbird.org/linux_basic/centos7/0220filemanager.php)
    - [第十章、認識與學習BASH](https://linux.vbird.org/linux_basic/centos7/0320bash.php)
    - [第十三章、Linux 帳號管理與 ACL 權限設定](https://linux.vbird.org/linux_basic/centos7/0410accountmanager.php)
+ [OES 2018 SP2: Linux User Management Administration Guide](http://www.novell.com/documentation/open-enterprise-server-2018/acc_linux_svcs_lx/data/bookinfo.html)
    - [Unix / Linux - User Administration](https://www.tutorialspoint.com/unix/unix-user-administration.htm)
    - [第十三章、Linux 帳號管理與 ACL 權限設定](https://linux.vbird.org/linux_basic/centos7/0410accountmanager.php)
+ 帳號設定相關文獻
    - [How To Set or Change Linux User Password](Research for Linux OS account setting, focus on how to setting account for different usage.)
    - [Understanding /etc/shadow file format on Linux](https://www.cyberciti.biz/faq/understanding-etcshadow-file/)
    - [Where are the passwords of the users located in Linux?](https://www.cyberciti.biz/faq/where-are-the-passwords-of-the-users-located-in-linux/)
    - [How to Change User Password in Linux](https://linuxize.com/post/how-to-change-user-password-in-linux/)
    - [System Users and Human Users in Linux Explained with Examples](https://www.cyberithub.com/system-users-and-human-users-in-linux-explained-with-examples/)
