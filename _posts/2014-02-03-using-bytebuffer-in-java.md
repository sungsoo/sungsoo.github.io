---
layout: post
title: Using ByteBuffer in Java
date: 2014-02-03
categories: [computer science]
tags: [developments]

---

네트워크 통신 등의 버퍼를 사용하는 작업에는 ByteBuffer 클래스를 많이 사용한다.
byte 배열을 사용하는 경우 잦은 GC(garbage collection) 가 성능에 영향을 줄 수 있다.


Creating a ByteBuffer Instance 
---
**ByteBuffer** 클래스에는 *allocate* 함수와 *allocateDirect* 함수가 있다.
두 함수 모두 static 이고 int 값을 파라미터로 전달받으며 버퍼의 크기를 지정한다.

```java
ByteBuffer buffer = ByteBuffer.allocate(1024);  
```

allocateDirect 함수의 경우 사용하는 플랫폼(안드로이드 등의 모바일 플랫폼) 에 따라 정상적으로 동작하지 않는 경우도 있으므로 반드시 플랫폼이 지원을 하는지 테스트해 보고 사용하길 권한다.


Intialize a ByteBuffer
---
clear 함수는 해당 ByteBuffer instance 가 생성되었을 때 상태로 만들어 준다.

Resizing a ByteBuffer
---
limit(int newLimit) 함수를 사용하여 쓰기 가능 영역 크기를 조정할 수 있다.
파라미터로 넘기는 값이 allocate 로 지정한 capacity 를 초과할 수 없다.

```java
ByteBuffer buffer = ByteBuffer.allocate(1024);  
buffer.limit(); // 1024 를 리턴  
buffer.limit(50);  
//buffer.limit(2048); // 허용되지 않음  
buffer.limit(); // 50 를 리턴  
```

Writing to a ByteBuffer
---
put* 함수들을 이용해서 데이터를 ByteBuffer 에 넣어준다.

```java
ByteBuffer buffer = ByteBuffer.allocate(1024);  
buffer.put((byte)0x01);  
buffer.put(new byte[] {0x02, 0x03});  
buffer.put((byte)0x04);  
```

위에 대한 수행 결과는 아래와 같다.
```
buffer.array() => [0x01, 0x02, 0x03, 0x0x04, ...]
```

Reading from a ByteBuffer
---
get* 함수들을 이용해서 원하는 데이터 크기만큼 데이터를 읽을 수 있다.
get* 함수를 이용해서 데이터를 읽으면 다음 get* 함수 이용시 이전 get* 함수를 이용해 읽은 다음 부분부터 값을 읽는다.

```java
ByteBuffer buffer = ByteBuffer.wrap(new byte[] {0x01, 0x02, 0x03, 0x04, 0x05, 0x06});  
byte a = buffer.get();  
byte b = buffer.get();  
byte[] c = new byte[2];  
buffer.get(c);  
byte d = buffer.get();  
```

위에 대한 수행 결과는 아래와 같다.
```
a => 0x01
b => 0x02
c => [0x03, 0x04]
d => 0x05
```

Reading and Writing for a ByteBuffer
---
put* 함수를 이용해서 값을 쓰거나 SocketChannel 의 read 함수로 ByteBuffer instance 에 값을 쓰고 나서 데이터를 읽기 전에 ByteBuffer 클래스의 flip 함수를 한번 호출해야 한다.

```java
buf.put(magic); // Prepend header  
in.read(buf); // Read data into rest of buffer  
buf.flip(); // Flip buffer  
out.write(buf); // Write header + data to channel  
```
buf.put(magic) 과 in.read(buf) 모두 buf 에 데이터를 쓴다.
데이터를 쓰고 나서 buf.flip() 으로 모드 변환을 해주고
out.write(buf) 로 buf 의 내용을 읽는다.


Data Handling in a ByteBuffer
---
socket 통신의 경우 buffer 에 읽을 수 있는 양이 찰 때까지 read 함수로 buffer 를 채우고 buffer 가 충분히 차면 의미있는 범위까지 데이터를 읽고 buffer 의 남은 부분을 유지하고 남은 부분 다음부터 데이터를 채우는 작업을 반복하는 경우가 있다.

이때 데이터의 남은 부분을 buffer 의 앞으로 이동시키고 남은 부분 다음부터 쓸 수 있게 하는 함수가 compact 함수이다.

```java
ByteBuffer buffer = ByteBuffer.allocate(1024);  
byte[] data = new byte[16];  
buffer.clear(); // ByteBuffer 초기화  
int len = 0;  
while ((len = in.read(buffer)) > 0) { // ByteBuffer 쓰기  
	buffer.flip(); // 쓰기 작업이 끝나고 읽기 작업을 위해 flip  
	while (buffer.remaining() > 16) { // remaining 함수는 읽을 수 있는 크기를 리턴  
		buffer.get(data); // 16 바이트만큼 데이터를 읽음  
		// data 처리  
	}  
	buffer.compact(); // 남은 부분을 ByteBuffer 맨 앞으로 이동   
	// 다음 read 작업에서 남은 부분 다음부터 채움  
}  
```

References
---
[1] [Class ByteBuffer](http://download.oracle.com/javase/6/docs/api/java/nio/ByteBuffer.html), *Java Platform Standard Edition 6*, 2011











