---
layout: post
title: Native C/C++ Like Performance For Java Object Serialization
date: 2014-02-04
categories: [computer science]
tags: [design patterns]

---

Introduction
---
Do you ever wish you could turn a Java object into a stream of bytes as fast as it can be done in a native language like C++?  If you use standard Java Serialization you could be disappointed with the performance.  Java Serialization was designed for a very different purpose than serialising objects as quickly and compactly as possible.

Why do we need fast and compact serialisation?  Many of our systems are distributed and we need to communicate by passing state between processes efficiently.  This state lives inside our objects.  I've profiled many systems and often a large part of the cost is the serialisation of this state to-and-from byte buffers.  I've seen a significant range of protocols and mechanisms used to achieve this.  At one end of the spectrum are the easy to use but inefficient protocols likes Java Serialisation, XML and JSON.  At the other end of this spectrum are the binary protocols that can be very fast and efficient but they require a deeper understanding and skill.

In this post, I will illustrate the performance gains that are possible when using simple binary protocols and introduce a little known technique available in Java to achieve similar performance to what is possible with native languages like C or C++.

The three approaches to be compared are:
 
1. **Java Serialization**: The standard method in Java of having an object implement Serializable.  
2. **Binary via ByteBuffer**: A simple protocol using the ByteBuffer API to write the fields of an object in binary format.  This is our baseline for what is considered a good binary encoding approach.  
3. **Binary via Unsafe**: Introduction to Unsafe and its collection of methods that allow direct memory manipulation.  Here I will show how to get similar performance to C/C++.


The Code
---

