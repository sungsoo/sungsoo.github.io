---
layout: post
title: N-Screen Application Development Manual
date: 2013-12-13
categories: [computer science]
tags: [design patterns]

---

N-스크린 어플리케이션 라이브러리(NSAL)를 사용하여 N-스크린 앱을 개발하기 위한 절차를 기술한다.

###개발 전에 준비해야 할 것들

-	각 디바이스에는 협업 에이전트 서비스 (CA.apk)가 설치되어 있어야 한다.
-	NScreen Application Library 파일(NSAL.jar)이 준비되어야 한다.
-	Java JDK 버전 1.6을 사용할 것을 권장한다.
-	안드로이드 버전 4.0 이상을 사용하여야 한다.
-	각 NScreen App에 대한 InterAppRelation 정보를 담은 XML 파일을 각 디바이스의 지정된 폴더(/sdcard/CAInterAppRelation)에 저장해야 한다. 
-	InterAppRelation 정보를 담은 파일 이름은 InterAppRelation_[App Package ID].xml 이다.


###개발 절차

- 프로젝트 생성후 libs 폴더에 NSAL.jar 파일을 복사해서 넣는다. (단 Build SDK는 4.0이상으로 맟춘다.)

- 생성한 프로젝트의 Properties에 Java Build Path->Libraries->Add JARs를 눌러서 해당 프로젝트의 libs폴더안의 NSAL.jar파일을 선택한다.  
![http://sungsoo.github.com/images/nscreen-setting.png](http://sungsoo.github.com/images/nscreen-setting.png)

- Order and Export탭에서 NSAL.Jar 파일을 체크한다.
![http://sungsoo.github.com/images/nscreen-buildpath.png](http://sungsoo.github.com/images/nscreen-buildpath.png)

- AndroidManifest.xml에서 application 안에 그대로 service를 추가한다.    

```
<service android:name="kr.re.etri.rdcm.nsal.NSALAidlService">
	<intent-filter>
	<action android:name="개발하는앱의패키지명.AidlService"></action>
	</intent-filter>
</service>
```

- Application Class를 상속 받을 클래스를 생성한다. 이때 반드시 NSALApplication 을 상속 받아야 한다.

```
package nscreen.searchinfo.test2;

import kr.re.etri.rdcm.nsal.NSALApplication;

public class NApps extends NSALApplication{
	@Override
	public void onCreate() {
		// TODO Auto-generated method stub
		super.onCreate();
	}
	
	@Override
	public void onTerminate() {
		// TODO Auto-generated method stub
		super.onTerminate();
	}
}
```

- AndroidManifest.xml에서 application name을 생성한 클래스 이름으로 입력한다.

```
<application  android:name=".NApps"
        android:icon="@drawable/ic_launcher"
        android:label="@string/app_name"
        android:theme="@style/AppTheme" >
```

- 구현할 Activity나 Service 클래스는 각각 NSALActivity와 NSALService를 상속 받아서 개발해야 한다.

- MapActivity를 상속 받아야 할 경우에는 NSALMapActivity를 상속 받아서 개발해야 한다.


###동일 협업세션에 참여하는 N-스크린 앱간 데이터 송수신
* 같은 세션에 참여중인 다른 Device로 메시지를 보내고 싶으면 다음과 같이 `sendMessageToAppsInSession()` method를 이용하여 메시지를 전송하면 된다.

```
NApps nApps=(NApps)getApplicationContext();
nApps.sendMessageToAppsInSession(“message”);
```

* 같은 세션에 참여 중인 다른 앱으로부터 메시지를 받고자 할 때 메시지를 수신할 Activity Class에 다음과 같이 리스
너를 등록한다. 아래 예에서는 NApps 클래스가 리스너인 경우이다. 

```
NApps nApps=(NApps)getApplicationContext();
nApps.setOnReceiveListener(this);
```

* NApps 클래스가 receiveHandler interface를 implement 하게 되면 ReceiveMessage 함수를 구현하여야 한다. 메세지 수신 핸들러가 생성되고 메시지메 수신 받을수 있게된다.

* 같은 세션에 참여 중인 다른 앱으로부터 메시지가 올 경우 ReceiveMessage 함수가 호출된다. 참여중인 세션에 다른 App이 참여했을 때 다음 함수가 호출된다. 여기서, message는 메시지를 보낸 앱이 담은 스트링 값을 그대로 포함한다.

```
public void ReceiveMessage(String message) {		
}
```

### 자원인지 디바이스 협업 미들웨어를 이용한 주요 기능

자원인지 디바이스 협업 미들웨어(이하; 협업 에이전트)를 이용하여 N-스크린 어플리케이션이 수행할 수 있는 주요 기능들은 다음과 같다.

* 원격 실행 (Remote Execution)
* 협업세션 참여 (Collaboration Session Join)
* 협업세션 초대 (Collaboration Session Invitation)
* 앱 푸쉬 이동 (Application Push Migration)
* 앱 풀 이동 (Application Pull Migration)


### References

[1] NScreen App 개발 매뉴얼, ETRI, 2012.

