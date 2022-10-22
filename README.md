# Cython编译C++样例(windows平台)

通过Cython，编译C++程序为python模块，支持python调用样例

## 特性

* 支持CMake全程编译。支持windows平台下visual studio 2019编译，linux下应当也可使用
* 提供C++类调用（含属性set、get，std::vector接口）、函数回调两个样例
* 提供CTest测试样例（使用unittest包）
__注__: [第三方cmake module]<https://github.com/thewtex/cython-cmake-example>编译出的pyd不可用。只能采用`python setup.py build_ext`方式编译

## 使用

准备工作：安装visual studio 2019以上、安装python3.7以上
__注__: visual studio 2019中含了cmake工具，所以无需单独安装。但注意下cmake版本，若小于v3.20，需更新下visual studio 2019的升级包。（v3.15以上其实也没关系）

* shell下手工执行

打开"Developer Command Prompt for VS 2019"，进入my_ds目录

```shell
> cmake -S . -B build
> cmake --build build
```

* VSCode中执行

(前提：已安装VSCode)

1. 安装vscode插件"CMake Tools"、"CMake Language Support"

2. 打开"Developer Command Prompt for VS 2019"，进入my_ds目录，启动vscode并新建项目my_ds
    __注__: 必须每次在此窗口通过如下命令启动vscode，否则msvs的编译可能失败（直接启动vscode，会造成一堆环境变量未设置）。

    ```shell
    > cd my_ds
    > code .
    ```

3. vscode中打开任意一个CMakeLists.txt。查看vscode底部状态条是否有CMake相关设置  
首次使用需设置编译器visual studio 2019 x86_amd64），保存CMakeLists.txt会自动编译。  
可能提示需要装".net framework"，若自动安装失败，可进入提示页面查找.net包的路径，下载后手工安装。

4. vscode左侧栏会出现CMake工具按钮，点击后，顶部有“配置所有项目”（即执行cmake）、“生成所有项目”（即cmake + build）两个按钮可执行。

5. 编译成功后，可按底部"run CTest"运行测试用例
    __注__: 有时"配置"、"生成"、"CTest" 可能反应不正常或出错，多按几次就能通过。