```java
import sun.misc.Unsafe;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.nio.ByteBuffer;
import java.util.Arrays;
 
public final class TestSerialisationPerf
{
    public static final int REPETITIONS = 1 * 1000 * 1000;
 
    private static ObjectToBeSerialised ITEM =
        new ObjectToBeSerialised(
            1010L, true, 777, 99,
            new double[]{0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0},
            new long[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 10});
 
 
    public static void main(final String[] arg) throws Exception
    {
        for (final PerformanceTestCase testCase : testCases)
        {
            for (int i = 0; i < 5; i++)
            {
                testCase.performTest();
 
                System.out.format("%d %s\twrite=%,dns read=%,dns total=%,dns\n",
                                  i,
                                  testCase.getName(),
                                  testCase.getWriteTimeNanos(),
                                  testCase.getReadTimeNanos(),
                                  testCase.getWriteTimeNanos() + 
                                  testCase.getReadTimeNanos());
 
                if (!ITEM.equals(testCase.getTestOutput()))
                {
                    throw new IllegalStateException("Objects do not match");
                }
 
                System.gc();
                Thread.sleep(3000);
            }
        }
    }
 
    private static final PerformanceTestCase[] testCases =
    {
        new PerformanceTestCase("Serialisation", REPETITIONS, ITEM)
        {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
 
            public void testWrite(ObjectToBeSerialised item) throws Exception
            {
                for (int i = 0; i < REPETITIONS; i++)
                {
                    baos.reset();
 
                    ObjectOutputStream oos = new ObjectOutputStream(baos);
                    oos.writeObject(item);
                    oos.close();
                }
            }
 
            public ObjectToBeSerialised testRead() throws Exception
            {
                ObjectToBeSerialised object = null;
                for (int i = 0; i < REPETITIONS; i++)
                {
                    ByteArrayInputStream bais = 
                        new ByteArrayInputStream(baos.toByteArray());
                    ObjectInputStream ois = new ObjectInputStream(bais);
                    object = (ObjectToBeSerialised)ois.readObject();
                }
 
                return object;
            }
        },
 
        new PerformanceTestCase("ByteBuffer", REPETITIONS, ITEM)
        {
            ByteBuffer byteBuffer = ByteBuffer.allocate(1024);
 
            public void testWrite(ObjectToBeSerialised item) throws Exception
            {
                for (int i = 0; i < REPETITIONS; i++)
                {
                    byteBuffer.clear();
                    item.write(byteBuffer);
                }
            }
 
            public ObjectToBeSerialised testRead() throws Exception
            {
                ObjectToBeSerialised object = null;
                for (int i = 0; i < REPETITIONS; i++)
                {
                    byteBuffer.flip();
                    object = ObjectToBeSerialised.read(byteBuffer);
                }
 
                return object;
            }
        },
 
        new PerformanceTestCase("UnsafeMemory", REPETITIONS, ITEM)
        {
            UnsafeMemory buffer = new UnsafeMemory(new byte[1024]);
 
            public void testWrite(ObjectToBeSerialised item) throws Exception
            {
                for (int i = 0; i < REPETITIONS; i++)
                {
                    buffer.reset();
                    item.write(buffer);
                }
            }
 
            public ObjectToBeSerialised testRead() throws Exception
            {
                ObjectToBeSerialised object = null;
                for (int i = 0; i < REPETITIONS; i++)
                {
                    buffer.reset();
                    object = ObjectToBeSerialised.read(buffer);
                }
 
                return object;
            }
        },
    };
}
 
abstract class PerformanceTestCase
{
    private final String name;
    private final int repetitions;
    private final ObjectToBeSerialised testInput;
    private ObjectToBeSerialised testOutput;
    private long writeTimeNanos;
    private long readTimeNanos;
 
    public PerformanceTestCase(final String name, final int repetitions,
                               final ObjectToBeSerialised testInput)
    {
        this.name = name;
        this.repetitions = repetitions;
        this.testInput = testInput;
    }
 
    public String getName()
    {
        return name;
    }
 
    public ObjectToBeSerialised getTestOutput()
    {
        return testOutput;
    }
 
    public long getWriteTimeNanos()
    {
        return writeTimeNanos;
    }
 
    public long getReadTimeNanos()
    {
        return readTimeNanos;
    }
 
    public void performTest() throws Exception
    {
        final long startWriteNanos = System.nanoTime();
        testWrite(testInput);
        writeTimeNanos = (System.nanoTime() - startWriteNanos) / repetitions;
 
        final long startReadNanos = System.nanoTime();
        testOutput = testRead();
        readTimeNanos = (System.nanoTime() - startReadNanos) / repetitions;
    }
 
    public abstract void testWrite(ObjectToBeSerialised item) throws Exception;
    public abstract ObjectToBeSerialised testRead() throws Exception;
}
 
class ObjectToBeSerialised implements Serializable
{
    private static final long serialVersionUID = 10275539472837495L;
 
    private final long sourceId;
    private final boolean special;
    private final int orderCode;
    private final int priority;
    private final double[] prices;
    private final long[] quantities;
 
    public ObjectToBeSerialised(final long sourceId, final boolean special,
                                final int orderCode, final int priority,
                                final double[] prices, final long[] quantities)
    {
        this.sourceId = sourceId;
        this.special = special;
        this.orderCode = orderCode;
        this.priority = priority;
        this.prices = prices;
        this.quantities = quantities;
    }
 
    public void write(final ByteBuffer byteBuffer)
    {
        byteBuffer.putLong(sourceId);
        byteBuffer.put((byte)(special ? 1 : 0));
        byteBuffer.putInt(orderCode);
        byteBuffer.putInt(priority);
 
        byteBuffer.putInt(prices.length);
        for (final double price : prices)
        {
            byteBuffer.putDouble(price);
        }
 
        byteBuffer.putInt(quantities.length);
        for (final long quantity : quantities)
        {
            byteBuffer.putLong(quantity);
        }
    }
 
    public static ObjectToBeSerialised read(final ByteBuffer byteBuffer)
    {
        final long sourceId = byteBuffer.getLong();
        final boolean special = 0 != byteBuffer.get();
        final int orderCode = byteBuffer.getInt();
        final int priority = byteBuffer.getInt();
 
        final int pricesSize = byteBuffer.getInt();
        final double[] prices = new double[pricesSize];
        for (int i = 0; i < pricesSize; i++)
        {
            prices[i] = byteBuffer.getDouble();
        }
 
        final int quantitiesSize = byteBuffer.getInt();
        final long[] quantities = new long[quantitiesSize];
        for (int i = 0; i < quantitiesSize; i++)
        {
            quantities[i] = byteBuffer.getLong();
        }
 
        return new ObjectToBeSerialised(sourceId, special, orderCode, 
                                        priority, prices, quantities);
    }
 
    public void write(final UnsafeMemory buffer)
    {
        buffer.putLong(sourceId);
        buffer.putBoolean(special);
        buffer.putInt(orderCode);
        buffer.putInt(priority);
        buffer.putDoubleArray(prices);
        buffer.putLongArray(quantities);
    }
 
    public static ObjectToBeSerialised read(final UnsafeMemory buffer)
    {
        final long sourceId = buffer.getLong();
        final boolean special = buffer.getBoolean();
        final int orderCode = buffer.getInt();
        final int priority = buffer.getInt();
        final double[] prices = buffer.getDoubleArray();
        final long[] quantities = buffer.getLongArray();
 
        return new ObjectToBeSerialised(sourceId, special, orderCode, 
                                        priority, prices, quantities);
    }
 
    @Override
    public boolean equals(final Object o)
    {
        if (this == o)
        {
            return true;
        }
        if (o == null || getClass() != o.getClass())
        {
            return false;
        }
 
        final ObjectToBeSerialised that = (ObjectToBeSerialised)o;
 
        if (orderCode != that.orderCode)
        {
            return false;
        }
        if (priority != that.priority)
        {
            return false;
        }
        if (sourceId != that.sourceId)
        {
            return false;
        }
        if (special != that.special)
        {
            return false;
        }
        if (!Arrays.equals(prices, that.prices))
        {
            return false;
        }
        if (!Arrays.equals(quantities, that.quantities))
        {
            return false;
        }
 
        return true;
    }
}
 
class UnsafeMemory
{
    private static final Unsafe unsafe;
    static
    {
        try
        {
            Field field = Unsafe.class.getDeclaredField("theUnsafe");
            field.setAccessible(true);
            unsafe = (Unsafe)field.get(null);
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }
 
    private static final long byteArrayOffset = unsafe.arrayBaseOffset(byte[].class);
    private static final long longArrayOffset = unsafe.arrayBaseOffset(long[].class);
    private static final long doubleArrayOffset = unsafe.arrayBaseOffset(double[].class);
 
    private static final int SIZE_OF_BOOLEAN = 1;
    private static final int SIZE_OF_INT = 4;
    private static final int SIZE_OF_LONG = 8;
 
    private int pos = 0;
    private final byte[] buffer;
 
    public UnsafeMemory(final byte[] buffer)
    {
        if (null == buffer)
        {
            throw new NullPointerException("buffer cannot be null");
        }
 
        this.buffer = buffer;
    }
 
    public void reset()
    {
        this.pos = 0;
    }
 
    public void putBoolean(final boolean value)
    {
        unsafe.putBoolean(buffer, byteArrayOffset + pos, value);
        pos += SIZE_OF_BOOLEAN;
    }
 
    public boolean getBoolean()
    {
        boolean value = unsafe.getBoolean(buffer, byteArrayOffset + pos);
        pos += SIZE_OF_BOOLEAN;
 
        return value;
    }
 
    public void putInt(final int value)
    {
        unsafe.putInt(buffer, byteArrayOffset + pos, value);
        pos += SIZE_OF_INT;
    }
 
    public int getInt()
    {
        int value = unsafe.getInt(buffer, byteArrayOffset + pos);
        pos += SIZE_OF_INT;
 
        return value;
    }
 
    public void putLong(final long value)
    {
        unsafe.putLong(buffer, byteArrayOffset + pos, value);
        pos += SIZE_OF_LONG;
    }
 
    public long getLong()
    {
        long value = unsafe.getLong(buffer, byteArrayOffset + pos);
        pos += SIZE_OF_LONG;
 
        return value;
    }
 
    public void putLongArray(final long[] values)
    {
        putInt(values.length);
 
        long bytesToCopy = values.length << 3;
        unsafe.copyMemory(values, longArrayOffset,
                          buffer, byteArrayOffset + pos,
                          bytesToCopy);
        pos += bytesToCopy;
    }
 
    public long[] getLongArray()
    {
        int arraySize = getInt();
        long[] values = new long[arraySize];
 
        long bytesToCopy = values.length << 3;
        unsafe.copyMemory(buffer, byteArrayOffset + pos,
                          values, longArrayOffset,
                          bytesToCopy);
        pos += bytesToCopy;
 
        return values;
    }
 
    public void putDoubleArray(final double[] values)
    {
        putInt(values.length);
 
        long bytesToCopy = values.length << 3;
        unsafe.copyMemory(values, doubleArrayOffset,
                          buffer, byteArrayOffset + pos,
                          bytesToCopy);
        pos += bytesToCopy;
    }
 
    public double[] getDoubleArray()
    {
        int arraySize = getInt();
        double[] values = new double[arraySize];
 
        long bytesToCopy = values.length << 3;
        unsafe.copyMemory(buffer, byteArrayOffset + pos,
                          values, doubleArrayOffset,
                          bytesToCopy);
        pos += bytesToCopy;
 
        return values;
    }
}
```

