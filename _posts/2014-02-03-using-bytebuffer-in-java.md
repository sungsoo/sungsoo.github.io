---
layout: post
title: Using ByteBuffer in Java
date: 2014-02-03
categories: [computer science]
tags: [design patterns]

---

Overview
---

I have always been of the view that using recycled objects is faster for serialization.
So I wrote a test based on **Thrift Protobuf Compare** to see where it does well or poorly.
The benchmark suggest that serialization/deserialization is fast with ByteBuffer and recycled objects, but creating new objects is relatively expensive.
This suggests that provided you have a simple strategy for reusing objects, it may be worth using this approach. However, if you can't recycle objects I suspect it won't be worth the extra effort.

### Total Serailization time

![](http://sungsoo.github.com/images/chart.png)

네트워크 통신 등의 버퍼를 사용하는 작업에는 ByteBuffer 클래스를 많이 사용한다.
byte 배열을 사용하는 경우 잦은 GC(garbage collection) 가 성능에 영향을 줄 수 있다.

**ByteBuffer API** has been in Java since 1.4. The name itself suggests that these contain bytes of data. The data to be stored in the buffer can be Integer (int, long), Characters (char), Floating value (double), all these are converted into bytes before being stored in the buffer array. ByteBuffer can be of two types.

* Direct ByteBuffer  
* Non-Direct ByteBuffer

**Direct ByteBuffer**: JVM tries to use Native IO operations on buffers which are created as direct i.e it doesnt load the buffer contents into another buffer and instead tries to use the buffer directly.

There are a few essential properties of ByteBuffer:

* *Limit*: While writing to a buffer, limit indicates how many more bytes can be written, whereas while reading from a buffer limit indicates how many more bytes can be read.    
* *Position*: Position tracks how much data is written or can be read from a buffer.  
* *Capacity*: Capacity specifies the number of bytes a buffer can store.

ByteBuffer provides plethora of methods to fetch data from the buffer and to add data to the buffer. The below code shows the use of those APIs:

    
```java
import java.nio.ByteBuffer;

public class ByteBufferTest {
  
  public static void main(String[] args) {

    //Create a directBuffer of size 200 bytes
    ByteBuffer directBuffer = ByteBuffer.allocateDirect(200);
    
    //Create a nonDirectBuffer of size 200 bytes
    ByteBuffer nonDirectBuffer = ByteBuffer.allocate(200);
    
    //Get the capacity of the buffer
    System.out.println("Capacity "+nonDirectBuffer.capacity());
    
    //Get the position of the buffer
    System.out.println("Position "+nonDirectBuffer.position() );
    
    //Add data of different types to the buffer
    nonDirectBuffer.putChar('A');
    nonDirectBuffer.putInt(10);
    nonDirectBuffer.putDouble(0.98);
    
    //Get the position of the buffer, would print 14 as its has 14 bytes of data
    System.out.println("Position "+nonDirectBuffer.position() );
    nonDirectBuffer.putFloat(8.9f);
    
    //Fetch the data from buffer
    System.out.println(nonDirectBuffer.getChar(0));
    
    //A char is of 2 bytes, so fetch the integer at index 0+2=2bytes
    System.out.println(nonDirectBuffer.getInt(2));
    
    //A int is of 4 bytes so fetch the double value at index 2+4=6bytes
    System.out.println(nonDirectBuffer.getDouble(6));
    
    //A double is of 8 bytes so fetch the float value at index 6+8=14bytes
    System.out.println(nonDirectBuffer.getFloat(14));
   
  }
}
```

Convert String To Java ByteBuffer
---
java.nio 는 java.io에서 메모리상에서 변경하는 것을 지원하지 못해서 nio가 나왔다. 
그래서 nio 는 생성자가 없는데, 이는 메모리에서 주소값이 변경되는 것을 방지하기 위해서이다.
wrap 메서드는  버퍼에서 byte[] 를 담는다고 이해하면 된다.

```java
	String str = "안녕하세요 xxx입니다.";   
	byte[] bytes = str.getBytes();
	ByteBuffer buf = ByteBuffer.wrap(bytes);   
	System.out.println(buf.toString()); 
	// java.nio.HeapByteBuffer[pos=0 lim=21 cap=21]으로 출력된다. 
	// 시작위치, 끝, 용량 등을 출력한다.
	for(int i = 0; i < buf.limit(); i++)
		System.out.println(buf.get(i)); // 이런식으로 하면 바이트 배열을 출력한다.
```

다시 스트링으로 변환하려면 아래와 같이 구현하면 된다.

```java
	byte[] rtnBytes = buf.array();
	String rtnStr = new String(rtnBytes);
	System.out.println(rtnStr);
```	

Serialization
---

Note that "Only objects that support the **java.io.Serializable** interface can be written to streams" (see **java.io.ObjectOutputStream**).

Since you might run into it, the continuous allocation and resizing of the **java.io.ByteArrayOutputStream** might turn out to be quite the bottle neck. Depending on your threading model you might want to consider reusing some of the objects.

For serialization of objects that do not implement the **Serializable** interface you either need to write your own serializer, for example using the read* / write* methods of java.io.DataOutputStream and the get* / put* methods of **java.nio.ByteBuffer** perhaps together with reflection, or pull in a third party dependency.

```java
package com.example;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class Serializer {
    public static byte[] serialize(Object obj) throws IOException {
        ByteArrayOutputStream b = new ByteArrayOutputStream();
        ObjectOutputStream o = new ObjectOutputStream(b);
        o.writeObject(obj);
        return b.toByteArray();
    }

	public static Object deserialize(byte[] bytes) throws IOException, ClassNotFoundException {
        ByteArrayInputStream b = new ByteArrayInputStream(bytes);
        ObjectInputStream o = new ObjectInputStream(b);
        return o.readObject();
    }
}
```
      
Opening a SocketChannel
---

Here is how you open a SocketChannel:

```java
SocketChannel socketChannel = SocketChannel.open();
socketChannel.connect(new InetSocketAddress("http://jenkov.com", 80));
```

Closing a SocketChannel
---

You close a SocketChannel after use by calling the SocketChannel.close() method. Here is how that is done:

```java
socketChannel.close();    
```

Reading from a SocketChannel
---

To read data from a SocketChannel you call one of the read() methods. Here is an example:

```java
ByteBuffer buf = ByteBuffer.allocate(48);

int bytesRead = socketChannel.read(buf);
```

First a Buffer is allocated. The data read from the SocketChannel is read into the Buffer.

Second the **SocketChannel.read()** method is called. This method reads data from the **SocketChannel** into the **Buffer**. The int returned by the **read()** method tells how many bytes were witten into the **Buffer**. If -1 is returned, the end-of-stream is reached (the connection is closed).

Writing to a SocketChannel
---

Writing data to a SocketChannel is done using the SocketChannel.write() method, which takes a Buffer as parameter. Here is an example:

```java
String newData = "New String to write to file..." + System.currentTimeMillis();

ByteBuffer buf = ByteBuffer.allocate(48);
buf.clear();
buf.put(newData.getBytes());

buf.flip();

while(buf.hasRemaining()) {
    channel.write(buf);
}
```

Notice how the **SocketChannel.write()** method is called inside a while-loop. There is no guarantee of how many bytes the **write()** method writes to the **SocketChannel**. Therefore we repeat the **write()** call until the Buffer has no further bytes to write.


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











