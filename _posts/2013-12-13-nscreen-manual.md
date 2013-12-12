---
layout: post
title: N-Screen Application Development Manual
tags: Multiscreen, Development

---

N-스크린 어플리케이션 라이브러리(NSAL)를 사용하여 N-스크린 앱을 개발하기 위한 절차를 기술한다.

###개발 전에 준비해야 할 것들-	각 디바이스에는 협업 에이전트 서비스 (CA.apk)가 설치되어 있어야 한다.-	NScreen Application Library 파일(NSAL.jar)이 준비되어야 한다.-	Java JDK 버전 1.6을 사용할 것을 권장한다.-	안드로이드 버전 4.0 이상을 사용하여야 한다.-	각 NScreen App에 대한 InterAppRelation 정보를 담은 XML 파일을 각 디바이스의 지정된 폴더(/sdcard/CAInterAppRelation)에 저장해야 한다. -	InterAppRelation 정보를 담은 파일 이름은 InterAppRelation_[App Package ID].xml 이다.
###개발 절차1.	프로젝트 생성후 libs 폴더에 NSAL.jar 파일을 복사해서 넣는다. (단 Build SDK는 4.0이상으로 맟춘다.)2.	생성한 프로젝트의 Properties에 Java Build Path->Libraries->Add JARs를 눌러서 해당 프로젝트의 libs폴더안의 NSAL.jar파일을 선택한다.
###References
[1] NScreen App 개발 매뉴얼, ETRI, 2012.