Results
---
```
2.8GHz Nehalem - Java 1.7.0_04
==============================
0 Serialisation  write=2,517ns read=11,570ns total=14,087ns
1 Serialisation  write=2,198ns read=11,122ns total=13,320ns
2 Serialisation  write=2,190ns read=11,011ns total=13,201ns
3 Serialisation  write=2,221ns read=10,972ns total=13,193ns
4 Serialisation  write=2,187ns read=10,817ns total=13,004ns
0 ByteBuffer     write=264ns   read=273ns    total=537ns
1 ByteBuffer     write=248ns   read=243ns    total=491ns
2 ByteBuffer     write=262ns   read=243ns    total=505ns
3 ByteBuffer     write=300ns   read=240ns    total=540ns
4 ByteBuffer     write=247ns   read=243ns    total=490ns
0 UnsafeMemory   write=99ns    read=84ns     total=183ns
1 UnsafeMemory   write=53ns    read=82ns     total=135ns
2 UnsafeMemory   write=63ns    read=66ns     total=129ns
3 UnsafeMemory   write=46ns    read=63ns     total=109ns
4 UnsafeMemory   write=48ns    read=58ns     total=106ns

2.4GHz Sandy Bridge - Java 1.7.0_04
===================================
0 Serialisation  write=1,940ns read=9,006ns total=10,946ns
1 Serialisation  write=1,674ns read=8,567ns total=10,241ns
2 Serialisation  write=1,666ns read=8,680ns total=10,346ns
3 Serialisation  write=1,666ns read=8,623ns total=10,289ns
4 Serialisation  write=1,715ns read=8,586ns total=10,301ns
0 ByteBuffer     write=199ns   read=198ns   total=397ns
1 ByteBuffer     write=176ns   read=178ns   total=354ns
2 ByteBuffer     write=174ns   read=174ns   total=348ns
3 ByteBuffer     write=172ns   read=183ns   total=355ns
4 ByteBuffer     write=174ns   read=180ns   total=354ns
0 UnsafeMemory   write=38ns    read=75ns    total=113ns
1 UnsafeMemory   write=26ns    read=52ns    total=78ns
2 UnsafeMemory   write=26ns    read=51ns    total=77ns
3 UnsafeMemory   write=25ns    read=51ns    total=76ns
4 UnsafeMemory   write=27ns    read=50ns    total=77ns
```

