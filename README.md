## ※ Native Module

&nbsp;- `Android` / `iOS` 별도로 셋팅!
<br>

<img src="https://img.shields.io/badge/Android- ?style=&logo=android&logoColor=white" />

### 1. 프로젝트 설정

- **프로젝트의 `build.gradle` 파일 수정 (`:project`)**

```java
buildscript {
    ext {
        buildToolsVersion = "34.0.0"
        minSdkVersion = 23
        compileSdkVersion = 34
        targetSdkVersion = 34
        ndkVersion = "26.1.10909125"
        **kotlinVersion = "1.9.22"**
    }
    ...
    dependencies {
        classpath("com.android.tools.build:gradle:7.4.2")
        classpath("com.facebook.react:react-native-gradle-plugin")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlinVersion") // <- 추가
    }
}
```

- **앱의 `build.gradle` 파일 수정 (`:app`)**

```java
apply plugin: "com.android.application"
apply plugin: "com.facebook.react"
apply plugin: "org.jetbrains.kotlin.android" // <- 추가
```

<br>

### 2. 네이티브 모듈 정의하기

- **새로운 Kotlin Class 파일 생성 (경로: `app/java/com/project`)**
**[ 작성 예시 파일: `CalculatorModule.kt` ]**

<br>

### 3. React Native 패키지 정의하기

- **새로운 Kotlin Class 파일 생성 (경로: `app/java/com/project`) 후 작성**
**[ 작성 예시 파일: `CalculatorPackage.kt` ]**



<br>

### 4. 패키지 등록

- **`MainApplication.kt` 파일 수정 (경로: `app/java/com/project`)**

```kotlin
import com.facebook.react.ReactPackage
import com.facebook.react.shell.MainReactPackage
import com.facebook.react.PackageList

class MainApplication : Application(), ReactApplication {

    override fun getPackages(): List<ReactPackage> =
        PackageList(this).packages.apply {
            // Packages that cannot be autolinked yet can be added manually here, for example:
            // add(MyReactNativePackage())
            add(CalculatorPackage()) // <- 추가
        }
}
```
<br>

<img src="https://img.shields.io/badge/iOS-gray?style=&logo=apple&logoColor=white" />

### 1. 네이티브 모듈 정의하기

- **새로운 Swift 파일 생성 (경로: Project폴더 내에 생성)**
- **생성 시 뜨는 창에서 Create Bridging Header를 클릭하여 Bridging Header를 만들고 아래와 같이 작성
(React Package를 사용할 수 있게 해준다.)**

**[ 예시: `Calculator-Bridging-Header.h` ]**

```swift
#import <React/RCTBridgeModule.h> 
```

- **생성한 Swift 파일에 네이티브 모듈 정의**
**[ 작성 예시 파일: `CalculatorModule.swift` ]**

### 2. Swift 모듈 브리징 설정

- **새로운 Objecive-C File 생성**
**[ 작성 예시 파일: `CalculatorModuleBridge.m` ]**

<br>