Analysis
---

To write and read back a single relatively small object on my fast 2.4 GHz Sandy Bridge laptop can take ~10,000ns using Java Serialization, whereas when using Unsafe this can come down to well less than 100ns even accounting for the test code itself.  To put this in context, when using Java Serialization the costs are on par with a network hop!  Now that would be very costly if your transport is a fast IPC mechanism on the same system.

There are numerous reasons why Java Serialisation is so costly.  For example it writes out the fully qualified class and field names for each object plus version information.  Also ObjectOutputStream keeps a collection of all written objects so they can be conflated when close() is called.   Java Serialisation requires 340 bytes for this example object, yet we only require 185 bytes for the binary versions.  Details for the Java Serialization format can be found here.  If I had not used arrays for the majority of data, then the serialised object would have been significantly larger with Java Serialization because of the field names.  In my experience text based protocols like XML and JSON can be even less efficient than Java Serialization.  Also be aware that Java Serialization is the standard mechanism employed for RMI.

The real issue is the number of instructions to be executed.  The Unsafe method wins by a significant margin because in Hotspot, and many other JVMs, the optimiser treats these operations as intrinsics and replaces the call with assembly instructions to perform the memory manipulation.  For primitive types this results in a single x86 MOV instruction which can often happen in a single cycle.  The details can be seen by having Hotspot output the optimised code as I described in a previous article.

Now it has to be said that "with great power comes great responsibility" and if you use Unsafe it is effectively the same as programming in C, and with that can come memory access violations when you get offsets wrong.

Adding Some Context
---

"What about the likes of Google Protocol Buffers?", I hear you cry out.  These are very useful libraries and can often offer better performance and more flexibility than Java Serialisation.  However they are not remotely close to the performance of using Unsafe like I have shown here.  Protocol Buffers solve a different problem and provide nice self-describing messages which work well across languages.  Please test with different protocols and serialisation techniques to compare results.

Also the astute among you will be asking, "What about Endianness (byte-ordering) of the integers written?"  With Unsafe the bytes are written in native order.  This is great for IPC and between systems of the same type.  When systems use differing formats then conversion will be necessary.

How do we deal with multiple versions of a class or determining what class an object belongs to?  I want to keep this article focused but let's say a simple integer to indicate the implementation class is all that is required for a header.  This integer can be used to look up the appropriately implementation for the de-serialisation operation.

An argument I often hear against binary protocols, and for text protocols, is what about being human readable and debugging?  There is an easy solution to this.  Develop a tool for reading the binary format!

Conclusion
---

In conclusion it is possible to achieve the same native C/C++ like levels of performance in Java for serialising an object to-and-from a byte stream by effectively using the same techniques.  The UnsafeMemory class, for which I've provided a skeleton implementation, could easily be expanded to encapsulate this behaviour and thus protect oneself from many of the potential issues when dealing with such a sharp tool.

Now for the burning question.  Would it not be so much better if Java offered an alternative Marshallable interface to Serializable by offering natively what I've effectively done with Unsafe???
